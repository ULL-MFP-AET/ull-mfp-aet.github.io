# What is a Compiler

* [What is a Compiler?]({{site.baseurl}}/assets/pdfs/cs4200-2018-1-introduction-180905091549.pdf) slides by Eelco Visser. TU Delft. September 2018

## What is a Linker

* [Linker. Wikipedia](https://en.wikipedia.org/wiki/Linker_(computing))

{% include image.html 
url="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Linker.svg/330px-Linker.svg.png" 
description="<i>An illustration of the linking process. Object files and static libraries are assembled into a new library or executable</i>"
style="
  background: white;
  width: 20%;
  display: block;
  margin-left: auto;
  margin-right: auto;
"
 %}

{% include image.html url="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Commodore_Grace_M._Hopper%2C_USN_%28covered%29.jpg/330px-Commodore_Grace_M._Hopper%2C_USN_%28covered%29.jpg"
description="Rear Admiral (then Commodore) Grace M. Hopper, 1984. By 1952, Hopper had finished her program linker (originally called a compiler), which was written for the A-0 System."
style="
  background: white;
  width: 20%;
  display: block;
  margin-left: auto;
  margin-right: auto;
"
%}

## Esprima/Espree Examples

Espree started out as a fork of [Esprima](http://esprima.org) v1.2.2, the last stable published released of Esprima before work on ECMAScript 6 began. Espree is now built on top of [Acorn](https://github.com/ternjs/acorn), which has a modular architecture that allows extension of core functionality. The goal of Espree is to produce output that is similar to Esprima with a similar API so that it can be used in place of Esprima.

### REPL example

```js
> esprima = require('esprima')
{ parse: [Function: parse],
  parseModule: [Function: parseModule],
  parseScript: [Function: parseScript],
  tokenize: [Function: tokenize],
  Syntax: 
   { ... },
  version: '4.0.1' }

> esprima.tokenize('answer = 42', { range: true })
[ { type: 'Identifier', value: 'answer', range: [ 0, 6 ] },
  { type: 'Punctuator', value: '=', range: [ 7, 8 ] },
  { type: 'Numeric', value: '42', range: [ 9, 11 ] } ]

> esprima.parseScript('const answer = 42', { tokens: true })
Script {
  type: 'Program',
  body: 
   [ VariableDeclaration {
       type: 'VariableDeclaration',
       declarations: [Array],
       kind: 'const' } ],
  sourceType: 'script',
  tokens: 
   [ { type: 'Keyword', value: 'const' },
     { type: 'Identifier', value: 'answer' },
     { type: 'Punctuator', value: '=' },
     { type: 'Numeric', value: '42' } ] }

> inspect = require('util')
{ ... }

> console.log(util.inspect(esprima.parseScript('answer = 42'), {depth: null}))
Script {
  type: 'Program',
  body: 
   [ ExpressionStatement {
       type: 'ExpressionStatement',
       expression: 
        AssignmentExpression {
          type: 'AssignmentExpression',
          operator: '=',
          left: Identifier { type: 'Identifier', name: 'answer' },
          right: Literal { type: 'Literal', value: 42, raw: '42' } } } ],
  sourceType: 'script' }
undefined
> 
```

### PEG.js Example

`altjs.coffee` is the code for the "AltJS language in 5 minutes" section
presented in the second half of the talk.

### Extra Special Bonus!

`idgrep.coffee` (and `idgrep.js`) is another example of using Esprima
to do static analysis on JavaScript code.


## ASTExplorer

* <a href="https://astexplorer.net/" target="_blank">astexplorer.net demo</a>
* <a href="https://astexplorer.net/#/gist/b5826862c47dfb7dbb54cec15079b430/latest" target="_blank">AST de <code>answer = 42</code></a>

## Repo

En el [Repo ULL-ESIT-GRADOII-PL/esprima-pegjs-jsconfeu-talk](https://github.com/ULL-ESIT-GRADOII-PL/esprima-pegjs-jsconfeu-talk) encontrará el material de esta lección


## Talk Master the Art of the AST and Take Control of Your JS by Yonatan Mevorach

* [Master the Art of the AST and Take Control of Your JS][ast]  by Yonatan Mevorach. 
    - [Here are the slides](https://github.com/ULL-ESIT-GRADOII-PL/esprima-pegjs-jsconfeu-talk-private/blob/private/ast-talk-codemotion-170406094223.pdf)

* [Here is another version of the talk at Javascript Israel](https://500tech.com/blog/all/yonatan-mevorach-on-abstract-syntax-trees) 

* [Talk on the same topic at Javascript Israel](https://500tech.com/blog/all/yonatan-mevorach-on-abstract-syntax-trees)  by Yonatan Mevorach

[ast]: https://youtu.be/C06MohLG_3s

### ASTExplorer

* <a href="https://astexplorer.net/" target="_blank">astexplorer.net demo</a>

### ESLint Piggyback example

* <a href="https://eslint.org/docs/developer-guide/working-with-plugins" target="_blank">ESLint: Working with Plugins</a>
* <a href="https://github.com/cowchimp/eslint-plugin-piggyback" target="_blank">eslint-plugin-piggyback</a>

### Babel remove "debugger" example

* <a href="http://docs.w3cub.com/babel/plugins/transform-remove-debugger/" target="_blank">Babel plugin Remove debugger transform. This plugin removes all `debugger;` statements</a>
* <a href="https://github.com/babel/minify/tree/a24dd066f16db5a7d5ab13c2af65e767347ef550/packages/babel-plugin-transform-remove-debugger" target="_blank">babel-plugin-transform-remove-debugger at GitHub</a>

### jscodeshift example

* <a href="https://github.com/facebook/jscodeshift" target="_blank">codeshift at GitHub</a>
* <a href="https://www.toptal.com/javascript/write-code-to-rewrite-your-code" target="_blank">Write Code to Rewrite Your Code: jscodeshift</a>
* <a href="https://glebbahmutov.com/blog/jscodeshift-example/" target="_blank">jscodeshift example</a>
* <a href="https://github.com/cpojer/js-codemod/blob/master/transforms/no-vars.js" target="_blank">jscodeshift cpojer/js-codemod no-vars.js</a>

### Repositorios interesantes de cowchimp

* <a href="https://github.com/cowchimp/astscout" target="_blank">AST Scout is a tool for analyzing and visualizing the relationship between the public API of a Class\Module and its implementations details (e.g. private methods, dependencies used).</a>
* <a href="https://github.com/cowchimp/astexplorer" target="_blank">A web tool to explore the ASTs generated by various parsers. https://astexplorer.net/</a>
* <a href="https://github.com/cowchimp/awesome-ast" target="_blank">A curated list of awesome AST resources</a>


