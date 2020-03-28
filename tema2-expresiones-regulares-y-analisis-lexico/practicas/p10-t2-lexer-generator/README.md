---
layout: default
title: p10-t2-lexer-generator
permalink: /tema2-expresiones-regulares-y-analisis-lexico/practicas/p10-t2-lexer-generator/
previous: 
  url: /tema2-expresiones-regulares-y-analisis-lexico/practicas/p9-t2-lexer/
---

# Lexer Generator (p10-t2-lexer-generator)

## Objetivos

Usando el repo de la asignación de esta tarea construya un paquete npm y 
publíquelo como paquete privado en GitHub Registry con ámbito `@ULL-ESIT-PL-1920`  y con nombre el nombre de su repo `p10-t2-lexgen-code-aluAtGitHub`

La mayor parte de los conceptos y habilidades a adquirir con esta práctica se explican en la sección [Creating and publishing a node.js module en GitHub y en NPM]({{site.baseurl}}/tema1-introduccion-a-javascript/creating-and-publishing-npm-module). 

El módulo deberá exportar una función que construye analizadores léxicos:

```js
const buildLexer =require('@ULL-ESIT-PL-1920/p10-t2-lexer-generator-aluAtGitHub');
```

La función `buildLexer` se llamará con un objeto que describe el léxico del lenguaje y retornará una función `lexer` que es la que hace el análisis léxico:

```
lexer = buildLexer(myTokens)
```

cuando `lexer` es llamada con una cadena de entrada retorna la secuencia de tokens de esa cadena conforme a la descripción léxica proveída:

```js
> lexer('const varName = "value"');
[
  { type: 'RESERVEDWORD', value: 'const' },
  { type: 'ID', value: 'varName' },
  { type: 'OP', value: '=' },
  { type: 'STRING', value: '"value"' }
];
```

## Descripción del Lenguaje Léxico: parámetros de entrada de la función 

El léxico del lenguaje se describe mediante un array de pares `[String, /regExp/]`:

```js
[[nombreDelToken1, /regExpDelToken1/] ... [nombreDelTokenN, /regExpDelTokenN/]
```

Sigue un ejemplo de descripción de un analizador léxico 
para un pequeño lenguaje:

```js
const SPACE = /(?<SPACE>\s+)/;
const RESERVEDWORD = /(?<RESERVEDWORD>\b(const|let)\b)/;
const ID = /(?<ID>\b([a-z_]\w*))\b/;
const STRING = /(?<STRING>"([^\\"]|\\.")*")/;
const OP = /(?<OP>[+*\/=-])/;

const myTokens = [
  ['SPACE', SPACE], ['RESERVEDWORD', RESERVEDWORD], ['ID', ID],
  ['STRING', STRING], ['OP', OP]
];
```

Se establecen las siguientes consideraciones semánticas:

* Si un token tiene de nombre `SPACE` sus matching serán ignorados y no se añadirán a la lista de tokens 
* El nombre de token `ERROR` no puede ser usado por los clientes de la librería y es automáticamente generado por los analizadores léxicos producidos en caso de que se produzca un error. 
* [Véase el último ejemplo con errores en la sección Pruebas](#pruebas)

## Sugerencias

Puede partir de este código que hemos visto en clase en el que se combina el uso de sticky y los grupos con nombre


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

Deberá añadir pruebas usando [Jest]({{site.baseurl}}/tema1-introduccion-a-javascript/jest}). Amplíe este ejemplo:

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
> jest        👈 use jest!

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

## Integración Contínua usando GitHub Actions

Use [GitHub Actions]({{site.baseurl}}/tema1-introduccion-a-javascript/github-actions) para la ejecución de las pruebas

## Documentación

[Documente]({{site.baseurl}}/tema1-introduccion-a-javascript/documentation)
el módulo incorporando un `README.md` y la documentación de la función exportada.

## Publicar como paquete npm en GitHub Registry

Usando el repo de la asignación de esta tarea publique el paquete como paquete privado en GitHub Registry con ámbito `@ULL-ESIT-PL-1920`  y nombre el nombre de su repo `p10-t2-lexgen-code-aluAtGitHub`

## Pruebas de Producción

En un nuevo repo `p10-t2-lexgen-testing-aluGitHub` añada las pruebas
para comprobar que el paquete publicado 
se instala y puede ser usado correctamente.

Usando `git submodule` configure un super-repo para que contenga
a ambos repos: el del módulo `p10-t2-lexgen-code-aluAtGitHub` y el repo de pruebas de producción `p10-t2-lexgen-testing-aluGitHub`.

## Semantic Versioning

Publique una mejora en la funcionalidad del módulo. Por ejemplo añada la opción `/u`
a la expresión regular creada para que Unicode sea soportado. ¿Como debe cambiar el nº de versión?

## Referencias

* Sección [Creating and publishing a node.js module en GitHub y en NPM]({{site.baseurl}}/tema1-introduccion-a-javascript/creating-and-publishing-npm-module)
* [Jest]({{site.baseurl}}/tema1-introduccion-a-javascript/jest)
* Sección [GitHub Registry]({{site.baseurl}}/tema1-introduccion-a-javascript/github-registry)
* Sección [GitHub Actions]({{site.baseurl}}/tema1-introduccion-a-javascript/github-actions)
* Sección [Módulos]({{site.baseurl}}/tema1-introduccion-a-javascript/modulos)
* Sección [Node.js Packages]({{site.baseurl}}/tema1-introduccion-a-javascript/nodejspackages)
* Sección [Documentation]({{site.baseurl}}/tema1-introduccion-a-javascript/documentation)
