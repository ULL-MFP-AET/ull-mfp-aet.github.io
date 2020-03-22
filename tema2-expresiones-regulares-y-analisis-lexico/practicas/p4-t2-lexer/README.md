---
layout: default
title: p4-t2-lexer
permalink: /tema2-expresiones-regulares-y-analisis-lexico/practicas/p4-t2-lexer/
previous: 
  url: /tema2-expresiones-regulares-y-analisis-lexico/practicas/p9-t2-lexer/
repo: https://github.com/ULL-ESIT-PL-1819/regexp-exercises/blob/master/
---

## Reto

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
