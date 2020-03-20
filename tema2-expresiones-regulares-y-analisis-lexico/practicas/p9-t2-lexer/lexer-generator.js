// Key 'SPACE' means white space
// Key 'ERROR' is reserved

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

module.exports = buildLexer;
