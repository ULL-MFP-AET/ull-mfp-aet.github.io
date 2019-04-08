# Práctica: Egg. A Programming Language. Segunda Parte (p6-t3-egg-1)

## Requisitos

* Use el repo de GitHub dado por la asignación de esta tarea partiendo de la [práctica anterior](https://crguezl.github.io/ull-esit-1617/_book/practicas/practica-egg.html)
* Modifique el AST para dar una solución OOP con clases: 
  - una clase `Value`, 
  - una clase `Word`, 
  - una clase `Apply`, ...
  de manera que cada clase de objeto dispone de un método `evaluate`. 

  **[~/ull-pl1718-campus-virtual/tema3-analisis-sintactico/src/egg/crguezl-egg(private)]$ cat lib/ast.js**
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

  Aisle estas clases en un fichero `lib/ast.js`:
  ```
  [~/ull-pl1718-campus-virtual/tema3-analisis-sintactico/src/egg/crguezl-egg(private)]$ tree -I 'node_modules|examples|egg-*'
  .
  ├── README.md
  ├── bin
  │   ├── egg.js
  │   ├── eggc.js
  │   └── evm.js
  ├── gulpfile.js
  ├── lib
  │   ├── ast.js            # Clases para los nodos del AST
  │   ├── eggvm.js
  │   ├── environment.js    # specialForms and topEnv initialization
  │   ├── parse.js
  │   └── registry.js       # specialForms and topEnv maps
  ├── package-lock.json
  ├── package.json
  └── test
      └── test.js

  3 directories, 14 files
  ```

  La función `evaluate` con el `switch` que estaba en `lib/eggvm.js` desaparece en esta versión

* Modifique la evaluación de los nodos `Apply` de manera que si el objeto JavaScript subyacente `obj`
tiene un método con nombre `"meth"`, este  pueda ser llamado usando la sintáxis de `Apply`: 

  ```js 
  obj("meth", args)
  ```

  Por ejemplo:

  **[~/campus-virtual/1819/pl1819/introduccion/tema3-analisis-descendente-predictivo-recursivo/practicas/p5-t3-egg-0/egg(private2019)]$ cat examples/method.egg**

  ```js
  do(
    def(x, array[1,4,5]),
    print(x("join", "-"))
  )
  ```

  que cuando se ejecuta da:

  ```
  [~/campus-virtual/1819/pl1819/introduccion/tema3-analisis-descendente-predictivo-recursivo/practicas/p5-t3-egg-0/egg/crguezl-egg(private2019)]$ bin/egg.js examples/method.egg 
  1-4-5
  ```

  Otro ejemplo:

  **[~/campus-virtual/1819/pl1819/introduccion/tema3-analisis-descendente-predictivo-recursivo/practicas/p5-t3-egg-0/egg/crguezl-egg(private2019)]$ cat examples/method2.egg**

  ```js
  do(
    def(x, "hello"),
    print(x("toUpperCase"))
  )
  ```

  que cuando se ejecuta da:

  ```
  [~/campus-virtual/1819/pl1819/introduccion/tema3-analisis-descendente-predictivo-recursivo/practicas/p5-t3-egg-0/egg/crguezl-egg(private2019)]$ bin/egg.js examples/method2.egg 
  HELLO
  ```

  Se debería poder concatenar las llamadas de métodos:

  **[~/campus-virtual/1819/pl1819/introduccion/tema3-analisis-descendente-predictivo-recursivo/practicas/p5-t3-egg-0/egg/crguezl-egg(private2019)]$ cat examples/method3.egg**

  ```js
  do(
    def(x, array["a","b","c"]),
    print(x("join", "-")("toUpperCase"))
  )
  ```

  que cuando se ejecuta da:

  ```
  [~/campus-virtual/1819/pl1819/introduccion/tema3-analisis-descendente-predictivo-recursivo/practicas/p5-t3-egg-0/egg/crguezl-egg(private2019)]$ bin/egg.js examples/method3.egg 
  A-B-C
  ```

  la concatenación puede ser larga

  **[~/.../crguezl-egg(private2019)]$ cat examples/method-concatenation.egg**
  
  ```js
  do(
    print(array[1,4,5]("join", "-")("substring",0,2)("concat", "hello egg"))
  )
  ```

  cuya ejecución resulta en:

  ```
  [~/.../crguezl-egg(private2019)]$ bin/egg.js  examples/method-concatenation.egg 
  1-hello egg
  ```

* Utilizando lo anterior y JS Monkey patching, añada propiedades a los objetos JavaScript, de manera que programas como este funcionen:

  **[~/campus-virtual/1819/pl1819/introduccion/tema3-analisis-descendente-predictivo-recursivo/practicas/p5-t3-egg-0/egg/crguezl-egg(private2019)]$ cat examples/property.egg**

  ```js
  do( # test properties in egg
    def(x, array[1,array[3,2,5]]),
    print(x("length")),          # 2
    print(x["sub", 1]("length")) # 3
  )
  ```

  En este ejemplo hemos añadido el método `sub` a la clase JS `Array`. Cuando se ejecuta da:

  ```
  [~/campus-virtual/1819/pl1819/introduccion/tema3-analisis-descendente-predictivo-recursivo/practicas/p5-t3-egg-0/egg/crguezl-egg(private2019)]$ bin/egg.js examples/property.egg 
  2
  3
  ```

* Modifique la evaluación de los nodos `Apply` para que cuando se trata de una propiedad/atributo que no es una función/método se retorne el valor de la propiedad:

  **[~/.../crguezl-egg(develop-oop-idea)]$ cat examples/array-properties.egg**

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
  [~/.../crguezl-egg(develop-oop-idea)]$ bin/egg.js examples/array-properties.egg 
  1
  [ 5, 3 ]
  3
  ```

* Modifique la gramática de Egg para que las `String` y los `Number` puedan hacer `apply`:

  **[~/.../crguezl-egg(private2019)]$ cat examples/string-apply.egg**

  ```js
  do {
    print("hello"("length")),
    print(4("toFixed", 2))
  }
  ```

  Que cuando se ejecuta debería dar una salida como esta:

  ```
  [~/.../crguezl-egg(private2019)]$ bin/egg.js  examples/string-apply.egg 
  5
  4.00
  ```

* Extienda las clases Number y String con Monkey Patching para permitir mayor expresividad en el lenguaje Egg como en este ejemplo en el que los números tienen un método `+`:

  **[~/.../crguezl-egg(private2019)]$ cat examples/string-apply.egg**

  ```js
  do {
    print("hello"("length")),
    print(4("toFixed", 2)),
    print(4("+", 5, 7, 3)) # 19
  }
  ```

  Cuando se ejecuta obtenemos:

  ```
  [~/.../crguezl-egg(private2019)]$ bin/egg.js  examples/string-apply.egg 
  5
  4.00
  19
  ```

* Añada índices negativos (a la Ruby) para los arrays 

* Extienda `set` para que se puedan modificar elementos de los arrays

  **[~/.../crguezl-egg(private2019)]$ cat examples/array-set-index.egg** 

  ```
  do(
    def(x, array[1,2,3, array[9,8,7]]),
    set(x, 2, 9),
    print(x),             # [ 1, 2, 9, [ 9, 8, 7 ] ]
    set(x, 3, 1, 1000),
    print(x)              # [ 1, 2, 9, [ 9, 1000, 7 ] ]
  )
  ```

  Ejecución:

  ```
  [~/.../crguezl-egg(private2019)]$ bin/egg.js examples/array-set-index.egg 
  [ 1, 2, 9, [ 9, 8, 7 ] ]
  [ 1, 2, 9, [ 9, 1000, 7 ] ]
  ```

  No se debería poder hacer un `set` con índices de una variable no estructurada

  **[~/.../crguezl-egg(private2019)]$ cat examples/set-error.egg**

  ```
  do(
    def(x,4),
    set(x,1, 2),
    print(x)
  )
  ```

  ```
  [~/.../crguezl-egg(private2019)]$ bin/egg.js examples/set-error.egg 
  ReferenceError: Tried to set with indices a scalar variable ''x'
  ```

* Añada mapas/hashes al lenguaje Egg



## Recursos

* [Eloquent JS: Chapter 11. Project: A Programming Language](http://eloquentjavascript.net/11_language.html)
* [El lenguaje egg: repo en GitHub](https://github.com/ULL-ESIT-PL-1617/egg)
* [Repo interpreter-egg](https://github.com/ULL-ESIT-PL-1617/interpreter-egg)
* [NodeJS Readline gist](https://gist.github.com/crguezl/430642e29a2b9293317320d0d1759387)
* En el repo [ULL-ESIT-PL-1617/interpreter-egg](https://github.com/ULL-ESIT-PL-1617/interpreter-egg) se muestra como hacer un bucle REPL
* [XRegExp](http://xregexp.com/)


