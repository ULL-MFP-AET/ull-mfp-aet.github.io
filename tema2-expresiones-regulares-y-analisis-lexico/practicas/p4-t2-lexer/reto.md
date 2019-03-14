# Reto para la Práctica Analizador Léxico para Un Subconjunto de JavaScript (p4-t2-lexer)

Usando [XRegExp](http://xregexp.com/) y [Módulo @ull-esit-pl/uninums](https://www.npmjs.com/package/@ull-esit-pl/uninums) añada a su analizador léxico la capacidad de procesar identificadores y números en unicode.
Por ejemplo, la entrada:

```
var αβ /* griego */ = ६६७ /* 667 en Devanagari */ * ६७ /* 67 en Devanagari */;
```

debería producir una salida parecida a esta:

```
{
    "value": "=",
    "arity": "binary",
    "first": {
        "value": "αβ",
        "arity": "name"
    },
    "second": {
        "value": "*",
        "arity": "binary",
        "first": {
            "value": 667,
            "arity": "literal"
        },
        "second": {
            "value": 67,
            "arity": "literal"
        }
    }
```


## Tips y Recursos

* [XRegexp](http://xregexp.com/) 
  - [XRegexp en GitHub](https://github.com/slevithan/xregexp)
  - Cuando se quiere usar XRegexp en el browser se debe cargar el fichero [xregexp-all.js](https://unpkg.com/xregexp/xregexp-all.js)
  - El fichero [xregexp-all.js](https://unpkg.com/xregexp/xregexp-all.js) también viene con la distribución `npm`:

    ```
    $ ls -l node_modules/xregexp/
    total 568
    -rw-r--r--  1 casiano  staff    1106 26 oct  1985 LICENSE
    -rw-r--r--  1 casiano  staff    9861 26 oct  1985 README.md
    drwxr-xr-x  5 casiano  staff     160  4 mar 09:33 lib
    -rw-r--r--  1 casiano  staff    2759  4 mar 09:33 package.json
    drwxr-xr-x  5 casiano  staff     160  4 mar 09:33 src
    drwxr-xr-x  3 casiano  staff      96  4 mar 09:33 tools
    -rw-r--r--  1 casiano  staff  269593 26 oct  1985 xregexp-all.js ☜
    ```
* Tip

  ```js
  > [analizador-lexico(master)]$ node
  > XRegExp = require("xregexp")
  > id = XRegExp('[_\\pL][_\\pL\\pN]+'); // L: Letter, N: number
  > id.exec("Русский६")
  [ 'Русский६', index: 0, input: 'Русский६' ]
  > number = XRegExp('\\pN+', "g"); // N: number
  > "६६७+६७*2".match(number)
  [ '६६७', '६७', '2' ]
  > 
  ```
* Tip: Aquí  les dejo un módulo [Módulo @ull-esit-pl/uninums](https://www.npmjs.com/package/@ull-esit-pl/uninums) que les ayudará a obtener la representación interna de una cadena unicode que contenga un número:

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
* Dado que [Módulo @ull-esit-pl/uninums](https://www.npmjs.com/package/@ull-esit-pl/uninums) se va a usar en el cliente necesitamos una versión para el mismo. Una vez instalado, use el fichero `node_modules/\@ull-esit-pl/uninums/uninums-web.js`:

  ```
  [~/.../analizador-lexico-para-js-carlos-dominguez(reto)]$ ls -l node_modules/\@ull-esit-pl/uninums/
  total 56
  -rw-r--r--  1 casiano  staff  4101  4 mar 09:50 README.md
  -rw-r--r--  1 casiano  staff  1648  4 mar 09:50 package.json
  -rw-r--r--  1 casiano  staff  1571  4 mar 09:50 test.html
  -rw-r--r--  1 casiano  staff  3696  4 mar 09:50 uninums-web.js
  -rw-r--r--  1 casiano  staff  3641  4 mar 09:50 uninums.js
  -rw-r--r--  1 casiano  staff  2903  4 mar 09:50 uninums.min.js
```

* [JavaScript y Unicode](https://github.com/ULL-ESIT-PL/unicode-js) (Repo en GitHub unicode-js)
* [Repositorio con ejemplos de uso de XRegExp](https://github.com/ULL-ESIT-GRADOII-PL/xregexp-example) 
* [Ejemplos de extensiones de XRegExp para Unicode](https://github.com/ULL-ESIT-GRADOII-PL/xregexp-example/blob/gh-pages/unicode.js)

## Notas para el Profesor

```bash
[~/srcPLgrado/lexical_analysis_top_down_operator_precedence(gh-pages)]$ pwd -P
/Users/casiano/local/src/javascript/PLgrado/lexical_analysis_top_down_operator_precedence
[~/campus-virtual/1819/pl1819/introduccion/tema2-expresiones-regulares-y-analisis-lexico/practicas/p4-t2-lexer/pl1718-solutions(master)]$ pwd -P
/Users/casiano/local/academica/centros/ETSII/GRADO/PL/campus-virtual/tema2-regexp-y-lexico/practica-analisis-lexico-tdop/solutions

```
* sol-cas
  * [sol-cas](https://github.com/ULL-ESIT-PL-1819/analizador-lexico-para-js)
  * [sol-cas auth](https://github.com/ULL-ESIT-PL-1819/crguezl-authmodule)
* sol-aiga
  * [sol-aiga auth](https://github.com/ULL-ESIT-PL-1718/authentication-angeligareta)
  * [sol-aiga](https://github.com/ULL-ESIT-PL-1718/analizador-lexico-para-js-angeligareta)
* sol-car
  * [sol-car-auth](https://github.com/ULL-ESIT-PL-1718/alu0100966589-AuthModule)
  * [sol-car](https://github.com/ULL-ESIT-PL-1718/analizador-lexico-para-js-alu0100966589)
* sol-dau
  * [sol-dau-auth](https://github.com/ULL-ESIT-PL-1718/auth-alu0100973914)
  * [sol-dau](https://github.com/ULL-ESIT-PL-1718/analizador-lexico-para-js-alu0100973914)
* sol-cri
  * [sol-cri](https://github.com/ULL-ESIT-PL-1718/analizador-lexico-para-js-alu0100945850)
  * [sol-cri-auth](https://github.com/ULL-ESIT-PL-1718/auth-alu0100945850)




