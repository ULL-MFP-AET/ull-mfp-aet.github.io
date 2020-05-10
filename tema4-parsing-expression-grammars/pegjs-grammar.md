# PEG.js Grammar

See [https://github.com/pegjs/pegjs/blob/master/src/parser.pegjs](https://github.com/pegjs/pegjs/blob/master/src/parser.pegjs) for latest version

```
    [~/srcPLgrado/pegjs(master)]$ cat src/parser.pegjs 
```
```
    grammar
      = __ initializer? rule+ 

    initializer
      = action semicolon? 

    rule
      = identifier string? equals expression semicolon? 

    expression
      = choice

    choice
      = sequence (slash sequence)* 

    sequence
      = labeled* action 
      / labeled* 

    labeled
      = identifier colon prefixed 
      / prefixed

    prefixed
      = dollar suffixed 
      / and action 
      / and suffixed 
      / not action 
      / not suffixed 
      / suffixed

    suffixed
      = primary question 
      / primary star 
      / primary plus 
      / primary

    primary
      = identifier !(string? equals) 
      / literal
      / class
      / dot 
      / lparen expression rparen 

    /* "Lexical" elements */

    action "action"
      = braced __ 

    braced
      = "{" (braced / nonBraceCharacters)* "}"

    nonBraceCharacters
      = nonBraceCharacter+

    nonBraceCharacter
      = [^{}]

    equals    = "=" __ 
    colon     = ":" __ 
    semicolon = ";" __ 
    slash     = "/" __ 
    and       = "&" __ 
    not       = "!" __ 
    dollar    = "$" __ 
    question  = "?" __ 
    star      = "*" __ 
    plus      = "+" __ 
    lparen    = "(" __ 
    rparen    = ")" __ 
    dot       = "." __ 

    /*
     * Modeled after ECMA-262, 5th ed., 7.6, but much simplified:
     *
     * * no Unicode escape sequences
     *
     * * "Unicode combining marks" and "Unicode connection punctuation" can't be
     *   part of the identifier
     *
     * * only [a-zA-Z] is considered a "Unicode letter"
     *
     * * only [0-9] is considered a "Unicode digit"
     *
     * The simplifications were made just to make the implementation little bit
     * easier, there is no "philosophical" reason behind them.
     *
     * Contrary to ECMA 262, the "$" character is not valid because it serves other
     * purpose in the grammar.
     */
    identifier "identifier"
      = (letter / "_") (letter / digit / "_")* __ 

    /*
     * Modeled after ECMA-262, 5th ed., 7.8.4. (syntax & semantics, rules only
     * vaguely).
     */
    literal "literal"
      = (doubleQuotedString / singleQuotedString) "i"? __ 

    string "string"
      = (doubleQuotedString / singleQuotedString) __ 

    doubleQuotedString
      = '"' doubleQuotedCharacter* '"' 

    doubleQuotedCharacter
      = simpleDoubleQuotedCharacter
      / simpleEscapeSequence
      / zeroEscapeSequence
      / hexEscapeSequence
      / unicodeEscapeSequence
      / eolEscapeSequence

    simpleDoubleQuotedCharacter
      = !('"' / "\\" / eolChar) . 

    singleQuotedString
      = "'" singleQuotedCharacter* "'" 

    singleQuotedCharacter
      = simpleSingleQuotedCharacter
      / simpleEscapeSequence
      / zeroEscapeSequence
      / hexEscapeSequence
      / unicodeEscapeSequence
      / eolEscapeSequence

    simpleSingleQuotedCharacter
      = !("'" / "\\" / eolChar) . 

    class "character class"
      = "[" "^"? (classCharacterRange / classCharacter)* "]" "i"? __ 

    classCharacterRange
      = classCharacter "-" classCharacter 

    classCharacter
      = bracketDelimitedCharacter 

    bracketDelimitedCharacter
      = simpleBracketDelimitedCharacter
      / simpleEscapeSequence
      / zeroEscapeSequence
      / hexEscapeSequence
      / unicodeEscapeSequence
      / eolEscapeSequence

    simpleBracketDelimitedCharacter
      = !("]" / "\\" / eolChar) . 

    simpleEscapeSequence
      = "\\" !(digit / "x" / "u" / eolChar) . 

    zeroEscapeSequence
      = "\\0" !digit 

    hexEscapeSequence
      = "\\x" hexDigit hexDigit)

    unicodeEscapeSequence
      = "\\u" hexDigit hexDigit hexDigit hexDigit)

    eolEscapeSequence
      = "\\" eol 

    digit
      = [0-9]

    hexDigit
      = [0-9a-fA-F]

    letter
      = lowerCaseLetter
      / upperCaseLetter

    lowerCaseLetter
      = [a-z]

    upperCaseLetter
      = [A-Z]

    __ = (whitespace / eol / comment)*

    /* Modeled after ECMA-262, 5th ed., 7.4. */
    comment "comment"
      = singleLineComment
      / multiLineComment

    singleLineComment
      = "//" (!eolChar .)*

    multiLineComment
      = "/*" (!"*/" .)* "*/"

    /* Modeled after ECMA-262, 5th ed., 7.3. */
    eol "end of line"
      = "\n"
      / "\r\n"
      / "\r"
      / "\u2028"
      / "\u2029"

    eolChar
      = [\n\r\u2028\u2029]

    /* Modeled after ECMA-262, 5th ed., 7.2. */
    whitespace "whitespace"
      = [ \t\v\f\u00A0\uFEFF\u1680\u180E\u2000-\u200A\u202F\u205F\u3000]
```

# Getting the AST for a Grammar

```js
[~/.../pegjs/examples(master)]$ node
Welcome to Node.js v12.10.0.
Type ".help" for more information.
> peg = require("pegjs")
{
  VERSION: '0.10.0',
  GrammarError: [Function: GrammarError],
  parser: {
    SyntaxError: [Function: peg$SyntaxError] { buildMessage: [Function] },
    parse: [Function: peg$parse]
  },
  compiler: {
    visitor: { build: [Function: build] },
    passes: { check: [Object], transform: [Object], generate: [Object] },
    compile: [Function: compile]
  },
  generate: [Function: generate]
}
> grammar = "s = 'a'";
"s = 'a'"
> ast = peg.parser.parse(grammar)
{
  type: 'grammar',
  initializer: null,
  rules: [
    {
      type: 'rule',
      name: 's',
      expression: [Object],
      location: [Object]
    }
  ],
  location: {
    start: { offset: 0, line: 1, column: 1 },
    end: { offset: 7, line: 1, column: 8 }
  }
}
> ins = x => util.inspect(x, {depth:null})
> ins(ast)
'{\n' +
  "  type: 'grammar',\n" +
  '  initializer: null,\n' +
  '  rules: [\n' +
  '    {\n' +
  "      type: 'rule',\n" +
  "      name: 's',\n" +
  '      expression: {\n' +
  "        type: 'literal',\n" +
  "        value: 'a',\n" +
  '        ignoreCase: false,\n' +
  '        location: {\n' +
  '          start: { offset: 4, line: 1, column: 5 },\n' +
  '          end: { offset: 7, line: 1, column: 8 }\n' +
  '        }\n' +
  '      },\n' +
  '      location: {\n' +
  '        start: { offset: 0, line: 1, column: 1 },\n' +
  '        end: { offset: 7, line: 1, column: 8 }\n' +
  '      }\n' +
  '    }\n' +
  '  ],\n' +
  '  location: {\n' +
  '    start: { offset: 0, line: 1, column: 1 },\n' +
  '    end: { offset: 7, line: 1, column: 8 }\n' +
  '  }\n' +
  '}'
```