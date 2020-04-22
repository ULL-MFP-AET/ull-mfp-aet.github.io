---
layout: default
title: p6-t3-egg-1
permalink: /tema3-analisis-descendente-predictivo-recursivo/practicas/p6-t3-egg-1/
previous: 
  url: /tema3-analisis-descendente-predictivo-recursivo/practicas/p5-t3-egg-0/
next:
  url: /tema3-analisis-descendente-predictivo-recursivo/practicas/p7-t3-egg-2/
---

# Práctica: Egg. A Programming Language. Continuación. (p6-t3-egg-1)


## Metodologia

{% include metodologia-egg.md %}  

## Design: Smells, The Switch Smell, The Open Closed Principle and the Strategy Pattern

Lea esta sección:

* [Design: Smells, The Switch Smell, The Open Closed Principle and the Strategy Pattern]({{site.baseurl}}/tema1-introduccion-a-javascript/design)

procurando entender los principios SOLID, el problema del Switch Smell y el  
*Strategy Pattern*. Vea el vídeo de Elijah Manor.

## AST con Clases: evaluate como método del nodo

Aplique el Strategy Pattern para eliminar el Switch Smell en el código de evaluación del 
AST.

Modifique el AST para dar una solución OOP con clases: 

- una clase `Value`
- una clase `Word`
- una clase `Apply`
  
de manera que cada clase de objeto dispone de un método `evaluate`. 

```
[~/ull-pl1718-campus-virtual/tema3-analisis-sintactico/src/egg/crguezl-egg(private)]$ cat lib/ast.js
```
```js
  // The AST classes
  const {specialForms} = require("./registry.js");

  class  Value {
    constructor(token) {
      ...
    }
    evaluate() {
      ...
    }
  }

  class  Word {
    constructor(token) {
      ...
    }
    evaluate(env) {
      ...
    }
  }

  class  Apply {
    constructor(tree) {
      ...
    }
    evaluate(env) {
      ...
    }
  }

  module.exports = {Value, Word, Apply};
```

Aisle estas clases en un fichero `lib/ast.js`. 
La función `evaluate` con el `switch` que estaba inicialmente en `lib/eggvm.js` desaparece en esta versión

**Una Solución**:

* [ULL-ESIT-PL-1920/TFA-davafons/lib/interp/ast.js](https://github.com/ULL-ESIT-PL-1920/TFA-davafons/blob/casiano/lib/interp/ast.js) 


## Jerarquía de Ficheros y Organización

* [Jerarquía de Ficheros y Organización](jerarquia-de-ficheros)

## Actualice la máquina virtual `evm` para que pueda ejecutar los JSON

{% include json2ast.md %}

## STRINGS y NUMBERS y ... todos pueden llamar

Modifique la gramática de Egg para que las `String` y los `Number` puedan hacer llamadas como si fuera *applications*:

```
[.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(casiano)]$ cat examples/string-apply.egg
```
```js
do {
  print("hello"("length")),
  print(4("toFixed")(2))
}
```

Que cuando se ejecuta debería dar una salida como esta:

```
[.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(casiano)]$ bin/egg.js examples/string-apply.egg
5
4.00
```

Un `String` o un `Number` o cualquier objeto resultante de una llamada a una *application* puede ser llamado con argumento un string con el nombre de una propiedad JS del objeto y retorna el valor de esa propiedad .

Se sigue que, en particular, si el objeto JavaScript  `obj` resultado de la llamada a una función tiene una propiedad con nombre `"meth"` que es el nombre de un método, este  podrá ser llamado usando la sintáxis: 

```js 
  obj("meth")(args)
```

Por ejemplo:

```
.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(casiano)]$ cat examples/array-properties.egg
```
```js
do(
  def(x, array[1, 4, array[5, 3]]),
  print(x[0]),   # 1
  print(x[2]),   # [5, 3]
  print(x[2][1]) # 3
)
```

Este es el resultado de la ejecución:

```
[.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(casiano)]$ bin/egg.js  examples/array-properties.egg
1
[ 5, 3 ]
3
```

Este ejemplo funciona en parte porque en JS los índices son propiedades del array.

Otro ejemplo:

```
.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(casiano)]$ cat examples/method.egg
```
```js
print(array[1,4,5]("join")("-"))
```

que cuando se ejecuta da:

```
[.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(casiano)]$ bin/egg.js examples/method.egg 
1-4-5
```

Otro ejemplo:

```
[.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(casiano)]$ cat examples/method2.egg
```
```js
do(
    def(x, "hello"),
    print(x("toUpperCase")())
)
```

que cuando se ejecuta da:

```
[.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(casiano)]$ bin/egg.js examples/method2.egg 
HELLO
```

Se debería poder concatenar las llamadas de métodos:

```
.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(casiano)]$ cat examples/method3.egg
```
```
do{
  def(x, array["a", "b", "c"]),
  print(x("join")("-")("toUpperCase")())
}
```

que cuando se ejecuta da:

```
[.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(casiano)]$ bin/egg.js examples/method3.egg 
A-B-C
```

la concatenación puede ser larga

```
[.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(casiano)]$ cat examples/method-concatenation.egg
```  
```js
do(
  print(array[1,4,5]("join")("-")("substring")(0,2)("concat")("hello egg"))
)
```
cuya ejecución resulta en:

```
[.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(casiano)]$ bin/egg.js examples/method-concatenation.egg
1-hello egg
```

Esto nos permite disponer del `map`de JS para los arrays:

```
.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(casiano)]$ cat examples/map-js-chain.egg 
```
```js
do(
    define(x, array[1,2,3,4]),
    define(inc, fun(x,i,g, +(x,1))),
    print(x("map")[inc])
)
```

cuya ejecución resulta en:

```
[.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(casiano)]$ bin/egg.js examples/map-js-chain.egg 
[ 2, 3, 4, 5 ]
```

## Monkey Patching Objetos JS

Utilizando las extensiones anteriores y haciendo Monkey patching de las clases principales de JS, podemos añadir propiedades y métodos a los objetos JavaScript, de manera que programas como este funcionen:

```
[.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(master)]$ cat examples/multi-sub-array.egg
```
```ruby
do{
  define(x, arr[1, arr[3, 4]]),
  print(x["sub"](1, 1)),
  print(element[x, 1, 1])
}
```
```
[.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(master)]$ bin/egg.js examples/multi-sub-array.egg
4
4
```

Aquí se ha extendido la clase JS Object con un método `sub` que permite la indexación del objeto.

```
[.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(casiano)]$ cat examples/setmultiarray.egg
```
```js
do{
  :=(w, array[array[1,2], array[3,4]]),
  w[":="](5, 0, 1),
  print(w),
  w[":="](-9, 1,0),
  print(w)
}
```

En este ejemplo hemos añadido el método `:=` a la clase JS `Object` que asigna el primer argumento al elemento del array indexado por los subsiguientes argumentos. 

Cuando se ejecuta da:

```
[.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(casiano)]$ bin/egg.js examples/setmultiarray.egg 
[ [ 1, 5 ], [ 3, 4 ] ]
[ [ 1, 5 ], [ -9, 4 ] ]
```

**A monkey patch** is a way for a program to extend or modify supporting system software locally (affecting only the running instance of the program).

```js
.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(casiano)]$ cat lib/monkey-patching.js //  SUB
Object.prototype[":="] = function(value, ...indices) {
  ...
};

...
```

## Recursos

* [El lenguaje egg: repo en GitHub](https://github.com/ULL-ESIT-PL-1617/egg)
* [Repo interpreter-egg](https://github.com/ULL-ESIT-PL-1617/interpreter-egg)
* [NodeJS Readline gist](https://gist.github.com/crguezl/430642e29a2b9293317320d0d1759387)
* En el repo [ULL-ESIT-PL-1617/interpreter-egg](https://github.com/ULL-ESIT-PL-1617/interpreter-egg) se muestra como hacer un bucle REPL
* [XRegExp](http://xregexp.com/)
* El módulo [@ull-esit-pl/example2test](https://www.npmjs.com/package/@ull-esit-pl/example2test)


## Referencias

* [Eloquent JS: Chapter 11. Project: A Programming Language](http://eloquentjavascript.net/11_language.html)
* [Apuntes del curso 15/16: Code Smells/Código Hediondo](https://casianorodriguezleon.gitbooks.io/pl1516/content/apuntes/codesmell.html)
* [Apuntes del curso 16/17: Patrones de Diseño](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/patterns/)
* [Apuntes del curso 15/16: Eliminando Switch Smell](https://casianorodriguezleon.gitbooks.io/pl1516/content/practicas/noswitchsmell.html)
* [Apuntes del curso 16/17: Strategy Pattern](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/patterns/strategypattern.html)
* [Apuntes del curso 16/17: Práctica: Evaluar Strategy Pattern](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/practicas/practicaevaluastrategypattern.html)
* [Apuntes del curso 16/17: Práctica: Creación de Paquetes NPM y Strategy Pattern](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/practicas/practicamodulestrategypattern.html)
* [JSHint](http://jshint.com/)

## Recursos del Profesor

### Debugging Simple Examples

{% include debugging-simple-egg-examples.md %}
* Repo [ULL-ESIT-PL-1819/private-egg](https://github.com/ULL-ESIT-PL-1819/private-egg)
* Paths:

  ```
  [~/.../egg/crguezl-egg(json2ast)]$ pwd -P
  /Users/casiano/local/src/javascript/PLgrado/eloquentjsegg
  ```

* Remotes:

  ```
  [~/.../egg/crguezl-egg(json2ast)]$ git remote -v
  gist	git@gist.github.com:2ec9aeb4e3fa512eec26.git (fetch)

  pl1617	git@github.com:ULL-ESIT-PL-1617/egg.git (fetch)

  pl1819	git@github.com:ULL-ESIT-PL-1819/egg.git (fetch)

  private-egg	git@github.com:ULL-ESIT-PL-1718/egg.git (fetch)

  private-egg-1819	git@github.com:ULL-ESIT-PL-1819/private-egg.git (fetch)
  ```

* [Repo TFA-davafons](https://github.com/ULL-ESIT-PL-1920/TFA-davafons)
  * `/Volumes/2020/pl/pl1819/practicas/TFA-04-16-2020-03-22-00/davafons`
  * [json2AST.js](https://github.com/ULL-ESIT-PL-1920/TFA-davafons/blob/casiano/lib/parser/json2AST.js)
* [Repo p6-t3-egg-1-davafons](https://github.com/ULL-ESIT-PL-1920/p6-t3-egg-1-davafons)
  * `/Volumes/2020/pl/pl1819/practicas/p6-t3-egg-1-04-16-2020-03-13-25/davafons`
