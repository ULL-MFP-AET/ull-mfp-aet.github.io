# Parsing Expression Grammars (PEGs)

#### Introducción

* [Introducción Parsing Expression Grammars (PEGs)](peg-intro)
* [PEG.js](pegjs)

#### PEG.js

* [Documentación oficial del Módulo PEG.js](https://pegjs.org/documentation)
* [Viejos Apuntes:PEGs](http://crguezl.github.io/pl-html/node31.html) (Introducción a los PEGs)
* [Viejos Apuntes del profesor sobre PEG.js](http://crguezl.github.io/pl-html/node32.html) (PEGjs)
* [Ejemplos en PEG.js](https://github.com/ULL-ESIT-PL-1617/pegjs-examples) Repositorio en GitHub
* Una Calculadora en infijo. Left recursion removed. Como Hacer Análisis Léxico en PEGs.
    * [simple_reduce.pegjs](https://github.com/ULL-ESIT-PL-1617/pegjs-examples/blob/master/simple_reduce.pegjs)
    * [use_simple.js](https://github.com/ULL-ESIT-PL-1617/pegjs-examples/blob/master/use_simple.js)
    * [Compiling simple_reduce.pegjs](https://github.com/ULL-ESIT-PL-1617/pegjs-examples/blob/master/Rakefile#L24-L27): `pegjs -o simple.js simple_reduce.pegjs`
*  PEGjs Pasando Parámetros al Parser
    * [Pasando parámetros al parser](https://github.com/ULL-ESIT-PL-1617/pegjs-examples/tree/master/parameterspegjs)

####  Gramáticas versus PEGs

* [Grammars vs PEGs examples](https://github.com/ULL-ESIT-PL-1617/pegjs-examples/tree/master/grammarvspeg) GitHub repo
* See paper [On the relation between context-free grammars and parsing expression grammars](https://www.sciencedirect.com/science/article/pii/S0167642314000276) FabioMascarenhas, SérgioMedeiros, Roberto Ierusalimschy. Elsevier

#### Herramientas

* [@ull-esit-pl/pegjs-strip](https://www.npmjs.com/package/@ull-esit-pl/pegjs-strip)
* [pegjs-util](https://www.npmjs.com/package/pegjs-util)

#### Traduciendo de Infijo a Egg Virtual Machine

* [Traduciendo de Infijo a EggVM usando PEG.js](https://github.com/ULL-ESIT-PL-1718/pegjs-infix-2-egg)

### Práctica p9-t4-peg-infix2egg

* [Descripción de la Práctica](practicas/p9-t4-peg-infix2egg)

