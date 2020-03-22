---
layout: default
title: p4-t2-lexer
permalink: /tema2-expresiones-regulares-y-analisis-lexico/practicas/p4-t2-lexer/
previous: 
  url: /tema2-expresiones-regulares-y-analisis-lexico/practicas/p9-t2-lexer/
repo: https://github.com/ULL-ESIT-PL-1819/regexp-exercises/blob/master/
---

# Lexer Generator (p4-t2-lexer)

## Descripción

Generalizar este código:


```js
const str = 'const varName = "value"';
console.log(str);

const SPACE = /(?<SPACE>\s+)/;
const RESERVEDWORD = /(?<RESERVEDWORD>\b(const|let)\b)/;
const ID = /(?<ID>([a-z_]\w+))/;
const STRING = /(?<STRING>"([^\\"]|\\.")*")/;
const OP = /(?<OP>[+*\/=-])/;

const tokens = [
  ['SPACE', SPACE], ['RESERVEDWORD', RESERVEDWORD], ['ID', ID], 
  ['STRING', STRING], ['OP', OP] 
];

const tokenNames = tokens.map(t => t[0]);
const tokenRegs  = tokens.map(t => t[1]);

const buildOrRegexp = (regexps) => {
  const sources = regexps.map(r => r.source);
  const union = sources.join('|');
  // console.log(union);
  return new RegExp(union, 'y');
};

const regexp = buildOrRegexp(tokenRegs);

const getToken = (m) => tokenNames.find(tn => typeof m[tn] !== 'undefined');

let match;
while (match = regexp.exec(str)) {
  //console.log(match.groups);
  let t = getToken(match.groups);
  console.log(`Found token '${t}' with value '${match.groups[t]}'`);
}
```

escribiendo una función `makeLexer` que recibe como argumentos un array `tokens`
como en el ejemplo y retorna una función que hace el análisis léxico 
correspondiente a esos tokens.

## Pruebas

```
[~/.../github-actions-learning/lexer-generator(master)]$ pwd -P
/Users/casiano/local/src/github-actions-learning/lexer-generator
[~/.../github-actions-learning/lexer-generator(master)]$ cat test.js
```
```js
// If you want debugging output run it this way:
// DEBUG=1 npm test
const debug = process.env["DEBUG"];
const { inspect } = require('util');
const ins = (x) => { if (debug) console.log(inspect(x, {depth: null})) };

const buildLexer =require('./index');

const SPACE = /(?<SPACE>\s+|\/\/.*)/;
const RESERVEDWORD = /(?<RESERVEDWORD>\b(const|let)\b)/;
const ID = /(?<ID>\b([a-z_]\w*))\b/;
const STRING = /(?<STRING>"([^\\"]|\\.")*")/;
const OP = /(?<OP>[+*\/=-])/;

const myTokens = [
  ['SPACE', SPACE], ['RESERVEDWORD', RESERVEDWORD], ['ID', ID],
  ['STRING', STRING], ['OP', OP]
];

let str, lexer, r;
lexer = buildLexer(myTokens);

str = 'const varName = "value"';
ins(str);
r = lexer(str);
ins(r);
let expected = [
  { type: 'RESERVEDWORD', value: 'const' },
  { type: 'ID', value: 'varName' },
  { type: 'OP', value: '=' },
  { type: 'STRING', value: '"value"' }
];

test(str, () => {
  expect(r).toEqual(expected);
});

str = 'let x = a + \nb';
ins(str);
r = lexer(str);
expected = [
  { type: 'RESERVEDWORD', value: 'let' },
  { type: 'ID', value: 'x' },
  { type: 'OP', value: '=' },
  { type: 'ID', value: 'a' },
  { type: 'OP', value: '+' },
  { type: 'ID', value: 'b' }
];
ins(r);
test(str, () => {
  expect(r).toEqual(expected);
});

str = ' // Entrada con errores\nlet x = 42*c';
ins(str);
r = lexer(str);
ins(r);
expected = [
  { type: 'RESERVEDWORD', value: 'let' },
  { type: 'ID', value: 'x' },
  { type: 'OP', value: '=' },
  { type: 'ERROR', value: '42*c' }
];

test(str, () => {
  expect(r).toEqual(expected);
});
```

```
[~/.../github-actions-learning/lexer-generator(master)]$ npm test

> @ULL-ESIT-PL-1920/lexer-generator@1.0.0 test /Users/casiano/local/src/github-actions-learning/lexer-generator
> jest

 PASS  ./test.js
  ✓ const varName = "value" (4ms)
  ✓ let x = a +
b
  ✓  // Entrada con errores
let x = 42*c (1ms)

Test Suites: 1 passed, 1 total
Tests:       3 passed, 3 total
Snapshots:   0 total
Time:        1.126s
Ran all test suites.
```

## Publicar como paquete npm en GitHub Registry

Publique el paquete dentro del repo de la organización de la asigntura con nombre `lexical-generator-aluXXXX-nombre-apellidos`
* Sección [Creando y Publicando un módulo npm]({{site.baseurl}}/tema1-introduccion-a-javascript/creating-and-publishing-npm-module)
* Sección [Módulos]({{site.baseurl}}/tema1-introduccion-a-javascript/modulos)
* Sección [Node.js Packages]({{site.baseurl}}/tema1-introduccion-a-javascript/nodejspackages)
* Sección [GitHub Registry]({{site.baseurl}}/tema1-introduccion-a-javascript/github-registry)