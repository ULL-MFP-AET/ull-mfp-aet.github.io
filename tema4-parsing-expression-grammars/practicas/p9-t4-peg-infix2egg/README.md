---
layout: default
title: p9-t4-peg-infix2egg
permalink: /tema4-parsing-expression-grammars/practicas/p9-t4-peg-infix2egg/
previous: 
  url: tema3-analisis-descendente-predictivo-recursivo/practicas/p8-t3-pdr-infix2egg/
next:
  url: /tema5-analisis-ascendente/practicas/p10-t5-jison-infix2egg/
---


# Práctica: De Infijo a Egg usando PEG.js (p9-t4-peg-infix2egg)

## Descripción

Re-escriba la fase de análisis sintáctico del lenguaje de infijo que diseñó en la práctica 

* [Analizador Descendente Predictivo Recursivo. Desde Lenguajes de Infijo a EGG Virtual Machine (p8-t3-pdr-infix2eg)](../../../tema3-analisis-descendente-predictivo-recursivo/practicas/p8-t3-pdr-infix2egg/)

usando PEG.js para re-escribir el analizador sintáctico.

En su parser irá:

* El análisis léxico y sintáctico del lenguaje. 
* Conviene dividir el analizador en dos secciones bien diferenciadas con la parte de tokens en un lado y la gramática en el otro
* Este es un buen momento para meditar su diseño del lenguaje de infijo e introducir modificaciones y extensiones
* Las acciones semánticas a ejecutar dentro del analizador son las de construcción del AST 

<!--
## Un Lenguaje

```
[.../p9-t4-peg-infix2egg-04-16-2020-03-18-25/davafons(master)]$ pegjs-strip --strip-comment lib/grammar.pegjs
```
```pegjs
expressions
  = __
    (
        BEGIN (expression SEPARATOR )+ END
        / expression SEPARATOR
    )


expression
  = __
    (
      IF expression THEN expressions ELSE expressions
      / IF expression THEN expressions
      / WHILE expression DO expressions
      / FUNC ID? LP (ID COMMA )* ID? RP expressions
      / LET ID EQ expression
      / SET ID EQ expression
      / CALL ID LP RP
      / CALL ID LP (expression (COMMA expression )* ) RP
      / ID (LSB expression RSB )+ EQ expression
      / ID (LSB expression RSB )+
      / comparison
    )

comparison
  = sum ($COMOP sum )*
sum
  = factor ($SUMOP factor )*
factor
  = unary ($MULOP unary )*
unary
  = $UNARYOP? operand
operand
  = (
  array
  / map
  / LP expression RP
  / STRING
  / BOOOLEAN
  / ID
  / NUM)
array
  = LSB operand RSB
   / LSB operand (COMMA operand )* RSB
map
  = MAP LP (operand SP operand ) (COMMA operand SP operand )* RP
NUM "number"
        = __ $([+-]? [0-9]* "."? [0-9]* ([eE][+-]?[0-9]+)?)
ID "identifier"
        = __ $(!"end" [a-zA-Z_][0-9a-zA-Z_]*)
STRING
  = __ '"' $(!'"' .)* '"'
BOOOLEAN
  = __ $("true" / "false")
SEPARATOR
  = __ ";"
UNARYOP
  = __ ("++" / "--")
LET
  = __ "let"
SET
  = __ "set"
EQ
  = __ "="
COMOP
  = __ ("==" / "!=" / ">=" / "<=" / ">" / "<")
SUMOP
  = __ ("+" / "-")
MULOP
  = __ ("*" / "/")
CALL
  = __ "call"
LP
  = __ "("
RP
  = __ ")"
COMMA
  = __ ","
IF
  = __ "if"
THEN
  = __ "then"
ELSE
  = __ "else"
BEGIN
  = __ "begin"
END
  = __ "end"
WHILE
  = __ "while"
DO
  = __ "do"
FUNC
  = __ ("function" / "func" / "fun")
LSB
  = __ "["
RSB
  = __ "]"
MAP
  = __ "map"
SP
  = __ ":"
__ "whitespace"
        = (comment / whitespace)*
comment "comment"
        = singleLineComment
    / multiLineComment
singleLineComment
        = "#" (!newline .)*
multiLineComment
        = "/*" (!"*/" .)* "*/"
newline
        = [\n\r]
whitespace
        = [ \t\n\r]
```
-->

## Opciones del Compilador

Haga que el ejecutable admita opciones en línea de comandos. Algo parecido a esto:

  ```
  [.../p9-t4-peg-infix2egg-04-16-2020-03-18-25/davafons(master)]$ bin/infix2egg.js --help
  Usage: infix2egg [options]

  Options:
    -V, --version              output the version number
    -r --run <fileName>        compiles the input infix program and runs it using the egg interpreter
    -c --compile <fileName>    compile the infix program to produce a JSON containing the input egg AST
    -i --interpret <fileName>  interprets the egg AST
    -h, --help                 output usage information
  ```

Buenos módulos para parsear la línea de comandos son [commander](https://www.npmjs.com/package/commander) y [yargs](https://www.npmjs.com/package/yargs)

## Ejemplo de posible sintáxis

```
[.../p9-t4-peg-infix2egg-04-16-2020-03-18-25/davafons(master)]$ cat examples/array.pl
```
```ruby
begin
  let emptyArray = [];
  call print(emptyArray);

  let x = [2, 3, [1, 2, 3]];
  call print(x[2][1]);

  x[2][1] = 100;
  call print(x[2]);
end
```

Ejecución:
```
[.../p9-t4-peg-infix2egg-04-16-2020-03-18-25/davafons(master)]$ bin/infix2egg.js -r examples/array.pl
[]
2
[ 1, 100, 3 ]
Return value: 1,100,3
```

## Recursos

* [Un ejemplo breve de como hacer esta práctica: pegjs-infix-2-egg](https://github.com/ULL-ESIT-PL-1718/pegjs-infix-2-egg)
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




