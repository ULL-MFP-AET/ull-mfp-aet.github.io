## Práctica: Analizador Descendente Predictivo Recursivo. Desde Lenguajes de Infijo a EGG Virtual Machine (p8-t3-pdr-infix2eg)

### Descripción

Diseñe un lenguaje de programación sencillo (Sintáxis convencional *a la C/BASIC/JavaScript/...*). Escriba un analizador sintáctico que genere [árboles de análisis abstracto que conformen a los usados por el intérprete del lenguaje Egg](https://github.com/ULL-ESIT-PL-1617/egg/blob/master/README.md).

### Actualice la máquina virtual `evm` para que pueda ejecutar los JSON

blah blah

{% include json2ast.md %}

### Posibles puntos de partida

* Buenos puntos de partida
  * [Tiny-C](https://github.com/ULL-ESIT-PL-1718/tiny-c) 
      - Un subconjunto hiper-minimal de C con un compilador y una VM  escritas en C. 
      - Contiene un lexer
      - Un parser PDR que construye un AST
      - Un generador de código para una VM
      - Un intérprete para la VM
  * [Syntax of Mini-Pascal](https://www.cs.helsinki.fi/u/vihavain/k06/okk/items/minipascalsyntax.html)
      - [Mini Pascal Compiler in Python](https://github.com/ULL-ESIT-PL-1819/mini-pascal-compiler)
      - [Gramática](https://github.com/ULL-ESIT-PL-1819/mini-pascal-compiler/blob/master/grammar)
* Sencillos
  * Dos vídeos en YouTube implementando una sencilla calculadora en C usando la técnica PDR. Si estas empezando
    * [Let's write a recursive-descent parser in C (Part 1)](https://youtu.be/N55XNj8KjC4) YouTube
    * [Let's write a recursive-descent parser in C (Part 2)](https://youtu.be/NdW_ApiaivU) YouTube
  * [Tiny Basic](https://en.wikipedia.org/wiki/Tiny_BASIC). Muy sencillo
  * [Niklaus Wirth's PL/0](https://en.wikipedia.org/wiki/Recursive_descent_parser) in the Wikipedia.  Sencillo
* Complicados pero posibles
  * [The C Proggaming Language](https://cs.indstate.edu/~cbasavaraj/cs559/the_c_programming_language_2.pdf) léase la descripción de la gramática de C. Páginas 234 a la 239
  * [Irie Pascal Grammar](http://www.irietools.com/iriepascal/progref534.html)
* Mucho trabajo. Complicados:
  * Acorn
    * [Acorn A small, fast, JavaScript-based JavaScript parser](https://github.com/acornjs/acorn)
    * [by Marijn Haverbeke. Acorn: yet another JavaScript parser](http://marijnhaverbeke.nl/blog/acorn.html)
  * [Gramática de JS en PEGjs](https://github.com/pegjs/pegjs/blob/master/examples/javascript.pegjs)
  * [Python Grammar](https://docs.python.org/3/reference/grammar.html)
  * [Ruby Grammar](https://www.cse.buffalo.edu/~regan/cse305/RubyBNF.pdf)
  * [Java Grammar](https://docs.oracle.com/javase/specs/jls/se7/html/jls-18.html)

Posiblemente las mas recomendables para empezar son Tiny-C y Mini-Pascal. Después puede usar las otras para responder a la pregunta ¿como amplío el lenguaje con ...?

### Requisitos

1. Escriba la gramática de manera que sea procesable por un ADPR. Puede usar los operadores
`*` y `+` dentro de la gramática para indicar repeticiones
2. Escriba el analizador sintáctico para dicho lenguaje. Deberá devolver el [árbol de análisis sintáctico conforme a los árboles usados por el intérprete Egg](https://github.com/ULL-ESIT-PL-1617/egg/blob/master/README.md)
3. El lenguaje debe tener 
  - declaraciones (aunque no tiene que ser necesariamente tipeado). Esto es, deberían poder declararse objetos como variables, constantes y funciones
  - sentencias `if`, 
  - `condiciones` como `a <= b`, 
  - `asignaciones`, 
  - alguna forma de bucle, 
  - `funciones` y  llamadas a funciones, 
  - etc.
4. La gramática deberá disponerse de forma que sea analizable por un PDR
5. Escriba pruebas  para el código desarrollado
6. Use integración en la nube (Travis/ CircleCI)

### Recursos

* [Apuntes de PL: Análisis Sintáctico Predictivo Recursivo](http://crguezl.github.io/pl-html/node22.html)
* [Repo con una solución a un lenguaje similar](https://github.com/crguezl/prdcalc)
  -  [Despliegue en Heroku](https://pl1718-prdcalc.herokuapp.com/)
  - [Fichero main.js con un parser similar al que se solicita](https://github.com/crguezl/prdcalc/blob/master/views/main.js)
* [Repo inicial del que parte la asignación ClassRoom](https://github.com/ULL-ESIT-PL-1617/solution-evalua-pdr)
* [Repo con una solución a Eloquent JS. Chapter 12 Project. A Programming Language](https://github.com/ULL-ESIT-PL-1617/egg)
* [Mocha](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pruebas/mocha.html)
* [Chai](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pruebas/chai.html)
* [Covering](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pruebas/covering.html)
* [Blanket](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pruebas/blanket.html)



