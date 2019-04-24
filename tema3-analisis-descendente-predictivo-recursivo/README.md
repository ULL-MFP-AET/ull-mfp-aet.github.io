# Análisis Sintactico Descendente Recursivo Predictivo (e Interpretación de Código)

## Capítulo 1: Introducción. El Lenguaje Egg

* [Eloquent JS. Chapter 11. Project: A Programming Language](http://eloquentjavascript.net/11_language.html)
  * [Repo ULL-ESIT-PL-1617/egg](https://github.com/ULL-ESIT-PL-1617/egg)
  * [Repo ULL-ESIT-PL-1617/egg as an npm module](https://www.npmjs.com/package/@crguezl/eloquentjsegg)
  * [Gist to check the npm module](https://gist.github.com/crguezl/8dfcaa01a0377dead374bc35c462c29d)
* Un bucle REPL para Egg
    *  [Vídeo del profesor: *Programando un bucle REPL para el lenguaje Egg*](https://youtu.be/5gIlt6r29lw)
    * [Build a JavaScript Command Line Interface (CLI) with Node.js](https://www.sitepoint.com/javascript-command-line-interface-cli-node-js/) Tutorial at SitePoint
* Tests. Mocking and Stubbing
    * [Sinon API](http://sinonjs.org/releases/v1.17.7/)
    * [Side effects of stubbing console in tests](https://gyandeeps.com/console-stubbing/)
    * [Unit Test like a Secret Agent with Sinon.js](http://elijahmanor.com/unit-test-like-a-secret-agent-with-sinon-js/) by Elijah Manor

### Práctica p5-t3-egg-0

* [Descripción de la Práctica](practicas/p5-t3-egg-0)

### Práctica p6-t3-egg-1

* [Descripción de la Práctica](practicas/p6-t3-egg-1)

### Otros ejemplos de lenguajes con analizadores Predictivos Descendentes Recursivos

* [TinyC](https://github.com/ULL-ESIT-PL-1718/tiny-c) Repo con un ejemplo de PDR en C
* [A very simple JS based Lisp interpreter](https://youtu.be/VqIic9tshfg) YouTube video by Andrea Griffini
* [How to implement a programming language in JavaScript](http://lisperator.net/pltut/) (Un Intérprete Lisp)


## Capítulo 2: Conceptos Teóricos para los Analizadores Descendentes Recursivos Predictivos

###  [Apuntes de PL: Análisis Sintáctico Predictivo Recursivo](http://crguezl.github.io/pl-html/node20.html) (JavaScript/CoffeeScript)

*   [Conceptos Básicos para el Análisis Sintáctico](http://crguezl.github.io/pl-html/node21.html)
    *   [Ejercicio](http://crguezl.github.io/pl-html/node21.html#SECTION04211000000000000000)  

*   [Análisis Sintáctico Predictivo Recursivo](http://crguezl.github.io/pl-html/node22.html)
    *   [Introducción](http://crguezl.github.io/pl-html/node22.html#SECTION04221000000000000000)
        *   [Ejemplo](http://crguezl.github.io/pl-html/node22.html#SECTION04221010000000000000)
        *   [Caracterización de las Gramáticas Analizables](http://crguezl.github.io/pl-html/node22.html#SECTION04221020000000000000)
    *   [Ejercicio: Recorrido del árbol en un ADPR](http://crguezl.github.io/pl-html/node22.html#SECTION04222000000000000000)  

*   [Recursión por la Izquierda](http://crguezl.github.io/pl-html/node23.html)
*   [Esquemas de Traducción](http://crguezl.github.io/pl-html/node24.html)
*   [Eliminación de la Recursión por la Izquierda en un Esquema de Traducción](http://crguezl.github.io/pl-html/node25.html)
*   [Práctica: Analizador Descendente Predictivo Recursivo](http://crguezl.github.io/pl-html/node26.html)
  * [Repo con un ADRP](https://github.com/ULL-ESIT-PL-1819/parser-pdr-example) (Node.js, Web app con ExpressJS, CoffeeScript)
    - [Fichero main.coffee conteniendo un ADPR](https://github.com/ULL-ESIT-PL-1819/parser-pdr-example/blob/master/views/main.coffee)

### [Apuntes de PL de la II. Derivaciones a vacio](http://nereida.deioc.ull.es/~pl/perlexamples/node88.html) (Perl)

* [Construcción de los FIRST y los FOLLOW](http://nereida.deioc.ull.es/~pl/perlexamples/node89.html)

*   [Introducción](http://nereida.deioc.ull.es/http://crguezl.github.io/pl-html/nodepl/perlexamples/node85.html)
*   [Ejercicio: Recorrido del árbol en un ADPR](http://nereida.deioc.ull.es/http://crguezl.github.io/pl-html/nodepl/perlexamples/node86.html)
*   [Ejercicio: Factores Comunes](http://nereida.deioc.ull.es/http://crguezl.github.io/pl-html/nodepl/perlexamples/node87.html)
*   [Derivaciones a vacío](http://nereida.deioc.ull.es/http://crguezl.github.io/pl-html/nodepl/perlexamples/node88.html)
*   [Construcción de los conjuntos de Primeros y Siguientes](http://nereida.deioc.ull.es/http://crguezl.github.io/pl-html/nodepl/perlexamples/node89.html)
*   [Ejercicio: Construir los <span class="MATH">!FIRST</span>](http://nereida.deioc.ull.es/http://crguezl.github.io/pl-html/nodepl/perlexamples/node90.html) 
*   [Ejercicio: Calcular los <span class="MATH">FOLLOW</span>](http://nereida.deioc.ull.es/http://crguezl.github.io/pl-html/nodepl/perlexamples/node91.html) 
*   [Práctica: Construcción de los FIRST y los FOLLOW](http://nereida.deioc.ull.es/http://crguezl.github.io/pl-html/nodepl/perlexamples/node92.html)
*   [Gramáticas LL(1)](http://nereida.deioc.ull.es/http://crguezl.github.io/pl-html/nodepl/perlexamples/node93.html)
*   [Ejercicio: Caracterización de una gramática LL(1)](http://nereida.deioc.ull.es/http://crguezl.github.io/pl-html/nodepl/perlexamples/node94.html)
*   [Ejercicio: Ambiguedad y LL(1)](http://nereida.deioc.ull.es/http://crguezl.github.io/pl-html/nodepl/perlexamples/node95.html)
*   [Práctica: Un analizador APDR](http://nereida.deioc.ull.es/http://crguezl.github.io/pl-html/nodepl/perlexamples/node96.html)
*   [Práctica: Generación Automática de Analizadores Predictivos](http://nereida.deioc.ull.es/http://crguezl.github.io/pl-html/nodepl/perlexamples/node97.html)
    *   [Objetivo](http://nereida.deioc.ull.es/http://crguezl.github.io/pl-html/nodepl/perlexamples/node97.html#SECTION008613010000000000000)
    *   [El Módulo <tt>Grammar</tt>](http://nereida.deioc.ull.es/http://crguezl.github.io/pl-html/nodepl/perlexamples/node97.html#SECTION008613020000000000000)
    *   [Descripción del objetivo: La función <tt>gap</tt>](http://nereida.deioc.ull.es/http://crguezl.github.io/pl-html/nodepl/perlexamples/node97.html#SECTION008613030000000000000)
    *   [Descripción del objetivo: La función <tt>parser</tt>](http://nereida.deioc.ull.es/http://crguezl.github.io/pl-html/nodepl/perlexamples/node97.html#SECTION008613040000000000000)
    *   [Cálculo de los First y los Follow con <tt>PL::FirstFollow</tt>](http://nereida.deioc.ull.es/http://crguezl.github.io/pl-html/nodepl/perlexamples/node97.html#SECTION008613050000000000000)
    *   [Uso de Templates](http://nereida.deioc.ull.es/http://crguezl.github.io/pl-html/nodepl/perlexamples/node97.html#SECTION008613060000000000000)
    *   [Concatenación y Documentos <tt>HERE</tt>](http://nereida.deioc.ull.es/http://crguezl.github.io/pl-html/nodepl/perlexamples/node97.html#SECTION008613070000000000000)
    *   [Descarga de los Módulos Necesarios](http://nereida.deioc.ull.es/http://crguezl.github.io/pl-html/nodepl/perlexamples/node97.html#SECTION008613080000000000000)

### GitBook 1617

* [Apuntes de Analizadores Descendentes Recursivos](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/parsing/recursivodescendente/) GitBook 1617

### Repos

* [Repo con un ADRP](https://github.com/crguezl/prdcalc) (Ruby, Web app con Sinatra, CoffeeScript y JS en el cliente)
  - [Fichero main.js conteniendo un ADPR](https://github.com/crguezl/prdcalc/blob/master/views/main.js)

### Referencias

* [Apuntes de Top Down parsing de David Martins de Matos](https://www.l2f.inesc-id.pt/~david/w/pt/Top-Down_Parsing) del Departamento de Engenharia Informática do Instituto Superior Técnico de Lisboa.  Laboratório de Sistemas de Língua Falada do INESC ID Lisboa .
  - [Eliminating Left Recursion](https://www.l2f.inesc-id.pt/~david/w3/pt/index.php/Top-Down_Parsing?rdfrom=https%3A%2F%2Fwww.l2f.inesc-id.pt%2F~david%2Fwiki%2Fpt%2Findex.php%3Ftitle%3DTop-Down_Parsing%26redirect%3Dno#Step_3:_Eliminating_Left_Recursion)



<!--
* Análisis Top-Down
   * RDP
   * [Project: A Programming Language](http://eloquentjavascript.net/11_language.html)   
     - [Writing a Lisp interpreter in JavaScript - Mary Rose Cook](https://youtu.be/hqnTvuvXPCc) 
     - [GITHUB REPO FOR The VIDEO](https://github.com/maryrosecook/littlelisp)
   * LL 
   * PEGs
    * GLL
* Análisis Bottom-Up
    * Earley
    * LR
        * LALR
            * [Parser and Lexer — How to Create a Compiler part 1/6 — Converting text into an Abstract Syntax Tree](https://youtu.be/eF9qWbuQLuw) YouTube Video. Bison. C++
        * GLR
-->
