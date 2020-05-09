---
layout: default
title: p8-t3-pdr-infix2egg
permalink: /tema3-analisis-descendente-predictivo-recursivo/practicas/p8-t3-pdr-infix2egg/
previous: 
  url: /tema3-analisis-descendente-predictivo-recursivo/practicas/p7-t3-egg-2/
next:
  url: /tema4-parsing-expression-grammars/practicas/p9-t4-peg-infix2egg/
---


# Práctica: Analizador Descendente Predictivo Recursivo. Desde Lenguajes de Infijo a EGG Virtual Machine (p8-t3-pdr-infix2eg)

## Descripción

Diseñe un lenguaje de programación sencillo (Sintáxis convencional *a la C/BASIC/JavaScript/...*). 
Escriba un analizador sintáctico descendente recursivo (PDR) que genere [árboles de análisis abstracto que conformen a los usados por el intérprete del lenguaje Egg](https://github.com/ULL-ESIT-PL-1617/egg/blob/master/README.md).

## Requisitos

1. Escriba la gramática de su lenguaje de manera que sea procesable por un ADPR. Puede usar los operadores
`*` y `+` dentro de la gramática para indicar repeticiones
2. Escriba el analizador sintáctico para su lenguaje. Deberá devolver el [árbol de análisis sintáctico conforme a los árboles usados por el intérprete Egg](https://github.com/ULL-ESIT-PL-1617/egg/blob/master/README.md)
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
6. Use integración en la nube (GitHub Actions)




## Niklaus Wirth PL/0

* [Niklaus Wirth's PL/0](https://en.wikipedia.org/wiki/Recursive_descent_parser) in the Wikipedia.  Sencillo. Cumple todos los requisitos solicitados

Quizá la opción mas sencilla sea empezar con un lenguaje basado en 
[Niklaus Wirth's PL/0](https://en.wikipedia.org/wiki/Recursive_descent_parser) y -si se dispone de tiempo -
irlo extendiendo hacia [mini-pascal](https://github.com/ULL-ESIT-PL-1819/mini-pascal-compiler/blob/master/grammar).

Veamos un ejemplo basado en PL/0:

### Grammar

* ∑ = tokens
* V = { expressions, expression, comparison, sum, factor, operand  }
* Start symbol: expressions
* Productions:

```js
    expressions → expression
        | 'begin' expression (SENTENCE_SEPARATOR expression)* 'end'

    expression → 'if' expression 'then' expressions
        | 'if' expression 'then' expressions 'else' expressions
        | 'while' expression 'do' expressions
        | 'func' ID '(' (ID ',')* ID? ')' expressions
        | 'func' '(' (ID ',')* ID? ')' expressions
        | 'let' ID '=' expression
        | 'set' ID '=' expression
        | 'call' ID '(' (expression ',')* expression ')'
        | 'call' ID '(' ')'
        | comparison

    comparison → sum (COMPOP sum)*

    sum → factor (ADDOP factor)*

    factor → unary (MULOP unary)*

    unary → UNARYOP ? operand

    operand → ID
        | NUM
        | STRING
        | BOOLEAN
        | '(' expression ')'
```

### Tokens

En XRegExp, dobles escapes:

```js
    WHITES = `\\s+ | #.*`
    SENTENCE_SEPARATOR = `[;]`
    NUM = `
        \\d+          # Can have integer digits 
        \\.?          # Can have decimal point
        \\d*          # Can have decimal digits
        (
            [eE]        # Can have exponents
            [-+]?\\d+   # Exponents numbers can have sign
        )?`
    STRING = `
        "(              # Has to start with double quote "
            (
                [^\\"]  # Anything that is not a slash nor double quote "
                | \\.   # Or anything escaped
            )*          # Zero or more times
        )"              # Has to end with double quote "`
    BOOLEAN = `(true | false)`
    OPERATORS =`
        (
            \\b( and | or | not )\\b
            | == | != | <= | >= | < | > | [+] | - | [*] | [/] | %
        )
        `, 'xy');

    RESERVED_WORDS = `
    (
        \\b( true | false | begin | end | if | then | else | while | do | func | let | set | call )\\b 
    )`
    ID = `[a-zA-Z]\w*`     # An identifier
```


### Infix program examples

Below you can see an infix program that declares an array with 4 elements. Prints the array, the length of the array, the string resulting of calling the `join` method of the array and the array resulting of calling the `map` method to return an array formed with the double of each element

```ruby
begin
    # array is an egg function that returns an array
    let result = call array(2, 3, 4, 5);

    # print is also egg function
    call print(result);

    # We can also access array properties
    call print("Array length: " + result.length);

    # And call array methods
    let string = call result.join(" ~ ");
    call print(string);

    # We can use array map method by passing an anonymous function as argument
    let doubles = call result.map(func(x, i, a) begin
            x * 2
    end);
    call print(doubles)
end
```

Execution of `examples/arrays.inf`  

```bash
bin/infix2egg.js --run examples/arrays.inf
```

And the result is 

```
[ 2, 3, 4, 5 ]
Array length: 4
2 ~ 3 ~ 4 ~ 5
[ 4, 6, 8, 10 ]
```

Another  example:

```ruby
begin
    let variable = if "string" != "string" then 2 else 3
end
```

### Executable

```

  Usage: infix2egg [options]

  Options:

    -V, --version                               output the version number
    -r --run <fileName>                         compiles the input infix program and runs it using the egg interpreter
    -c --compile <fileName>                     compile the infix program to produce a JSON containing the input egg AST
    -i --interpret <fileName>                   interprets the egg AST
    -p --plugins [plugin1:plugin2:...:pluginK]  specify infix/egg plugins
    -h, --help                                  output usage information
```

## Otros buenos puntos de partida

* [Tiny-C](https://github.com/ULL-ESIT-PL-1718/tiny-c) 
   - Un subconjunto hiper-minimal de C con un compilador y una VM  escritas en C. 
   - Contiene un lexer
   - Un parser PDR que construye un AST
   - Un generador de código para una VM
   - Un intérprete para la VM
* [Syntax of Mini-Pascal](https://www.cs.helsinki.fi/u/vihavain/k06/okk/items/minipascalsyntax.html)
   - [Mini Pascal Compiler in Python](https://github.com/ULL-ESIT-PL-1819/mini-pascal-compiler)
   - [Gramática](https://github.com/ULL-ESIT-PL-1819/mini-pascal-compiler/blob/master/grammar)
   - Un posible estrategia para esta práctica es empezar con PL/0 e ir haciendo crecer el lenguaje hasta convertirlo en Mini Pascal.
* [Tiny Basic](https://en.wikipedia.org/wiki/Tiny_BASIC). Muy sencillo

## Puntos de partida muy Sencillos

  * Dos vídeos en YouTube implementando una sencilla calculadora en C usando la técnica PDR. Si estas empezando
    * [Let's write a recursive-descent parser in C (Part 1)](https://youtu.be/N55XNj8KjC4) YouTube
    * [Let's write a recursive-descent parser in C (Part 2)](https://youtu.be/NdW_ApiaivU) YouTube


##  Puntos de Partida Complicados pero Posibles

  * ANSI C
    * Aqui tiene una gramática del lenguaje C escrita en Parse::Eyapp, una herramienta de generación de analizadores sintácticos para el lenguaje Perl que desarrollé hace muchos años. :
      - [The C Programing Language](https://fastapi.metacpan.org/source/CASIANO/Parse-Eyapp-1.142/examples/languages/C/ansic.eyp)
    * [Un compilador de ANSI C descendente recursivo](https://sites.google.com/site/lccretargetablecompiler/)
  * Pascal
    * [Irie Pascal Grammar](http://www.irietools.com/iriepascal/progref534.html)
    * [Pascal.js](https://github.com/kanaka/pascal.js?files=1)

## Puntos de partida que conllevan mucho trabajo. Complicados:

* JS
  * Acorn un compilador de JS descendente recursivo:
    * [Acorn A small, fast, JavaScript-based JavaScript parser](https://github.com/acornjs/acorn)
    * [by Marijn Haverbeke. Acorn: yet another JavaScript parser](http://marijnhaverbeke.nl/blog/acorn.html)
  * [Gramática de JS en PEGjs](https://github.com/pegjs/pegjs/blob/master/examples/javascript.pegjs)
* [Python Grammar](https://docs.python.org/3/reference/grammar.html)
* [Ruby Grammar](https://www.cse.buffalo.edu/~regan/cse305/RubyBNF.pdf)
* [Java Grammar](https://docs.oracle.com/javase/specs/jls/se7/html/jls-18.html)

## Sugerencias

A la hora de escribir el ejecutable que hace la traducción se encontrará con el problema de parsear la línea de comandos.
Puede usar el módulo [commander](https://www.npmjs.com/package/commander) para ello

Dado que esta práctica esta en un repo y su intérprete de `egg` está en otro repo, tenemos que resolver el problema de las "dependecias externas". Podríamos usar submódulos git pero en este caso como tenemos publicado en github-registry nuestro intérprete egg lo usaremos en nuestro compilador del lenguaje infijo que hemos diseñado

El ejemplo que sigue muestra soluciones a estos problemas:

  **[~/.../crguezl-infix2-egg(master)]$ cat bin/infix2egg.js**

  ```js
  #!/usr/bin/env node
  const fs = require('fs');
  const commander = require('commander');
  const { egg } = require('@XXXXXXXXXX/egg');
  const { parseFromFile } = require('../lib/parseFile');

  commander
    .version(require('../package.json').version)
    .option('-r --run <fileName>', 'compiles the input infix program and runs it using the egg interpreter')
    .option('-c --compile <fileName>', 'compile the infix program to produce a JSON containing the input egg AST')
    .option('-i --interpret <fileName>', 'interprets the egg AST')
    .option('-p --plugins [plugin1:plugin2:...:pluginK]', 'specify infix/egg plugins', val => val.split(':'))
    .parse(process.argv);

  // Execute plugins
  if (commander.plugins) {
    commander.plugins.forEach(require);
  }
  // Compile and interpret
  if (commander.run) {
    const ast = JSON.stringify(parseFromFile(commander.run));
    egg.interpretFromPlainAst(ast);
  }
  // Run the parser to produce the EGG AST from the infix program
  else if (commander.compile) {
    const outputPath = `${commander.compile}.egg.evm`;
    const ast = parseFromFile(commander.compile);
    fs.writeFileSync(outputPath, JSON.stringify(ast, null, '\t'));
  }
  // Interpret
  else if (commander.interpret) {
    egg.runFromEVM(commander.interpret);
  }
  // Show help
  else {
    commander.help();
  }
  ```

## Recursos

* Una solución:
  ```
   [~/.../eval/lucas(casiano)]$ pwd -P
   /Users/casiano/campus-virtual/1819/pl1819/introduccion/tema3-analisis-descendente-predictivo-recursivo/practicas/p8-t3-pdr-infix2egg/eval/p8-t3-pdr-infix2eg-alu0101042305
  ```
  - [Repo](https://github.com/ULL-ESIT-PL-1819/p8-t3-pdr-infix2eg-alu0101042305/tree/casiano)

* [Apuntes de PL: Análisis Sintáctico Predictivo Recursivo](http://crguezl.github.io/pl-html/node22.html)
* [Repo con una solución a un lenguaje similar](https://github.com/crguezl/prdcalc)
  -  [Despliegue en Heroku](https://pl1718-prdcalc.herokuapp.com/)
  - [Fichero main.js con un parser similar al que se solicita](https://github.com/crguezl/prdcalc/blob/master/views/main.js)
* [Repo de ejemplo](https://github.com/ULL-ESIT-PL-1617/solution-evalua-pdr)
* [Repo con una solución a Eloquent JS. Chapter 12 Project. A Programming Language](https://github.com/ULL-ESIT-PL-1617/egg)
* [Mocha](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pruebas/mocha.html)
* [Chai](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pruebas/chai.html)
* [Covering](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pruebas/covering.html)
* [Blanket](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pruebas/blanket.html)



