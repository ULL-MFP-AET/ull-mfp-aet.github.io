# Práctica: Egg. A Programming Language (p5-t1-egg-0)

## Introducción

En esta primera práctica deberá leer el capítulo 12 *A Programming Language* de EJS:

* [Eloquent JS. Chapter 12. Project: A Programming Language](http://eloquentjavascript.net/12_language.html)

En este capítulo se presenta un lenguaje llamado **Egg** y se describe como procesarlo
e interpretarlo.

Lea cuidadosamente el capítulo intentando comprender como funciona el traductor y la interpretación del árbol.

## Fixing Scope

Resuelva por su cuenta los dos ejercicios propuestos en el capítulo:

1. [Comments](https://eloquentjavascript.net/12_language.html#i_/OBuIOX390) y 
2. [Fixing Scope](https://eloquentjavascript.net/12_language.html#i_Y9ZDMshYCQ)

Si no se le ocurre como resolver el segundo apartado, *Fixing Scope*, puede encontrar una solución al problema en la rama [Inicial de este repo ULL-ESIT-PL-1617/egg/](https://github.com/ULL-ESIT-PL-1617/egg/tree/inicial). 

## Escriba la Gramática

Escriba las reglas de producción de la gramática que reconoce el traductor

## Separe en Módulos el Programa

Separe el programa en dos módulos y dos ejecutables.

* `eggc`
    - Compiles the input program to produce a JSON containing the tree: `eggc examples/two.egg` produces the JSON file `examples/two.egg.evm`
* `evm` 
    - Egg Virtual Machine. Runs the tree: `evm examples/two.egg.evm`
Intente ahora separar la fase de análisis sintáctico de la fase de análisis léxico
escribiendo una función `lex` que cada vez que es llamada por las funciones  `parseExpression` y `parseApply` que retorna
el siguiente token.

Si logra resolver estos objetivos ¡Enhorabuena!.

Si no, puede encontrar una solución a estos tres problemas en este repo [ULL-ESIT-PL-1617/egg](https://github.com/ULL-ESIT-PL-1617/egg)

El repo ha sido publicado como módulo en npm [@crguezl/eloquentjsegg](https://www.npmjs.com/package/@crguezl/eloquentjsegg)





A continuación mejore el analizador léxico que encuentra en este repo 
para que:

1. Puede opcionalmente usar la opción `x` de  [XRegExp](http://xregexp.com/) para sangrar y comentar las expresiones regulares
2. Guarde en el objeto token el `offset` de comienzo, la línea de comienzo, etc
3. Mejore los mensajes de error usando esta información
4. El analizador léxico actual destruye la cadena conteniendo el programa conforme la analiza.  Es posible  escribir una analizador léxico que recorra la cadena conteniendo el programa sin destruirla usando la opción `sticky`. Estudie esta mejora
5. Mejore las pruebas, especialmente con programas que contienen errores


## Recursos

* [Eloquent JS: Chapter 11. Project: A Programming Language](http://eloquentjavascript.net/11_language.html)
* [El lenguaje egg: repo en GitHub](https://github.com/ULL-ESIT-PL-1617/egg)
* [Repo interpreter-egg](https://github.com/ULL-ESIT-PL-1617/interpreter-egg)
* [NodeJS Readline gist](https://gist.github.com/crguezl/430642e29a2b9293317320d0d1759387)
* En el repo [ULL-ESIT-PL-1617/interpreter-egg](https://github.com/ULL-ESIT-PL-1617/interpreter-egg) se muestra como hacer un bucle REPL
* [XRegExp](http://xregexp.com/)
* El módulo [@ull-esit-pl/example2test](https://www.npmjs.com/package/@ull-esit-pl/example2test)
* Tests. Mocking and Stubbing
    * [Sinon API](http://sinonjs.org/releases/v1.17.7/)
    * [Side effects of stubbing console in tests](https://gyandeeps.com/console-stubbing/)
    * [Unit Test like a Secret Agent with Sinon.js](http://elijahmanor.com/unit-test-like-a-secret-agent-with-sinon-js/) by Elijah Manor

