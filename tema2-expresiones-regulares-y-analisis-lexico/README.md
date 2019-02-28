# Tema 2: Expresiones Regulares y Análisis Léxico

## Capítulo 1. Introducción a las Expresiones Regulares

* [Eloquent JavaScript (2nd Edition): Regular Expressions](http://eloquentjavascript.net/09_regexp.html)
* [Eloquent JavaScript (3d Edition): Regular Expressions](http://eloquentjavascript.net/3rd_edition/09_regexp.html)
  - Ejercicio: [Usar new Regexp("string") versus slash literal](https://youtu.be/ASQ35gSjmeI). Similitudes y diferencias. Vídeo del profesor
  - [![](http://i3.ytimg.com/vi/ASQ35gSjmeI/hqdefault.jpg)](https://youtu.be/ASQ35gSjmeI)
  - Explique la diferencia observada entre las dos formas de construir una RegExp
* [Apuntes de Expresiones Regulares](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/regexp/) del profesor (gitbook)
* [Expresiones Regulares y Análisis Léxico en JavaScript](http://crguezl.github.io/ull-etsii-grado-pl-apuntes/node70.html) Apuntes del profesor cursos 2012-2014. Latex2html, LateX, GitHub 
* [Apuntes de la Asignatura Procesadores de Lenguajes](http://crguezl.github.io/pl-html/) GitHub Cursos 13-15 http://crguezl.github.io/pl-html
* [Expresiones Regulares y Análisis Léxico en JavaScript](http://nereida.deioc.ull.es/~plgrado/javascriptexamples/node7.html) Latex2Html, LaTeX, nereida
* [New regular expression features in ECMAScript 6](http://2ality.com/2015/07/regexp-es6.html)
* Ejemplo: Parsing Ficheros **ini**
  - [Parsing de ficheros ini](http://crguezl.github.io/pl-grado-ini-files/): despliegue
  - [Repo con el código del parsing de ficheros ini](https://github.com/crguezl/pl-grado-ini-files)

### Backtracking en Expresiones Regulares

- [Backtracking. Paréntesis dentro de una RegExp](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/regexp/regexpejercicios.html#backtracking)

### Funciones en el Argumento de Reemplazo

- [Funciones en el Argumento de Reemplazo](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/regexp/regexpejercicios.html#reemplazofunciones)

### Expresiones Regulares Extendidas y Unicode

* [JavaScript y Unicode](https://github.com/ULL-ESIT-PL/unicode-js) (Repo en GitHub unicode-js)
* [Repositorio con ejemplos de uso de XRegExp](https://github.com/ULL-ESIT-GRADOII-PL/xregexp-example) 
* [Ejemplos de extensiones de XRegExp para Unicode](https://github.com/ULL-ESIT-GRADOII-PL/xregexp-example/blob/gh-pages/unicode.js)
* [Módulo @ull-esit-pl/uninums](https://www.npmjs.com/package/@ull-esit-pl/uninums)
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


### Ejercicios

* Ejercicio: [Usar new Regexp("string") versus slash literal](https://youtu.be/ASQ35gSjmeI). Similitudes y diferencias. Vídeo del profesor
    - [![](http://i3.ytimg.com/vi/ASQ35gSjmeI/hqdefault.jpg)](https://youtu.be/ASQ35gSjmeI)
    - Explique la diferencia observada entre las dos formas de construir una RegExp
* [Ejercicios de Expresiones Regulares en los apuntes](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/regexp/regexpejercicios.html)
  - [lookahead](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/regexp/regexpejercicios.html#lookahead)
  - [lookbehind](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/regexp/regexpejercicios.html#lookbehind)
* [Ejercicio: Palabras repetidas](https://youtu.be/GfLkvLM7pA8) Vídeo del profesor
   * [Repo en GitHub](https://github.com/ULL-ESIT-PL/repeated-words-regexp)
   * [![](http://i3.ytimg.com/vi/GfLkvLM7pA8/hqdefault.jpg)](https://youtu.be/GfLkvLM7pA8)
* [Ejercicio: Buscar las secuencias que empiezan por 12 en posiciones múltiplos de 6](https://youtu.be/A5JoNlTawFA) Vídeo del profesor
  * [![](http://i3.ytimg.com/vi/A5JoNlTawFA/hqdefault.jpg)](https://youtu.be/A5JoNlTawFA)
* Tarea. Haga los ejercicios en [https://regexone.com/](https://regexone.com/)
* Tarea. Haga los ejercicios en [https://www.w3resource.com/javascript-exercises/javascript-regexp-exercises.php](https://www.w3resource.com/javascript-exercises/javascript-regexp-exercises.php)

## Práctica p3-t2-regexp

Resuelva los ejercicios de Expresiones Regulares propuestos por el profesor

* [Práctica de Expresiones Regulares (p3-t2-regexp)](practicas/p3-t2-regexp/reto) (no disponible)

## Capítulo 2: Análisis Léxico

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


## Capítulo 3: Expresiones Regulares en Perl y en otros lenguajes

* [Expresiones Regulares en Perl](http://nereida.deioc.ull.es/~pl/perlexamples/node7.html)
* [Expresiones Regulares en varios lenguajes](http://nereida.deioc.ull.es/~pl/perlexamples/node28.html)

