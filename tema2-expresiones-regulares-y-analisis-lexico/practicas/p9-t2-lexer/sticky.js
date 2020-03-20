// main 

const buildLexer =require('./lexer-generator');

const SPACE = /(?<SPACE>\s+)/;
const RESERVEDWORD = /(?<RESERVEDWORD>\b(const|let)\b)/;
const ID = /(?<ID>\b([a-z_]\w*))\b/;
const STRING = /(?<STRING>"([^\\"]|\\.")*")/;
const OP = /(?<OP>[+*\/=-])/;

const myTokens = [
  ['SPACE', SPACE], ['RESERVEDWORD', RESERVEDWORD], ['ID', ID], 
  ['STRING', STRING], ['OP', OP] 
];

const { inspect } = require('util');
const ins = (x) => console.log(inspect(x, {depth: null}));
let str, lexer, r;
lexer = buildLexer(myTokens);

str = 'const varName = "value"';
console.log(str);
r = lexer(str);
ins(r);

str = 'let x = a + \nb';
console.log(str);
r = lexer(str);
ins(r);

// Entrada con errores
str = 'let x = 42*c';
console.log(str);
r = lexer(str);
ins(r);
