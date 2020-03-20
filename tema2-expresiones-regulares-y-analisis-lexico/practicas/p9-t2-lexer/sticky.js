function buildLexer(tokens) {

  const buildOrRegexp = (regexps) => {
    const sources = regexps.map(r => r.source);
    const union = sources.join('|');
    console.log(union);
    return new RegExp(union, 'y');
  };

  return str => {
    tokens.push(['ERROR', /(?<ERROR>.|\n)/])
    const tokenNames = tokens.map(t => t[0]);
    const tokenRegs  = tokens.map(t => t[1]);
    const regexp = buildOrRegexp(tokenRegs);
    console.log(regexp);
    const getToken = (m) => tokenNames.find(tn => typeof m[tn] !== 'undefined');
    let result = [];
    let match;
    while (match = regexp.exec(str)) {
      console.log(match.groups);
      let t = getToken(match.groups);
      if (t === 'ERROR') throw `Unxpected token! '${str.substring(regexp.lastIndex)}'`;
      //console.log(`Found token '${t}' with value '${match.groups[t]}'`)
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

let str, lexer, r;

/*
let str = 'const varName = "value"';
console.log(str);

let lexer = buildLexer(myTokens);
let r = lexer(str);
r.forEach((t, i) => {
  console.log(`Found token '${t.type}' with value '${t.value}'`);
});
*/

lexer = buildLexer(myTokens);
str = 'let x = a + b';
console.log(str);
r = lexer(str);
r.forEach((t, i) => {
  console.log(`Found token '${t.type}' with value '${t.value}'`);
});

