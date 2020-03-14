# Tema 2: Expresiones Regulares y Análisis Léxico

## Expresiones Regulares

### El Constructor

* [EJS: Creating a regular expression](https://eloquentjavascript.net/09_regexp.html#h_5w4yGFJRYl)


The `RegExp` constructor creates a regular expression object for matching text with a pattern.

Literal and constructor notations are possible:

```js
/pattern/flags; 
new RegExp(pattern [, flags]);
```

* The literal notation provides compilation of the regular expression
when the expression is evaluated. 
* Use literal notation when the regular
expression will remain constant. 
* For example, if you use literal notation
to construct a regular expression used in a loop, the regular expression
won't be recompiled on each iteration.
* The constructor of the regular expression object, for example,
`new RegExp("ab+c")`, provides runtime compilation of the regular
expression. 
* Use the constructor function when you know the regular
expression pattern will be changing, or you don't know the pattern and
are getting it from another source, such as user input.
* When using the constructor function, the normal string escape rules
(preceding special characters with `\` when included in a string) are
necessary. For example, the following are equivalent:

```js
var re = /\w+/;
var re = new RegExp("\\w+");
```

#### Ejercicio

- Ejercicio: [Usar new Regexp("string") versus slash literal](https://youtu.be/ASQ35gSjmeI). Similitudes y diferencias. Vídeo del profesor
- [![](http://i3.ytimg.com/vi/ASQ35gSjmeI/hqdefault.jpg)](https://youtu.be/ASQ35gSjmeI)
- Explique la diferencia observada entre las dos formas de construir una RegExp

### Test

* [EJS: Testing for matches](https://eloquentjavascript.net/09_regexp.html#h_vPyyYjMEtz)

### exec

*  RegExp.prototype.[exec](https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/RegExp/exec)

The `exec()` method executes a search for a match in a specified string. Returns a result array, or `null`.

If you are executing a match simply to find `true` or `false`, 
use the `RegExp.prototype.test()` method or the `String.prototype.search()` method.

### search

*  String.prototype.[search](https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String/search)

`str.search(regexp)`

If successful, `search` returns the index of the regular expression inside
the string. Otherwise, it returns `-1`.

When you want to know whether a pattern is found in a string use `search`
(similar to the regular expression `test` method); for more information
(but slower execution) use `match` (similar to the regular expression
`exec` method).

### match
*  String.prototype.[match](https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String/match)
*  
String.prototype.[replace](https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String/replace)

### replace
The `replace()` method returns a new string with some or all matches of
a pattern replaced by a replacement.  
The pattern can be a string or a `RegExp`, 
and the replacement can be a string or a function to be called
for each match.

```js
> re = /apples/gi
/apples/gi
> str = "Apples are round, and apples are juicy."
'Apples are round, and apples are juicy.'
> newstr = str.replace(re, "oranges")
'oranges are round, and oranges are juicy.'
```

The replacement string can be a function to be invoked to create the
new substring (to put in place of the substring received from parameter
`#1`). The arguments supplied to this function are:

| **Possible name** | **Supplied value** |
| ----------------- | ------------------ |
|match              | The matched substring. (Corresponds to `$&`.)|
|`p1`, `p2`, ...    | The nth parenthesized submatch string, provided the first argument to replace was a RegExp object. (Corresponds to `$1`, `$2`, etc.) For example, if `/(\a+)(\b+)/`, was given, `p1` is the match for `\a+`, and `p2` for `\b+`.|
|`offset`             | The `offset` of the matched substring within the total string being examined  (For example, if the total string was `"abcd"`, and the                  matched substring was `"bc"`, then this argument will be `1` |
|string             |The total string being examined |

#### Ejemplo de `replace`

```
[~/javascript/learning]$ pwd -P
/Users/casiano/local/src/javascript/learning
[~/javascript/learning]$ cat f2c.js 
```

```javascript
#!/usr/bin/env node
function f2c(x)
{
  function convert(str, p1, offset, s)
  {
    return ((p1-32) * 5/9) + "C";
  }
  var s = String(x);
  var test = /(\d+(?:\.\d*)?)F\b/g;
  return s.replace(test, convert);
}

var arg = process.argv[2] || "32F";
console.log(f2c(arg));
```
Ejecución:

```
[~/javascript/learning]$ ./f2c.js 100F
37.77777777777778C
[~/javascript/learning]$ ./f2c.js 
0C
```

<!--

* [Eloquent JavaScript (3d Edition): Regular Expressions](http://eloquentjavascript.net/3rd_edition/09_regexp.html)
  - Ejercicio: [Usar new Regexp("string") versus slash literal](https://youtu.be/ASQ35gSjmeI). Similitudes y diferencias. Vídeo del profesor
  - [![](http://i3.ytimg.com/vi/ASQ35gSjmeI/hqdefault.jpg)](https://youtu.be/ASQ35gSjmeI)
  - Explique la diferencia observada entre las dos formas de construir una RegExp

-->


### Ejemplo: Parsing Ficheros **ini**

- [Parsing an INI file](https://eloquentjavascript.net/09_regexp.html#ini) Eloquent JavaScript

#### Otra Solución al Parsing de los Ficheros **ini**

- [Parsing de ficheros ini](http://crguezl.github.io/pl-grado-ini-files/): despliegue
- [Repo con el código del parsing de ficheros ini](https://github.com/crguezl/pl-grado-ini-files)

### Backtracking en Expresiones Regulares

- [EJS: Backtracking](https://eloquentjavascript.net/09_regexp.html#h_NFMtGK0tD3)
- [Backtracking. Paréntesis dentro de una RegExp](regexpejercicios.html#backtracking)

### Funciones en el Argumento de Reemplazo

- [Funciones en el Argumento de Reemplazo](regexpejercicios.html#reemplazofunciones)

## Unicode y  Extensiones

### Unicode 

[EloquentJS: International characters](https://eloquentjavascript.net/09_regexp.html#h_+y54//b0l+)

```javascript
> console.log("\u03A0")
Π
> console.log("\u03B1")
α
> "Πα".match(/\u03A0(\u03B1)/)
[ 'Πα', 'α', index: 0, input: 'Πα' ]
```


> By a strange historical accident, `\s` (whitespace) does not have
> this problem and matches all characters that the Unicode standard
> considers whitespace, including things like the nonbreaking space
> and the Mongolian vowel separator:

`\s` casa con el carácter unicode Mongolian Vowel

![](mongolianvowel.png)

* [See What is the Mongolian vowel separator for?](https://linguistics.stackexchange.com/questions/12712/what-is-the-mongolian-vowel-separator-for/12722)

* [Repo con Ejemplos de Unicode en JS](https://github.com/ULL-ESIT-PL/unicode-js)
* [Ejemplo unicode.js usando XRegExp](https://github.com/ULL-ESIT-GRADOII-PL/xregexp-example/blob/gh-pages/unicode.js)
* Read [JavaScript has a Unicode problem](https://mathiasbynens.be/notes/javascript-unicode) 2013


* [Eloquent JS: International characters](https://eloquentjavascript.net/09_regexp.html#h_+y54//b0l+)
* [JavaScript y Unicode](https://github.com/ULL-ESIT-PL/unicode-js) (Repo en GitHub unicode-js)
* [Repositorio con ejemplos de uso de XRegExp](https://github.com/ULL-ESIT-GRADOII-PL/xregexp-example) 
* [Ejemplos de extensiones de XRegExp para Unicode](https://github.com/ULL-ESIT-GRADOII-PL/xregexp-example/blob/gh-pages/unicode.js)


### XRegExp: Expresiones Regulares Extendidas (a la Perl)

* [ GitHub repo ilustrando el uso de XRegExp URL](https://github.com/ULL-ESIT-GRADOII-PL/xregexp-example)
* [xregexp repo en GitHub. Documentación](https://github.com/slevithan/xregexp)
* [http://xregexp.com/ website](http://xregexp.com/): Documentación
* [API de XRegExp](http://xregexp.com/api/)
  - [XRegExp](http://xregexp.com/api/#XRegExp)
  - [XRegExp.addToken](http://xregexp.com/api/#addToken)
  - [XRegExp.build](http://xregexp.com/api/#build) (addon)
  - [XRegExp.cache](http://xregexp.com/api/#cache)
  - [XRegExp.escape](http://xregexp.com/api/#escape)
  - [XRegExp.exec](http://xregexp.com/api/#exec)
  - [XRegExp.forEach](http://xregexp.com/api/#forEach)
  - [XRegExp.globalize](http://xregexp.com/api/#globalize)
  - [XRegExp.install](http://xregexp.com/api/#install)
  - [XRegExp.isInstalled](http://xregexp.com/api/#isInstalled)
  - [XRegExp.isRegExp](http://xregexp.com/api/#isRegExp)
  - [XRegExp.match](http://xregexp.com/api/#match)
  - [XRegExp.matchChain](http://xregexp.com/api/#matchChain)
  - [XRegExp.matchRecursive](http://xregexp.com/api/#matchRecursive) (addon)
  - [XRegExp.replace](http://xregexp.com/api/#replace)
  - [XRegExp.replaceEach](http://xregexp.com/api/#replaceEach)
  - [XRegExp.split](http://xregexp.com/api/#split)
  - [XRegExp.test](http://xregexp.com/api/#test)
  - [XRegExp.uninstall](http://xregexp.com/api/#uninstall)
  - [XRegExp.union](http://xregexp.com/api/#union)
  - [XRegExp.version](http://xregexp.com/api/#version)

#### XRegExp instance properties

- [<regexp>.xregexp.source](http://xregexp.com/api/#dot-source) (The original pattern provided to the XRegExp constructor)
- [<regexp>.xregexp.flags](http://xregexp.com/api/#dot-flags) (The original flags provided to the XRegExp constructor)

#### XRegExp. Unicode

*  [XRegExp Plugins](http://xregexp.com/plugins/)
*  [Regular Expressions.info: Unicode Regular Expressions](https://www.regular-expressions.info/unicode.html)

### [Módulo @ull-esit-pl/uninums](https://www.npmjs.com/package/@ull-esit-pl/uninums)

```js
> uninums = require("@ull-esit-pl/uninums")
{ normalSpaces: [Function: normalSpaces],
  normalDigits: [Function: normalDigits],
  parseUniInt: [Function: parseUniInt],
  parseUniFloat: [Function: parseUniFloat],
  sortNumeric: [Function: sortNumeric] }
> uninums.parseUniInt('६.६')
6
> uninums.parseUniFloat('६.६')
6.6
> uninums.parseUniFloat('६.६e६')
6600000
> uninums.sortNumeric(['٣ dogs','١٠ cats','٢ mice']) 
[ '٢ mice', '٣ dogs', '١٠ cats' ]
> uninums.normalDigits('٢ mice')
'2 mice'
> uninums.normalDigits('٣ dog')
'3 dog'
> uninums.normalDigits('١٠ cats')
'10 cats'
> uninums.normalDigits('٠۴६')
'046'
```

### Extensiones a las Expresiones Regulares en ECMA6

* [New regular expression features in ECMAScript 6](http://www.2ality.com/2015/07/regexp-es6.html)

### Ejercicios

* [Ejercicios de Expresiones Regulares en los apuntes](regexpejercicios.html)
  - [lookahead](regexpejercicios.html#lookahead)
  - [lookbehind](regexpejercicios.html#lookbehind)
* [Ejercicio: Palabras repetidas](https://youtu.be/GfLkvLM7pA8) Vídeo del profesor
   * [Repo en GitHub](https://github.com/ULL-ESIT-PL/repeated-words-regexp)
   * [![](http://i3.ytimg.com/vi/GfLkvLM7pA8/hqdefault.jpg)](https://youtu.be/GfLkvLM7pA8)
* [Ejercicio: Buscar las secuencias que empiezan por 12 en posiciones múltiplos de 6](https://youtu.be/A5JoNlTawFA) Vídeo del profesor
  * [![](http://i3.ytimg.com/vi/A5JoNlTawFA/hqdefault.jpg)](https://youtu.be/A5JoNlTawFA)
* Tarea. Haga los ejercicios en [https://regexone.com/](https://regexone.com/)
* Tarea. Haga los ejercicios en [https://www.w3resource.com/javascript-exercises/javascript-regexp-exercises.php](https://www.w3resource.com/javascript-exercises/javascript-regexp-exercises.php)

### Práctica p3-t2-regexp

Resuelva los ejercicios de Expresiones Regulares propuestos por el profesor

* [Práctica de Expresiones Regulares (p3-t2-regexp)](practicas/p3-t2-regexp/reto)

## RegExps en Otros lenguajes

Antiguos apuntes del profesor sobre el uso de RegExp en otros lenguajes:

### Perl

* [Expresiones Regulares en Perl](http://crguezl.github.io/ull-etsii-grado-pl-apuntes/node96.html)

### Varios Lenguajes

* [Expresiones Regulares en varios lenguajes](http://crguezl.github.io/ull-etsii-grado-pl-apuntes/node100.html)

### Python

* [Python](http://crguezl.github.io/ull-etsii-grado-pl-apuntes/node100.html#SECTION05440050000000000000)

### Ruby

* [Ruby](http://crguezl.github.io/ull-etsii-grado-pl-apuntes/node100.html#SECTION05440060000000000000)

### C

* [Expresiones Regulares en C](http://crguezl.github.io/ull-etsii-grado-pl-apuntes/node80.html)

### sed

* [Expresiones Regulares en sed](http://crguezl.github.io/ull-etsii-grado-pl-apuntes/node83.html)

## Análisis Léxico

* [Example: using sticky matching for tokenizing](http://2ality.com/2015/07/regexp-es6.html#example-using-sticky-matching-for-tokenizing) inside 
the chapter [New regular expression features in ECMAScript 6](http://2ality.com/2015/07/regexp-es6.html#example-using-sticky-matching-for-tokenizing)
* [Ejemplo de Analizador Léxico para JS](https://github.com/crguezl/ull-etsii-grado-pl-minijavascript/blob/gh-pages/tokens.js)
* [Descripción de la Práctica: Analizador Léxico para Un Subconjunto de JavaScript](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/practicas/practicaanalisislexicotdop2018.html)
* [Compiler Construction by Wikipedians](https://books.google.es/books?id=nMZnyp_zW8AC&pg=PA570#v=onepage&q=Lexical&f=false). Chapter  Lexical Analysis
* [Un caso a estudiar: El módulo npm lexical-parser](https://github.com/Eitz/lexical-parser)
* [Esprima. Chapter 3. Lexical Analysis (Tokenization)](http://esprima.readthedocs.io/en/latest/lexical-analysis.html)
    - [RepoULL-ESIT-GRADOII-PL/esprima-pegjs-jsconfeu-talk](https://github.com/ULL-ESIT-GRADOII-PL/esprima-pegjs-jsconfeu-talk)
* [jison-lex](https://github.com/zaach/jison-lex)
* [lexer](https://github.com/aaditmshah/lexer)
* [Expresiones Regulares en Flex](https://ull-esit-pl-1617.github.io/apuntesingenieriainformaticaPL/node19.html)

### Práctica p4-t2-lexer

* [Práctica Escribir un Analizador Léxico para Javascript (p4-t2-lexer)](practicas/p4-t2-lexer/README.md)

## Referencias


* [Apuntes de Expresiones Regulares](regexp) del profesor
* [Apuntes 16/17 de Expresiones Regulares](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/regexp/) del profesor (gitbook)
* [Eloquent JavaScript: Regular Expressions](http://eloquentjavascript.net/09_regexp.html)
* [Expresiones Regulares y Análisis Léxico en JavaScript](http://crguezl.github.io/ull-etsii-grado-pl-apuntes/node70.html) Apuntes del profesor cursos 2012-2014. Latex2html, LateX, GitHub 
* [Apuntes de la Asignatura Procesadores de Lenguajes](http://crguezl.github.io/pl-html/) GitHub Cursos 13-15 http://crguezl.github.io/pl-html
* [Expresiones Regulares y Análisis Léxico en JavaScript](http://nereida.deioc.ull.es/~plgrado/javascriptexamples/node7.html) Latex2Html, LaTeX, nereida
* [New regular expression features in ECMAScript 6](http://2ality.com/2015/07/regexp-es6.html)