---
layout: default
title: p5-t3-egg-0
permalink: /tema3-analisis-descendente-predictivo-recursivo/practicas/p5-t3-egg-0/
previous: 
  url: /tema2-expresiones-regulares-y-analisis-lexico/practicas/p10-t2-lexer-generator/
---

# Práctica: Egg. A Programming Language (p5-t1-egg-0)

## Introducción

Esta es la primera práctica de una serie de prácticas sobre las fases de análisis sintáctico, el análisis de ámbito y la interpretación del codigo. Las siguientes prácticas irán ampliando el lenguaje con nuevas capacidades: expresiones regulares, hashes, arrays multidimensionales, módulos, objetos, clases, ... y se construyen sobre esta.


Primero: Deberá leer el capítulo 12 *A Programming Language* de EJS:

* [Eloquent JS. Chapter 12. Project: A Programming Language](http://eloquentjavascript.net/12_language.html)

Se presenta un lenguaje llamado **Egg** (de tipo "Lisp") y se describe como procesarlo
e interpretarlo.

Lea cuidadosamente el capítulo intentando comprender como funcionan las dos fases: la primera con el análisis sintáctico que produce el AST y la segunda 
en la que se ejecuta el AST.

Es fundamental que llegue a dominar las bases que se asientan en esta capítulo. 
Son un montón de conceptos. 
No desespere si al principio todo es un poco confuso. 
Si tal cosa ocurre puede que le ayude dejar por un momento la lectura y pasar a leer primero las secciones

1. [Escriba la gramática](#gramatica) y 
2. Introducción al [Análisis Sintáctico Predictivo Recursivo]({{site.baseurl}}/tema3-analisis-descendente-predictivo-recursivo/pdr-teoria)
 
Después de estas dos lecturas vuelva otroa vez a la lectura del capítulo [Chapter 12. Project: A Programming Language](http://eloquentjavascript.net/12_language.html).
No haga todavía los ejercicios del libro.

### NOTA

En algunos de los ejemplos, vídeos, etc. que acompañan esta práctica puede notar algunas 
inconsistencias en el lenguaje Egg debidas a que casi en cada curso hemos ido haciendo alias de algunos de los nombres de los constructos. Por ejemplo en el vídeo en vez de `fun` usamos `->` y en algún ejemplo en los apuntes en vez de `element` se usa `<-`, etc. Son cambios triviales que no afectan al núcleo de lo que se dice.

## Escriba la Gramática {#gramatica}

Escriba en su `README.md` las reglas de producción de la gramática que reconoce el traductor

Tiene una solución [aquí]({{site.baseurl}}/tema3-analisis-descendente-predictivo-recursivo/egg-grammar)

## Análisis Sintáctico Predictivo Recursivo 

Lea esta breve introducción a como se escribe un analizador  Sintáctico Predictivo Recursivo como el que se construye en el capítulo 12 *A Programming Language* de EJS:

[Análisis Sintáctico Predictivo Recursivo]({{site.baseurl}}/tema3-analisis-descendente-predictivo-recursivo/pdr-teoria)

## Fixing Scope

Resuelva ahora los dos ejercicios propuestos en el capítulo:

1. [Comments](https://eloquentjavascript.net/12_language.html#i_/OBuIOX390) y 
2. [Fixing Scope](https://eloquentjavascript.net/12_language.html#i_Y9ZDMshYCQ)

Si no se le ocurre como resolver el segundo apartado, *Fixing Scope*, no desespere. Es un ejercicio muy difícil. Inténtelo mas de una vez.

Puede encontrar una solución al problema en la rama [Inicial de este repo ULL-ESIT-PL-1617/egg/](https://github.com/ULL-ESIT-PL-1617/egg/tree/inicial). 
Si no se le ocurre una solución acuda a este enlace. 
Y si se le ocurrió  también. Contraste las soluciones y quédese con la que le parezca mejor.


## Separe en Módulos el Programa

Separe el código en dos módulos Node.js:

```
lib
├── eggvm.js
└── parse.js
```

- `parse.js` debe contener las funciones del análisis léxico y sintáctico y exportarlas

  ```
  [~/.../crguezl-egg(master)]$ tail -n 9 lib/parse.js
  ```
  ```js
  module.exports = {
    ...
    parse,
    parseApply,
    parseExpression,
    parseFromFile,
  };
  ```

- `eggvm.js`debe contener todo el código relativo al entorno de ejecución. Este módulo debería exportar funciones para la ejecución del árbol generado en la primera fase como `run`, `runFromFile`, `runFromEVM`:

  ```
  [~/.../crguezl-egg(master)]$ tail -n 1 lib/eggvm.js
  ```
  ```js
  module.exports = {
    run, 
    runFromFile, 
    runFromEVM, 
    topEnv, 
    specialForms, 
    parser, 
    evaluate
  };
  ```
  
Añada también tres ejecutables que usan los módulos anteriores:

```
[~/.../crguezl-egg(master)]$ tree bin
bin
├── egg.js
├── eggc.js
└── evm.js
```

### egg

El programa `egg`  deberá ejecutar el programa `.egg` que se le pasa por línea de comandos:

```lisp
$ cat one.egg
do(
  define(x, 4),
  define(setx, fun(val, 
      set(x, val)
    )
  ),
  setx(50),
  print(x)
)
$ egg one.egg
50
```

### eggc
 
Compiles the input program to produce a JSON containing the tree: `eggc examples/two.egg` produces the JSON file `examples/two.egg.evm`

Por ejemplo, si le damos como entrada este programa:

```
[~/.../crguezl-egg(master)]$ cat examples/two.egg
```
```lisp
do(
  define(sum,  # function
    fun(nums, other,
      do(
         print(other),
         define(i, 0),
         define(sum, 0),
         while(<(i, length(nums)),
           do(define(sum, +(sum, element(nums, i))),
              define(i, +(i, 1))
           )
         ),
         sum
      )
   )
 ),
 print(sum(array(1, 2, 3), 4))
)
```

Si ejecutamos `bin/eggc.js  examples/two.egg` produce como salida un fichero con el mismo nombre y extensión `.evm` (por Egg Virtual Machine) que no es otra cosa que el AST generado por el parser guardado como un objeto JSON.

```
[~/.../crguezl-egg(master)]$ bin/eggc.js examples/two.egg
[~/.../crguezl-egg(master)]$ ls -ltr examples/two.egg.evm
-rw-r--r--  1 casiano  staff  7466  2 abr 11:03 examples/two.egg.evm
```

Puede ver los contenidos del JSON generado en la ejecución de ejemplo en este enlace:

* [examples/two.egg.evm](two.egg.evm)

### evm 

El intérprete `evm` ejecuta los ficheros en formato *Egg Virtual Machine*. 

```
[~/.../crguezl-egg(master)]$ bin/evm.js examples/two.egg.evm
4
6
```

### Examples folder

Añada una carpeta `examples` en la que guardará los ejemplos con los que va comprobando la funcionalidad de su compilador:

```
[~/.../crguezl-egg(master)]$ tree examples/ -I '*evm'
examples/
├── array.egg
├── greater-x-5.egg
├── if.egg
├── ...
└── two.egg
```

Cada vez que introduzca una nueva funcionalidad cree uno o varios ejemplos que sirvan para ilustrarla y comprobar el buen funcionamiento.

Por ejemplo, cuando trabajemos en la tarea  `Fixing Scope` podemos añadir a nuestro 
directorio `examples` un par de ejemplos que ilustran como debería funcionar.

Uno que produzca una excepción:

```
[~/.../crguezl-egg(private2019)]$ cat examples/scope-err.egg
do(
  set(x,9),
  print(x) # ReferenceError: Tried setting an undefined variable: x
)
```

y al menos otro que muestre como unas variables ocultan a otras:

```
[~/.../crguezl-egg(private2019)]$ cat examples/scope.egg
do(
  def(x,9),
  /* def crea una nueva variable local */
  def(f, fun{
    do{
      def(x, 4),
      print(x) # 4
    }
  }),
  /* set no crea una nueva variable local */
  def(g, fun{set(x, 8)}),
  f(),
  print(x), # 9
  g(),
  print(x) # 8
)
```

Conforme programamos, vamos ejecutando nuestra solución contra estos programas. 
Cuando tengamos la solución correcta la salida debería ser algo así:

```
[~/.../crguezl-egg(private2019)]$ bin/egg.js examples/scope-err.egg
ReferenceError: Tried setting an undefined variable: x
```

```
[~/.../crguezl-egg(private2019)]$ bin/egg.js examples/scope.egg
4
9
8
```

Uno de nuestros objetivos es reciclar esos ejemplos en las pruebas y en la documentación.

### Test Folder

Añadimos una carpeta `test` y en ella los 
programas de prueba `test/test.js` (Mocha o Jest, use lo que prefiera. Los ejemplos que siguen están en Mocha). 

Creamos tabién un subdirectorio `test/examples` en el que copiamos nuestro ejemplo de prueba:
  
```
cp examples/scope.egg test/examples/
``` 

y junto a el escribimos un fichero con la salida esperada `test/examples/scope.egg.expected`.

Una estructura como esta:

```
test/
├── examples
│   ├── scope.egg
│   └── scope.egg.expected
└── test.js
```
  
Cada vez que logramos implementar una nueva funcionalidad o un nuevo objetivo añadimos en el directorio `examples` uno o varios  programas `examples/objetivo.egg` cuya ejecución muestra el buen funcionamiento de nuestro código. También lo añadimos a `test/examples/objetivo.egg` así como la salida esperada `test/examples/objetivo.egg.expected`. 

De esta forma la prueba se reduce a comprobar que la salida de la ejecución del programa `test/examples/objetivo.egg` es igual a los contenidos de `test/examples/objetivo.egg.expected`.

Puede usar el módulo [@ull-esit-pl/example2test](https://www.npmjs.com/package/@ull-esit-pl/example2test) para simplificar esta metodología

```
[~/.../test(private2019)]$ cat scopes.js
```
```js
let fs = require('fs');
let should = require("should");
let e2t = require('@ull-esit-pl/example2test');
let eggvm = require('../lib/eggvm.js');

describe("Testing scopes", function() {
  let runTest = (programName, done) => {
    e2t({
      exampleInput: programName+'.egg',
      executable: 'bin/egg.js',
      assertion: (result, expected) => result.trim().should.eql(expected.trim()),
      done: done,
    });
  };

  it("should  not allow the use of non declared variables", function() {
    let program = fs.readFileSync('examples/scope-err.egg', 'utf8');
    (() => { eggvm.run(program); }).should.throw(/setting.+undefined.+variable/i);
  });

  it("testing scope.egg", function(done) {
    runTest('scope', done);
  });
});
```

Como se puede apreciar, el objeto `eggvm` exportado por el módulo `lib/eggvm.js`
dispone de un método `run` que ejecuta la cadena que se le pasa como entrada.

No olvides ejecutar **todas** las pruebas `npm test` cada vez que resuelves un nuevo objetivo

```
[~/.../crguezl-egg(private2019)]$ npx mocha test/scopes.js
  Testing scopes
    ✓ should  not allow the use of non declared variables
    ✓ testing scope.egg (138ms)
  2 passing (151ms)
```

## Continuous Integration

Use GitHub Actions para añadir CI al proyecto

## GitHub Registry

Publique el compilador como módulo en GH Registry en el ámbito `@ULL-ESIT-PL-1920`.

Puesto que este paquete contiene ejecutables es conveniente que lea la sección
[bin](https://docs.npmjs.com/files/package.json#bin) de la documentación de npm.js sobre package.json:

```
[~/.../crguezl-egg(master)]$ jq .bin package.json
```
```js
{
  "egg": "./bin/egg.js",
  "eggc": "./bin/eggc.js",
  "evm": "./bin/evm.js"
}
```

## Analizador Léxico Separado

Intente ahora separar la fase de análisis sintáctico de la fase de análisis léxico
en una función separada `lex` que cada vez que es llamada por las funciones  `parseExpression` y `parseApply` retorna
el siguiente token. 

Esto es, a diferencia de en los ejemplos vistos en las clases anteriores, el analizador léxico no analiza todos los tokens en una pasada guardándolos en un array, sino que tan pronto como detecta el siguiente token lo devuelve a la rutina de  análisis sintáctico que le ha llamado.

```js
let lookahead;
let lineno = 1; // Save token line numbers
let offset = 0; // Save token offset
...
function lex() {
  let match;
  ... // Find the next token and save it in lookahead 
  return lookahead;
}
```

Se usará una variable compartida que se debe llamar `lookahead` para guardar el token actual. Esta variable `lookahead` sirve para la comunicación entre las funciones de análisis sintactico y el analizador léxico. Algo como esto:

```js
function parseExpression() {
  let expr;

  if (lookahead.type == "STRING") {
    expr = {type: "value", value: lookahead.value};
    lex();
    return expr;
  } else if (lookahead.type == "NUMBER") {
    expr = {type: "value", value: lookahead.value};
    lex();
    return expr;
  } else if (lookahead.type == "WORD") {
    expr = {type: "word", name: lookahead.value};
    lex();
    return parseApply(expr);
  } else {
    throw new SyntaxError(`Unexpected syntax line ${lineno}: ${program.slice(0,10)}`);
  }
}
```

Si logra resolver estos objetivos ¡Enhorabuena!.

Puede encontrar una solución a los problemas planteados en este repo [ULL-ESIT-PL-1617/egg](https://github.com/ULL-ESIT-PL-1617/egg). Asegúrese que entiende como funciona.
También puede encontrarlo como módulo en npm [@crguezl/eloquentjsegg](https://www.npmjs.com/package/@crguezl/eloquentjsegg) 


A continuación mejore el analizador léxico que encuentra en este repo 
como sigue:

1. Guarde en el objeto token el `offset` de comienzo, la línea de comienzo, etc
2. Mejore los mensajes de error usando esta información
3. El analizador léxico actual destruye la cadena conteniendo el programa conforme la analiza.  Es posible  escribir una analizador léxico que recorra la cadena conteniendo el programa sin destruirla usando la opción `sticky`. Estudie esta mejora
4. Mejore las pruebas, especialmente con programas que contienen errores

## Bucle REPLpara egg (Repeat Evaluate Print Loop)


Haga que el ejecutable `egg` funcione como un bucle REPL cuando no se le proporciona un fichero de entrada. 


```lisp
[~/ull-pl1718-campus-virtual/tema3-analisis-sintactico/src/egg/crguezl-egg(private)]$ bin/egg.js
> def(x, array(1,2,array(3,4))) # x = [1,2,[3,4]]
[ 1, 2, [ 3, 4 ] ]
> <-(x,2) # 3d element
[ 3, 4 ]
> <-(x,0) # 1st element
1
> # Pulsamos CTRL-D
> goodbye!
```

En este [Vídeo *Programando un bucle REPL para el lenguaje Egg*](https://youtu.be/5gIlt6r29lw) explicamos como hacerlo

<iframe 
width="560" 
height="315" 
src="https://www.youtube.com/embed/5gIlt6r29lw" 
frameborder="0" 
allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Recursos

* [Eloquent JS: Chapter 11. Project: A Programming Language](http://eloquentjavascript.net/11_language.html)
* [El lenguaje egg: repo en GitHub](https://github.com/ULL-ESIT-PL-1617/egg)
* [Repo interpreter-egg](https://github.com/ULL-ESIT-PL-1617/interpreter-egg)
* [NodeJS Readline gist](https://gist.github.com/crguezl/430642e29a2b9293317320d0d1759387)
* En el repo [ULL-ESIT-PL-1617/interpreter-egg](https://github.com/ULL-ESIT-PL-1617/interpreter-egg) se muestra como hacer un bucle REPL
* [Vídeo *Programando un bucle REPL para el lenguaje Egg*](https://youtu.be/5gIlt6r29lw)
* [XRegExp](http://xregexp.com/)
* El módulo [@ull-esit-pl/example2test](https://www.npmjs.com/package/@ull-esit-pl/example2test)
* Tests. Mocking and Stubbing
    * [Sinon API](http://sinonjs.org/releases/v1.17.7/)
    * [Side effects of stubbing console in tests](https://gyandeeps.com/console-stubbing/)
    * [Unit Test like a Secret Agent with Sinon.js](http://elijahmanor.com/unit-test-like-a-secret-agent-with-sinon-js/) by Elijah Manor

