# Práctica: Egg. A Programming Language. Continuación. (p6-t3-egg-1) (p7-t3-egg-2) (p8-t3-egg-4) (etc)

## Requisitos

* Use el repo de GitHub dado por la asignación de esta tarea partiendo de la [práctica anterior](https://crguezl.github.io/ull-esit-1617/_book/practicas/practica-egg.html)

### Clases de nodos del AST: evaluate como método del nodo

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

### Actualice la máquina virtual `evm` para que pueda ejecutar los JSON

Despúes de conseguido el requisito anterior nos encontramos con un problema:

1. `bin/eggc prog.egg` produce como salida un JSON `prog.egg.evm` conteniendo la estructura del árbol descrita en JSON
2. Cuando ejecutamos `bin/eggvm prog.egg.evm` falla porque la estructura del JSON es plana y ahora `evaluate` es un método
definido en las clases de nodos `VALUE`, `WORD`y `APPLY`

Escriba una función `json2AST` que convierta la estructura de datos plana en un AST en los que cada nodo pertenece a la clase correspondiente 



### Llamada a Métodos JS de los Objetos

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

### Propiedades JS de los objetos

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

### Acceso a las Propiedades de los Objetos JavaScript 

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

### Todos pueden llamar

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

### Monkey Patching

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

### Element: Posibilidad de Indexar con mas de un Índice

* Añada la posibilidad de indexar con mas de un índice a `element`

  **[~/.../crguezl-egg(private2019)]$ cat  examples/array-index.egg**

  ```
  do(
    def(x, array[1, array[2,3]]),
    print(element(x,0)),          # 1
    print(element(x,1)),          # [ 2, 3 ]
    print(element(x,1,1)),        # 3
    print(element(x,-1,-1)),      # 3
    print(element(x,-1,0))        # 2
   )
  ```

  Ejecución:

  ```
  [~/.../crguezl-egg(private2019)]$ bin/egg.js  examples/array-index.egg 
  1
  [ 2, 3 ]
  3
  3
  2
  ```

### Set: Modificar Elementos de un Array

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

### Hashes

* Añada mapas/hashes al lenguaje Egg

  **[~/.../crguezl-egg(private2019)]$ cat examples/map.egg**

  ```
  do {
    def(x, map["x", 4, "y", map["z", 3]]),
    print(x),                               # { x: 4, y: { z: 3 } }
    print(element(x, "x")),                 # 4
    print(element(x, "y")),                 # { z: 3 }
    print(element(x, "y", "z"))             # 3
  }
  ```
  
  Ejecución:

  ```
  [~/.../crguezl-egg(private2019)]$ bin/egg.js examples/map.egg 
  { x: 4, y: { z: 3 } }
  4
  { z: 3 }
  3
  ```

### Dos puntos como operador léxico

* Nos gustaría poder escribir los hashes/mapas usando `:` para separar el nombre de la clave del valor, como en este ejemplo:


  **[~/.../crguezl-egg(develop-oop-idea)]$ cat examples/map-colon.egg**
 
  ```
  do {
    def(x, map[x: 4, y: map[z: 3]]),
    print(x),                               # { x: 4, y: { z: 3 } }
    print(element(x, "x")),                 # 4
    print(element(x, "y")),                 # { z: 3 }
    print(element(x, "y", "z"))             # 3
  }

  [~/.../crguezl-egg(develop-oop-idea)]$ bin/egg.js  examples/map-colon.egg 
  { x: 4, y: { z: 3 } }
  4
  { z: 3 }
  3

  ```

  Una forma de hacer esto es empezar haciendo que el análisis léxico acepte el carácter `:` para el token `COMMA`

  ```js
  const COMMA = new XRegExp(`
    (
      ,|:(?!=) # : is an alias for comma ',' when not followed by '='
    )
  `, 'xy');
  ```

  y *trucando* nuestro analizador léxico para que siempre que una `WORD` vaya seguida de `:` se retorne una `STRING`!:

  ```js
  nextToken = function() {
    if (count < result.length) {
      lookahead = result[count++];
      if (lookahead && (lookahead.type === 'WORD') && (result[count] && result[count].value === ":")) {
        //debugger;
        lookahead.type = "STRING";
      }
      return lookahead;
    }
    else return null;
  }
  ```

* Haga que los mapas tengan un método `sub`  que permita indexar los mapas:

  **[~/.../crguezl-egg(develop-oop-idea)]$ cat examples/map-sub.egg**

  ```js
  do(
    def(x, map{a: 1, b: 4, c: map{d: 5, e: 3}}),
    print(x[sub: "a"]),     # 1
    print(x[sub: "c"]),     # Map { d: 5, e: 3 }
    print(x[sub: "c", "e"]) # 3
  )
  ```

  Ejecución:

  ```
  [~/.../crguezl-egg(develop-oop-idea)]$ bin/egg.js examples/map-sub.egg 
  1
  Map { d: 5, e: 3 }
  3
  ```

### OOP en Egg

* Añada objetos al lenguaje Egg de manera que podamos escribir programas como este:

  **[~/.../crguezl-egg(private2019)]$ cat examples/objects.egg**
   
  ```js
  do (
    def(x, object ( 
      "c", 0,
      "gc", ->{element[this, "c"]},
      "sc", ->{value, =(this, "c", value)},
      "inc", ->{=(this, "c", +(element[this, "c"],1))}
    )),
    print(x),
    print(x("gc")),
    x("sc", 4),
    print(x("gc")),
    x("inc"),
    print(x("gc")),
  )
  ```

  Ejecución:

  ```
  [~/.../crguezl-egg(private2019)]$ bin/egg.js examples/objects.egg 
  { c: 0,
    gc: [Function: bound ],
    sc: [Function: bound ],
    inc: [Function: bound ] }
  0
  4
  5
  ```

#### Binding

Esta sección describe una conducta que no es un requisito. 
Simplemente ilustra como el hacer un binding de los métodos al objeto
tiene consecuencias:

**[~/.../crguezl-egg(private2019)]$ cat examples/bind.egg**

```js
do (
  def(x, object ( 
    "c", 0,
    "gc", ->{element[this, "c"]},
    "sc", ->{value, =(this, "c", value)},
    "inc", ->{=(this, "c", +(element[this, "c"],1))}
  )),
  print(x),
  x.sc(4),
  define(g, element(x, "gc")),
  print(g),    # [Function: bound ]
  print(g()),  # 4
  define(h, element(x, "sc")),
  print(h),    # [Function: bound ]
  print(h(5)), # 5
  print(x.c),  # 5
  print(x.gc), # 5
  print(g()),  # 5
)
```

Ejecución:

```
[~/.../crguezl-egg(private2019)]$ bin/egg.js examples/bind.egg 
{ c: 0,
  gc: [Function: bound ],
  sc: [Function: bound ],
  inc: [Function: bound ] }
[Function: bound ]
4
[Function: bound ]
5
5
5
5
```

### DOT

* Syntactic Sugar: Introduzca el operador punto (dot) para poder acceder a los métodos y atributos de un  objeto.
  La idea es que una expresión como:

  ```js
  a.b.c(arg1)
  ```
  
  es equivalente a esta otra expresión:

  ```js
  a("b")("c", arg1)
  ```
  Esto es,el dot es como una llamada/apply del objeto en el que el primer argumento es el atributo/método

  **~/.../crguezl-egg(private2019)]$ cat examples/dot.egg**

  ```
  do(
    def(x, array[1,4,5]),
    def(s, x.join("-")),                 # The same as x("join", "-")
    print(s),                            # 1-4-5
    print(array[1,4,5].join("-").length) # 5
  )
  ```

  Ejecución:

  ```
  [~/.../crguezl-egg(private2019)]$ bin/egg.js examples/dot.egg 
  1-4-5
  5
  ```

  Otro ejemplo, esta vez con objetos Egg.

  **[~/.../crguezl-egg(private2019)]$ cat examples/dot-obj-2.egg**

  ```
  do (
    def(x, object ( 
      c:   0,
      gc:  ->{this.c},
      sc:  ->{value, =(this, "c", value)},
      inc: ->{=(this, "c", +(this.c, 1))}
    )),
    print(x),
    print(x["c"]),
    print(x.c),
    print(x.gc),             # calls the function!
    print(element(x, "gc")), # [Function: bound ]
    print(x("sub", "gc")),   # [Function: bound ]
    print(x.sub("gc")),      # [Function: bound ]
    print(x.sc(5)),
    print(x("sc", 5)),
    print(x.gc)
  )
  ```

  Ejecución:

  ```
  [~/.../crguezl-egg(private2019)]$ node bin/egg.js examples/dot-obj-2.egg 
  { c: 0,
    gc: [Function: bound ],
    sc: [Function: bound ],
    inc: [Function: bound ] }
  0
  0
  0
  [Function: bound ]
  [Function: bound ]
  [Function: bound ]
  5
  5
  5
  ```

  Otro ejemplo con números:

  **[~/.../crguezl-egg(private2019)]$ cat examples/dot-num.egg**

  ```
  do{
    print(4.toFixed(2)),
    def(x, 4),
    print(x("toFixed", 2)),
    def(z, x.toFixed(2)),
    print(z),
  }
  ```

  Ejecución:

  ```
  [~/.../crguezl-egg(private2019)]$ bin/egg.js examples/dot-num.egg 
  4.00
  4.00
  4.00
  ```

### Require

* Expanda el lenguaje con un `require` para que permita el uso de librerías 
  * Repase el vídeo [Como implementar la funcionalidad de "require"](https://www.youtube.com/watch?v=qffmnSCRR3c&feature=youtu.be).
  * Aquí tiene un enlace al [Repo correspondiente al vídeo](https://github.com/ULL-ESIT-MII-CA-1718/ejs-chapter10-modules/tree/master/require).
  * Memoize las librerías para que no se carguen dos veces
  * Procure añadir esta funcionalidad sin tocar el código principal usando el strategy pattern + registry pattern

  Código del Módulo: **[~/.../crguezl-egg(private2019)]$ cat examples/require/module.egg**

  ```js
  # module. Exports z
  do {
    print("inside module"),
    :=(z, map{inc: ->{x, 
                       +(x,1)
                     } # end fun
             } # end map
    ), # end of :=
    z  # el último valor será exportado
  }
  ```

  Programa Cliente: **[~/.../crguezl-egg(private2019)]$ cat examples/require/client.egg**

  ```js
  do {
    :=(z, require("examples/require/module.egg")),
    print(z.inc(4)),
    :=(w, require("examples/require/module.egg")),
  }
  ```

  Ejecución:

  ```
  [~/.../crguezl-egg(private2019)]$ bin/egg.js examples/require/client.egg 
  inside module
  5
  ```

  Observe como `inside module` aparece una sola vez pese a que el módulo es *required* dos veces

### RegExps

* Añada expresiones regulares al lenguaje Egg

  **[~/.../crguezl-egg(develop-oop-idea)]$ cat examples/regexp.egg** 

  ```js
  do {
    :=(d, r/
           (?<year>  \d{4} ) -?  # year 
           (?<month> \d{2} ) -?  # month 
           (?<day>   \d{2} )     # day
          /x),
    print(d.test("1987-07-14")),  # true
    :=(m, d.exec("1987-07-14")),  
    print(m), #  [ '1987-07-14', '1987', '07', '14', index: 0, input: '1987-07-14' ]
    print(m.index), # 0
    
    :=(x, RegExp.exec("2015-02-22", d)), 
                    /*
                    [ '2015-02-22',
                      '2015',
                      '02',
                      '22',
                      index: 0,
                      input: '2015-02-22',
                      year: '2015',
                      month: '02',
                      day: '22' ]
                    */
    print(x),
    print(x.year), # 2015
    print(x.month) # 02
  }
  ```

  Ejecución:

  ```
  [~/.../crguezl-egg(develop-oop-idea)]$ bin/egg.js examples/regexp.egg 
  true
  [ '1987-07-14', '1987', '07', '14', index: 0, input: '1987-07-14' ]
  0
  [ '2015-02-22',
    '2015',
    '02',
    '22',
    index: 0,
    input: '2015-02-22',
    year: '2015',
    month: '02',
    day: '22' ]
  2015
  02
  ```
  Otro ejemplo:

  **[~/campus-virtual/1819/pl1819/introduccion/tema3-analisis-descendente-predictivo-recursivo/practicas/p5-t3-egg-0/egg/crguezl-egg(develop-oop-idea)]$ cat examples/regexp-simple.egg** 

  ```js
  do {
    :=(r, r/(\w+)
           \s+
           (\d+)  # numero 
          /x),
    :=(s, r.test("a 4")),
    :=(m, r.exec(";;; a 42")),
    print(s),
    print(m),
  }
  ```

  Ejecución:

  ```
  [~/campus-virtual/1819/pl1819/introduccion/tema3-analisis-descendente-predictivo-recursivo/practicas/p5-t3-egg-0/egg/crguezl-egg(develop-oop-idea)]$ bin/egg.js examples/regexp-simple.egg 
  true
  [ 'a 42', 'a', '42', index: 4, input: ';;; a 42' ]
  ```

* Extienda el lenguaje con uno o varios tipos de  bucle `for`

## Metodología  de Trabajo

Sugerencia de metodología:

* Crearemos un [Project Board](https://help.github.com/en/articles/about-project-boards) para nuestro repo (Automated kanban)
* Cada vez que nos disponemos a abordar un nuevo objetivo añadimos una incidencia que incorporamos al tablero TODO. Lo iremos 
moviendo (tablero IN PROGESS) conforme progresa
* Conforme vayamos logrando objetivos:
  - los movemos a la columna DONE 
  - cerramos la incidencia  que habíamos creado para ese objetivo
  - y crearemos y publicaremos un [tag](https://git-scm.com/book/en/v2/Git-Basics-Tagging) en nuestro repo con el nombre del objetivo logrado. 
    - Ejemplo: `git tag -a array-negative-index -m "arrays can be indexed with negative indices" && git push origin --tags`
* Para cada entrega, 
  - creamos una rama con el correspondiente nombre `p#-t3-egg-#` y 
  - especificamos en el fichero `README.md` el grupo de objetivos logrados hasta ese momento y la fecha de la entrega
* Pruebas:
  - Cada vez que logramos un nuevo objetivo añadimos en el directorio `examples` un programa `examples/objetivo.egg` cuya ejecución muestra el buen funcionamiento de nuestro código. 
  - A continuación añadimos una prueba en el directorio `test/` que ejecuta el correspondiente programa y verifica que la salida es la esperada.
  - Puede usar el módulo [@ull-esit-pl/example2test](https://www.npmjs.com/package/@ull-esit-pl/example2test) para simplificar esta metodología
  - Ejecutamos **todas** las pruebas `npm test` cada vez que resolvemos un nuevo objetivo


## Recursos

* [Eloquent JS: Chapter 11. Project: A Programming Language](http://eloquentjavascript.net/11_language.html)
* [El lenguaje egg: repo en GitHub](https://github.com/ULL-ESIT-PL-1617/egg)
* [Repo interpreter-egg](https://github.com/ULL-ESIT-PL-1617/interpreter-egg)
* [NodeJS Readline gist](https://gist.github.com/crguezl/430642e29a2b9293317320d0d1759387)
* En el repo [ULL-ESIT-PL-1617/interpreter-egg](https://github.com/ULL-ESIT-PL-1617/interpreter-egg) se muestra como hacer un bucle REPL
* [XRegExp](http://xregexp.com/)
* El módulo [@ull-esit-pl/example2test](https://www.npmjs.com/package/@ull-esit-pl/example2test)


