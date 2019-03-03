## Práctica: Analizador Léxico para Un Subconjunto de JavaScript (p4-t2-lexer)

Vamos a trabajar a partir de este repo de Douglas Crockford:

-  [https://github.com/douglascrockford/TDOP](https://github.com/douglascrockford/TDOP)
-  Autor: [Douglas Crockford](http://www.crockford.com/), [douglas@crockford.com en la Wikipedia](https://en.wikipedia.org/wiki/Douglas_Crockford)
-  Fecha que figura en el repo: 2010-11-12
-  Vea una versión modificada en funcionamiento en [http://crguezl.github.io/ull-etsii-grado-pl-minijavascript/](http://crguezl.github.io/ull-etsii-grado-pl-minijavascript/)


### Descripción:

-   [tdop.html](http://crguezl.github.io/ull-etsii-grado-pl-minijavascript/tdop.html) contains a description of Vaughn Pratt’s Top Down Operator
    Precedence, and describes the parser whose lexer we are going to
    write in this lab. Is a simplified version of JavaScript.
-   The file [`index.html`](https://github.com/douglascrockford/TDOP/blob/master/index.html) parses [`parse.js`](https://github.com/douglascrockford/TDOP/blob/master/parse.js) and displays its AST.
-   The page depends on on [`parse.js`](https://github.com/douglascrockford/TDOP/blob/master/parse.js) and [`tokens.js`](https://github.com/douglascrockford/TDOP/blob/master/tokens.js).
-   The file [`parse.js`](https://github.com/douglascrockford/TDOP/blob/master/parse.js) contains the Simplified JavaScript parser.
-   [tokens.js](https://github.com/douglascrockford/TDOP/blob/master/tokens.js) produces an array of token objects from a string. 

Douglas Crockford escribió [este analizador léxico](https://github.com/douglascrockford/TDOP/blob/master/tokens.js) sin usar expresiones
regulares. Crockford prescindió de las regexp porque 
el analizador sintáctico corresponde a un
subconjunto de JS que no tiene - entre otras cosas - expresiones
regulares y  el autor quería que el analizador se pudiera analizar
a si mismo.


### Requisitos

1. Douglas Crockford escribió este analizador léxico sin usar expresiones
regulares. Reescriba el analizador léxico en [tokens.js](https://github.com/douglascrockford/TDOP/blob/master/tokens.js) usando expresiones regulares.
2.  Evite que se hagan copias de la cadena siendo procesada. Muévase
    dentro de la misma cadena usando `lastIndex`. Quizá usar la opción sticky le ayude.
    Tiene una solución dada por el profesor en 
    - [https://github.com/crguezl/ull-etsii-grado-pl-minijavascript/blob/gh-pages/tokens.js](https://github.com/crguezl/ull-etsii-grado-pl-minijavascript/blob/gh-pages/tokens.js)
3. Modifique la solución de Crockford usado regexps en [tokens.js](https://github.com/douglascrockford/TDOP/blob/master/tokens.js)
4.  Añada un server ([vea aquí un ejemplo](https://github.com/ULL-ESIT-PL-1617/evaluar-manejo-de-cookies-y-sessions-en-expressjs-alu0100825510)) para el HTML y haga el despliegue de su aplicación en la máquina virtual del [iaas](https://github.com/SYTW/iaas-ull-es) o en [Heroku](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/recursos/heroku.html)
6. Opcional: Use [sessions](/apuntes/cookies/README.md) para controlar quien accede a la aplicación. Puede ver un ejemplo de como hacerlo en los ficheros:
  - [ULL-ESIT-PL-1617/evaluar-manejo-de-cookies-y-sessions-en-expressjs](https://github.com/ULL-ESIT-PL-1617/evaluar-manejo-de-cookies-y-sessions-en-expressjs-alu0100825510)
7. En el `README.md` escriba un tutorial con lo que ha aprendido en esta práctica
8. Cuando haga la entrega indique los enlaces a los repos (analizador) así como a los despliegues. Ponga también el enlace al despliegue en el README de su repo.

### Recursos

* Lexical Analysis
  * Una solución incompleta  de esta práctica se encuentra en:
     -   [https://github.com/crguezl/ull-etsii-grado-pl-minijavascript/tree/gh-pages](https://github.com/crguezl/ull-etsii-grado-pl-minijavascript/tree/gh-pages) en github.
     -   Veala en funcionamiento en [http://crguezl.github.io/ull-etsii-grado-pl-minijavascript/](http://crguezl.github.io/ull-etsii-grado-pl-minijavascript/)
  * El método `tokens` retorna el array de tokens [https://github.com/crguezl/ull-etsii-grado-pl-minijavascript/blob/gh-pages/tokens.js](https://github.com/crguezl/ull-etsii-grado-pl-minijavascript/blob/gh-pages/tokens.js)
* Programación Web
  * Ejemplo de server con cookies y sessions: [ULL-ESIT-PL-1617/evaluar-manejo-de-cookies-y-sessions-en-expressjs](https://github.com/ULL-ESIT-PL-1617/evaluar-manejo-de-cookies-y-sessions-en-expressjs-alu0100825510).
    - [ULL-ESIT-PL-1617/evaluar-manejo-de-cookies-y-sessions-en-expressjs](https://github.com/ULL-ESIT-PL-1617/evaluar-manejo-de-cookies-y-sessions-en-expressjs-alu0100825510)
  * [Apuntes de Heroku](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/recursos/heroku.html)
  * [Como Desplegar una Aplicación Web en iaas.ull.es](https://github.com/SYTW/iaas-ull-es)
  * [Apuntes: Expresiones Regulares](../apuntes/regexp/README.md)
  * [Eloquent JS: Chapter 9: Regular Expressions](http://eloquentjavascript.net/09_regexp.html)
  * [ejs](https://ejs.co/)
* XRegexp
  * [XRegexp](http://xregexp.com/) 
    - [XRegexp en GitHub](https://github.com/slevithan/xregexp)
    - [xregexp-all.js](https://unpkg.com/xregexp/xregexp-all.js)
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
* Diseño
  * [Apuntes: Code Smells](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/patterns/codesmell.html)
  * [Principios de Diseño](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/patterns/designprinciples.html)
  * [Patrones de Diseño](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/patterns/)
  * [Strategy Pattern](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/patterns/strategypattern.html)

### Notas para el Profesor

```bash
       [~/srcPLgrado/lexical_analysis_top_down_operator_precedence(gh-pages)]$ pwd -P
       /Users/casiano/local/src/javascript/PLgrado/lexical_analysis_top_down_operator_precedence
```
* sol-i
  * [sol-a auth](https://github.com/ULL-ESIT-PL-1718/authentication-angeligareta)
  * [sol-ai](https://github.com/ULL-ESIT-PL-1718/analizador-lexico-para-js-angeligareta)
* sol-ca
  * [sol-ca-auth](https://github.com/ULL-ESIT-PL-1718/alu0100966589-AuthModule)
  * [sol-ca](https://github.com/ULL-ESIT-PL-1718/analizador-lexico-para-js-alu0100966589)
* sol-da
  * [sol-da-auth](https://github.com/ULL-ESIT-PL-1718/auth-alu0100973914)
  * [sol-da](https://github.com/ULL-ESIT-PL-1718/analizador-lexico-para-js-alu0100973914)
* sol-cri
  * [sol-cri](https://github.com/ULL-ESIT-PL-1718/analizador-lexico-para-js-alu0100945850)
  * [sol-cri-auth](https://github.com/ULL-ESIT-PL-1718/auth-alu0100945850)




