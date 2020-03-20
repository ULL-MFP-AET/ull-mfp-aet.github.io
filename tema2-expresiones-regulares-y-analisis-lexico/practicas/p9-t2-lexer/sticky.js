function buildLexer(lexemes) {
  let tokens = lexemes.slice(0);

  const buildOrRegexp = (regexps) => {
    const sources = regexps.map(r => r.source);
    const union = sources.join('|');
    //console.log(union);
    return new RegExp(union, 'y');
  };

  tokens.push(['ERROR', /(?<ERROR>(.|\n)+)/]);
  const tokenNames = tokens.map(t => t[0]);
  const tokenRegs  = tokens.map(t => t[1]);
  const regexp = buildOrRegexp(tokenRegs);
  //console.log(regexp);
  const getToken = (m) => tokenNames.find(tn => typeof m[tn] !== 'undefined');

  return str => {
    let result = [];
    let match;
    while (match = regexp.exec(str)) {
      //console.log(match.groups);
      let t = getToken(match.groups);
      //if (t === 'ERROR') throw `Unxpected token! '${str.substring(regexp.lastIndex)}'`;
      //console.log(`Found token '${t}' with value '${match.groups[t]}'`)
      if (t !== 'SPACE')
        result.push({ type: t, value: match.groups[t]});
    }
    return result;
  }
}

// main 

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

str = 'let x = a + b';
console.log(str);
r = lexer(str);
ins(r);

// Entrada con errores
str = 'let x = 42*c';
console.log(str);
r = lexer(str);
ins(r);
