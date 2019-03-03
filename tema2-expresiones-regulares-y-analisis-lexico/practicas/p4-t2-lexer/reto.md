# Reto para la Práctica Analizador Léxico para Un Subconjunto de JavaScript (p4-t2-lexer)

Usando [XRegExp](http://xregexp.com/) añada a su analizador léxico la capacidad de procesar identificadores y números en unicode.
Por ejemplo, la entrada:

```
var α  = ६६७ /* 667 en Devanagari */ * ६७ /* 67 en Devanagari */;
```

debería producir una salida parecida a esta:

```
{
    "value": "=",
    "arity": "binary",
    "first": {
        "value": "α",
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

## Tips

```js
> [anlizador-lexico(master)]$ node
> XRegExp = require("xregexp")
> id = XRegExp('[_\\pL][_\\pL\\pN]+'); // L: Letter, N: number
> id.exec("Русский६")
[ 'Русский६', index: 0, input: 'Русский६' ]
> number = XRegExp('\\pN+', "g"); // N: number
> "६६७+६७*2".match(number)
[ '६६७', '६७', '2' ]
> 
```

## Recursos

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

## Notas para el Profesor

```bash
[~/srcPLgrado/lexical_analysis_top_down_operator_precedence(gh-pages)]$ pwd -P
/Users/casiano/local/src/javascript/PLgrado/lexical_analysis_top_down_operator_precedence
[~/campus-virtual/1819/pl1819/introduccion/tema2-expresiones-regulares-y-analisis-lexico/practicas/p4-t2-lexer/pl1718-solutions(master)]$ pwd -P
/Users/casiano/local/academica/centros/ETSII/GRADO/PL/campus-virtual/tema2-regexp-y-lexico/practica-analisis-lexico-tdop/solutions

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




