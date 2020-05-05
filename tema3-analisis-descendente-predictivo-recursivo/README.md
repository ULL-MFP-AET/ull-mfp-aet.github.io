# Análisis Sintactico Descendente Recursivo Predictivo, Análisis de ámbito e Interpretación de Código

## Los Analizadores Descendentes Recursivos Predictivos

### Introducción

[Introducción al Análisis Sintáctico Predictivo Recursivo]({{site.baseurl}}/tema3-analisis-descendente-predictivo-recursivo/pdr-teoria)

### Un poco de Teoría

[Un poco de teoría sore el análisis LL(1)](ll1)

## El Lenguaje Egg

En este capítulo introduciremos el Análisis Sintactico Descendente Recursivo Predictivo
para ello vamos a seguir el capítulo 12 *A Programming Language* de EJS:

* [Eloquent JS. Chapter 12. Project: A Programming Language](http://eloquentjavascript.net/12_language.html)

En este repo encontrará una versión mejorada del procesador descrito en el capítulo:

* [Repo ULL-ESIT-PL-1617/egg](https://github.com/ULL-ESIT-PL-1617/egg)
* [ULL-ESIT-PL-1617/egg as an npm module](https://www.npmjs.com/package/@crguezl/eloquentjsegg)
  * [Gist to check the npm module](https://gist.github.com/crguezl/8dfcaa01a0377dead374bc35c462c29d)

Vamos a realizar múltiples prácticas sobre el lenguaje descrito en [Eloquent JS. Chapter 12. Project: A Programming Language](http://eloquentjavascript.net/12_language.html). 

Esta es la primera práctica

* [Descripción de la Práctica p5-t3-egg-0](practicas/p5-t3-egg-0)
 
*  [Vídeo del profesor: *Programando un bucle REPL para el lenguaje Egg*](https://youtu.be/5gIlt6r29lw)

Esta referencia puede ayudar sobre este tema:

* [Build a JavaScript Command Line Interface (CLI) with Node.js](https://www.sitepoint.com/javascript-command-line-interface-cli-node-js/) Tutorial at SitePoint


* [Vim Syntax Higlighting for Egg](https://github.com/ULL-ESIT-PL-1819/.vim/tree/master/syntax) by David Afonso (dibad)


### Metodología  de Trabajo

* [Metodología](practicas/metodologia-para-las-practicas)

### Recursos para el Profesor

* [Directorios y Ramas](practicas/directorios)


### Práctica p6-t3-egg-1

* [Descripción de la Práctica](practicas/p6-t3-egg-1)

### Práctica p7-t3-egg-1

* [Descripción de la Práctica](practicas/p6-t3-egg-1)

### Otros ejemplos de lenguajes con analizadores Predictivos Descendentes Recursivos

* [TinyC](https://github.com/ULL-ESIT-PL-1718/tiny-c) Repo con un ejemplo de PDR en C
* [A very simple JS based Lisp interpreter](https://youtu.be/VqIic9tshfg) YouTube video by Andrea Griffini
* [How to implement a programming language in JavaScript](http://lisperator.net/pltut/) (Un Intérprete Lisp)

### Práctica p8-t3-pdr-infix2egg

* [Descripción de la Práctica p8-t3-pdr-infix2egg](practicas/p8-t3-pdr-infix2egg)

##  Referencias

### Otros Apuntes del Profesor de cursos Anteriores

* [Apuntes de PL: Análisis Sintáctico Predictivo Recursivo](http://crguezl.github.io/pl-html/node20.html) (JavaScript/CoffeeScript)
*   <a href="http://crguezl.github.io/pl-html/node21.html" target="_blank">Conceptos Básicos para el Análisis Sintáctico</a>
    *   <a href="http://crguezl.github.io/pl-html/node21.html#SECTION04211000000000000000" target="_blank">Ejercicio</a>  

*   <a href="http://crguezl.github.io/pl-html/node22.html" target="_blank">Análisis Sintáctico Predictivo Recursivo</a>
    *   <a href="http://crguezl.github.io/pl-html/node22.html#SECTION04221000000000000000" target="_blank">Introducción</a>
        *   <a href="http://crguezl.github.io/pl-html/node22.html#SECTION04221010000000000000" target="_blank">Ejemplo</a>
        *   <a href="http://crguezl.github.io/pl-html/node22.html#SECTION04221020000000000000" target="_blank">Caracterización de las Gramáticas Analizables</a>
    *   <a href="http://crguezl.github.io/pl-html/node22.html#SECTION04222000000000000000" target="_blank">Ejercicio: Recorrido del árbol en un ADPR</a>  

*   <a href="http://crguezl.github.io/pl-html/node23.html" target="_blank">Recursión por la Izquierda</a>
*   <a href="http://crguezl.github.io/pl-html/node24.html" target="_blank">Esquemas de Traducción</a>
*   <a href="http://crguezl.github.io/pl-html/node25.html" target="_blank">Eliminación de la Recursión por la Izquierda en un Esquema de Traducción</a>
*   <a href="http://crguezl.github.io/pl-html/node26.html" target="_blank">Práctica: Analizador Descendente Predictivo Recursivo</a>
  * <a href="https://github.com/ULL-ESIT-PL-1819/parser-pdr-example) (Node.js, Web app con ExpressJS, CoffeeScript" target="_blank">Repo con un ADRP</a>
    - <a href="https://github.com/ULL-ESIT-PL-1819/parser-pdr-example/blob/master/views/main.coffee" target="_blank">Fichero main.coffee conteniendo un ADPR</a>

###  Apuntes dela Asignatura Procesadores de Lenguajes de la licenciatura de Ingeniería Informática

* [Procesamiento de Lenguajes en Perl](https://campusvirtual.ull.es/ocw/pluginfile.php/2304/mod_resource/content/0/perlexamples/node1.html) (Open Course Ware ULL)

### Apuntes del curso 16/17

* [Apuntes de Analizadores Descendentes Recursivos](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/parsing/recursivodescendente/) GitBook 1617

### Repositorios Relacionados en Ruby y CoffeeScript

* [Repo con un ADRP](https://github.com/crguezl/prdcalc) (Ruby, Web app con Sinatra, CoffeeScript y JS en el cliente)
  - [Fichero main.js conteniendo un ADPR](https://github.com/crguezl/prdcalc/blob/master/views/main.js)

### Referencias de Otros Autores

* [Apuntes de Top Down parsing de David Martins de Matos](https://www.l2f.inesc-id.pt/~david/w/pt/Top-Down_Parsing) del Departamento de Engenharia Informática do Instituto Superior Técnico de Lisboa.  Laboratório de Sistemas de Língua Falada do INESC ID Lisboa .
  - [Eliminating Left Recursion](https://www.l2f.inesc-id.pt/~david/w3/pt/index.php/Top-Down_Parsing?rdfrom=https%3A%2F%2Fwww.l2f.inesc-id.pt%2F~david%2Fwiki%2Fpt%2Findex.php%3Ftitle%3DTop-Down_Parsing%26redirect%3Dno#Step_3:_Eliminating_Left_Recursion)
* [Project: A Programming Language](http://eloquentjavascript.net/11_language.html)   
   - [Writing a Lisp interpreter in JavaScript - Mary Rose Cook](https://youtu.be/hqnTvuvXPCc) 
   - [GITHUB REPO FOR The VIDEO](https://github.com/maryrosecook/littlelisp)

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
