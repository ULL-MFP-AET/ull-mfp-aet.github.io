## Práctica: Reescribir el Compilador de Infijo a Egg usando PEG.js (p9-t4-peg-infix2egg)

### Descripción

Re-escriba la fase de análisis sintáctico 
[del lenguaje de infijo que diseñó en la práctica *Analizador Descendente Predictivo Recursivo. Desde Lenguajes de Infijo a EGG Virtual Machine (p8-t3-pdr-infix2eg)*](../../../tema3-analisis-descendente-predictivo-recursivo/practicas/p8-t3-pdr-infix2egg/).
Básicamente ando PEG.js

En su parser irá:
  * El análisis léxico y sintáctico del lenguaje. 
  * Conviene dividir el analizador en dos secciones con la parte de tokens en un lado y la gramática en el otro
  * Este es un buen momento para meditar su diseño del lenguaje de infijo e introducir modificaciones
  * Las acciones semánticas a ejecutar dentro del analizador son las de construcción del AST 


### Recursos

* [PEGs](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pegjs/PEGS.html) Viejos apuntes del profesor
* [PEG.js](https://pegjs.org/documentation) PEG.js Documentation
* [El lenguaje egg: repo en GitHub](https://github.com/ULL-ESIT-PL-1617/egg)
* [Eloquent JS: Chapter 11. Project: A Programming Language](http://eloquentjavascript.net/11_language.html)
* [Repo interpreter-egg](https://github.com/ULL-ESIT-PL-1617/interpreter-egg)
* [NodeJS Readline gist](https://gist.github.com/crguezl/430642e29a2b9293317320d0d1759387)
* [Apuntes de PL: Análisis Sintáctico Predictivo Recursivo](http://crguezl.github.io/pl-html/node22.html)
* [Mocha](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pruebas/mocha.html)
* [Chai](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pruebas/chai.html)
* [Covering](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pruebas/covering.html)
* [Blanket](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pruebas/blanket.html)




