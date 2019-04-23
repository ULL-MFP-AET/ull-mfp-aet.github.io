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

* [Apuntes de PL: Análisis Sintáctico Predictivo Recursivo](http://crguezl.github.io/pl-html/node22.html) (JavaScript)
* [Apuntes de PL de la II. Derivaciones a vacio](http://nereida.deioc.ull.es/~pl/perlexamples/node88.html) (Perl)
* [Construcción de los FIRST y los FOLLOW](http://nereida.deioc.ull.es/~pl/perlexamples/node89.html)
* [Apuntes de Analizadores Descendentes Recursivos](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/parsing/recursivodescendente/) GitBook 1617
* [Repo con un ADRP](https://github.com/crguezl/prdcalc) (Ruby, Web app con Sinatra, CoffeeScript y JS en el cliente)
  -  [Despliegue en Heroku](https://pl1718-prdcalc.herokuapp.com/) Suprimido
  - [Fichero main.js conteniendo un ADPR](https://github.com/crguezl/prdcalc/blob/master/views/main.js)
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
