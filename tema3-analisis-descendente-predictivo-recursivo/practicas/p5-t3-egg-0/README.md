# Práctica: Egg. A Programming Language (p5-t1-egg-0)

## Introducción

En esta primera práctica deberá leer el capítulo 12 *A Programming Language* de EJS:

* [Eloquent JS. Chapter 12. Project: A Programming Language](http://eloquentjavascript.net/12_language.html)

Se presenta un lenguaje llamado **Egg** (de tipo "Lisp") y se describe como procesarlo
e interpretarlo.

Lea cuidadosamente el capítulo intentando comprender como funciona el traductor y la interpretación del árbol.

## Fixing Scope

Resuelva por su cuenta los dos ejercicios propuestos en el capítulo:

1. [Comments](https://eloquentjavascript.net/12_language.html#i_/OBuIOX390) y 
2. [Fixing Scope](https://eloquentjavascript.net/12_language.html#i_Y9ZDMshYCQ)

Si no se le ocurre como resolver el segundo apartado, *Fixing Scope*, puede encontrar una solución al problema en la rama [Inicial de este repo ULL-ESIT-PL-1617/egg/](https://github.com/ULL-ESIT-PL-1617/egg/tree/inicial). 

## Escriba la Gramática

Escriba en su `README.md` las reglas de producción de la gramática que reconoce el traductor

Tiene una solución [aquí](https://github.com/ULL-ESIT-PL-1617/egg/blob/master/README.md#grammar)


## Separe en Módulos el Programa

Separe el código en dos módulos node:

```
lib
├── eggvm.js
└── parse.js
```

- `parse.js` debe contener las funciones del análisis léxico y sintáctico
- `eggvm.js`debe contener todo el códigorelativo al entorno de ejecución
  
Añada también tres ejecutables que usan los módulos anteriores:

```
[~/.../crguezl-egg(master)]$ tree bin
bin
├── egg.js
├── eggc.js
└── evm.js
```

### egg

El programa `egg`  deberá ejecutar el programa `.egg` que se le pasa por línea de comandos y lo interpretará:

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
├── main.js
├── one-err.egg
├── one.egg
├── scope.egg
├── string.egg
├── sum.egg
└── two.egg
```

Cada vez que introduzca una nueva funcionalidad cree uno o varios ejemplos que sirvan para ilustrarla y comprobar el buen funcionamiento.

Un objetivo es reciclar esos ejemplos en las pruebas y en la documentación.

### Test Folder

Añada un fichero `test/test.js` y escriba las pruebas (Mocha o Jest)

  
Cada vez que logramos un nuevo objetivo añadimos en el directorio `examples` un programa `examples/objetivo.egg` cuya ejecución muestra el buen funcionamiento de nuestro código. 

A continuación añadimos una prueba en el directorio `test/` que ejecuta el correspondiente programa y verifica que la salida es la esperada.

- Puede usar el módulo [@ull-esit-pl/example2test](https://www.npmjs.com/package/@ull-esit-pl/example2test) para simplificar esta metodología
- Ejecutamos **todas** las pruebas `npm test` cada vez que resolvemos un nuevo objetivo

## Analizador Léxico Separado

Intente ahora separar la fase de análisis sintáctico de la fase de análisis léxico
escribiendo una función `lex` que cada vez que es llamada por las funciones  `parseExpression` y `parseApply` que retorna
el siguiente token.

Si logra resolver estos objetivos ¡Enhorabuena!.

Si no, puede encontrar una solución a estos tres problemas en este repo [ULL-ESIT-PL-1617/egg](https://github.com/ULL-ESIT-PL-1617/egg)

El repo ha sido publicado como módulo en npm [@crguezl/eloquentjsegg](https://www.npmjs.com/package/@crguezl/eloquentjsegg)





A continuación mejore el analizador léxico que encuentra en este repo 
para que:

1. Puede opcionalmente usar la opción `x` de  [XRegExp](http://xregexp.com/) para sangrar y comentar las expresiones regulares
2. Guarde en el objeto token el `offset` de comienzo, la línea de comienzo, etc
3. Mejore los mensajes de error usando esta información
4. El analizador léxico actual destruye la cadena conteniendo el programa conforme la analiza.  Es posible  escribir una analizador léxico que recorra la cadena conteniendo el programa sin destruirla usando la opción `sticky`. Estudie esta mejora
5. Mejore las pruebas, especialmente con programas que contienen errores


## Recursos

* [Eloquent JS: Chapter 11. Project: A Programming Language](http://eloquentjavascript.net/11_language.html)
* [El lenguaje egg: repo en GitHub](https://github.com/ULL-ESIT-PL-1617/egg)
* [Repo interpreter-egg](https://github.com/ULL-ESIT-PL-1617/interpreter-egg)
* [NodeJS Readline gist](https://gist.github.com/crguezl/430642e29a2b9293317320d0d1759387)
* En el repo [ULL-ESIT-PL-1617/interpreter-egg](https://github.com/ULL-ESIT-PL-1617/interpreter-egg) se muestra como hacer un bucle REPL
* [XRegExp](http://xregexp.com/)
* El módulo [@ull-esit-pl/example2test](https://www.npmjs.com/package/@ull-esit-pl/example2test)
* Tests. Mocking and Stubbing
    * [Sinon API](http://sinonjs.org/releases/v1.17.7/)
    * [Side effects of stubbing console in tests](https://gyandeeps.com/console-stubbing/)
    * [Unit Test like a Secret Agent with Sinon.js](http://elijahmanor.com/unit-test-like-a-secret-agent-with-sinon-js/) by Elijah Manor

