---
layout: default
title: p7-t3-egg-2
permalink: /tema3-analisis-descendente-predictivo-recursivo/practicas/p7-t3-egg-2/
previous: 
  url: /tema3-analisis-descendente-predictivo-recursivo/practicas/p6-t3-egg-1/
next:
  url: /tema3-analisis-descendente-predictivo-recursivo/practicas/p8-t3-pdr-infix2egg/
---

# Práctica: Extending Egg.  p7-t3-egg-2

## Metodologia

{% include metodologia-egg.md %}  

## Índices Negativos

Añada índices negativos (a la Ruby) para los arrays 

```
[.../p7-t3-egg-2-04-16-2020-03-13-25/davafons(casiano)]$ cat examples/array-neg.egg
```
```ruby
do{
  def(x, array[1, array[2,3]]),
  print(element(x, -1)),        # [ 2, 3 ]
}
```
```
[.../p7-t3-egg-2-04-16-2020-03-13-25/davafons(casiano)]$ bin/egg.js examples/array-neg.egg
[ 2, 3 ]
```

## Extendiendo `element`: Posibilidad de Indexar con mas de un Índice

* Añada la posibilidad de indexar con mas de un índice a `element`

 ```
 [.../p7-t3-egg-2-04-16-2020-03-13-25/davafons(casiano)]$ cat examples/array-index.egg
```
```ruby
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
[.../p7-t3-egg-2-04-16-2020-03-13-25/davafons(casiano)]$ bin/egg.js examples/array-index.egg
1
[ 2, 3 ]
3
3
2
```

## Set: Modificar Elementos de un Array

Extienda `set` para que se puedan modificar elementos de los arrays

```
[.../p7-t3-egg-2-04-16-2020-03-13-25/davafons(casiano)]$ cat examples/array-set-index.egg
```
```ruby
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
[.../p7-t3-egg-2-04-16-2020-03-13-25/davafons(casiano)]$ bin/egg.js examples/array-set-index.egg
[ 1, 2, 9, [ 9, 8, 7 ] ]
[ 1, 2, 9, [ 9, 1000, 7 ] ]
```

No se debería poder hacer un `set` con índices de una variable no estructurada

```
[.../p7-t3-egg-2-04-16-2020-03-13-25/davafons(casiano)]$ cat examples/set-error.egg
```
```ruby
do(
  def(x,4),
  set(x, 1, 2),
  print(x)
)
[.../p7-t3-egg-2-04-16-2020-03-13-25/davafons(casiano)]$ bin/egg.js examples/set-error.egg
TypeError: The object '4' is not indexable!  
```

## Mapas, Hashes o Diccionarios

* Añada mapas/hashes al lenguaje Egg

```
[.../p7-t3-egg-2-04-16-2020-03-13-25/davafons(casiano)]$ cat examples/map.egg
```
```ruby
do {
  def(x, map["x", 4, "y", map["z", 3]]),

  print(element(x, "x")),                 # 4

  print(element(x, "y", "z")),            # 3

  set(x, "y", "z", 50),

  print(element(x, "y", "z"))             # 50
}
```

Ejecución:

```
[.../p7-t3-egg-2-04-16-2020-03-13-25/davafons(casiano)]$ bin/egg.js examples/map.egg
4
3
50
```
  
## Dos puntos como operador léxico

Nos gustaría poder escribir los hashes/mapas usando `:` para separar el nombre de la clave del valor, como en este ejemplo:

```
[.../p7-t3-egg-2-04-16-2020-03-13-25/davafons(casiano)]$ cat examples/map-colon.egg
```
```ruby
do {
  def(x, map[x: 4, y: map[z: 3]]),
  print(x["y"]["z"]),                     # 3
  print(element(x, "x")),                 # 4
  print(element(x, "y", "z")),            # 3
  set(x, "y", "z", 50),
  print(element(x, "y", "z"))             # 50
}
```
```
[.../p7-t3-egg-2-04-16-2020-03-13-25/davafons(casiano)]$ bin/egg.js examples/map-colon.egg
3
4
3
50
```

Una forma de hacer esto es empezar haciendo que el análisis léxico acepte el carácter `:` para el token `COMMA`

```js
  const COMMA = new XRegExp(`
    (
      ,|:(?!=) # : is an alias for comma ',' when not followed by '='
    )
  `, 'xy');
```

y *trucando* nuestro analizador léxico para que siempre que una `WORD` vaya seguida de `:` se retorne una `STRING`

```js
  nextToken = function() {
    if (count < result.length) {
      lookahead = result[count++];
      if (lookahead && (lookahead.type === 'WORD') && (result[count] && result[count].value === ":")) {
        lookahead.type = "STRING";
      }
      return lookahead;
    }
    else return null;
  }
```

## El Método `sub` deberá funcionar con los diccionarios/mapas

Haga que los mapas tengan un método `sub`  que permita indexar los mapas:

 ```
[.../p7-t3-egg-2-04-16-2020-03-13-25/davafons(casiano)]$ cat examples/map-sub.egg
```
```ruby 
do(
  def(x, map{a: 1, b: 4, c: map{d: 5, e: 3}}),
  print(x["sub"]["a"]),      # 1
  print(x["sub"]["c"]["d"]), # 5
  print(x["sub"]["c"]["e"]), # 3
  print(x["sub"]["b"])       # 4
)
  ```

  Ejecución:

```
[.../p7-t3-egg-2-04-16-2020-03-13-25/davafons(casiano)]$ bin/egg.js examples/map-sub.egg
1
5
3
4
```

## OOP en Egg

Añada objetos al lenguaje Egg de manera que podamos escribir programas como este:

```
.../p7-t3-egg-2-04-16-2020-03-13-25/davafons(casiano)]$ cat examples/objects.egg
```
```ruby
do (
  def(x, object (
    "c", 0,
    "gc", ->{element[this, "c"]},
    "sc", ->{value, =(this, "c", value)},
    "inc", ->{=(this, "c", +(element[this, "c"],1))}
  )),
  print(x("gc")()), # 0
  x("sc")(4),
  print(x("gc")()), # 4
  x("inc")(),   
  print(x("gc")()),  # 5
)
```

  Ejecución:

```
[.../p7-t3-egg-2-04-16-2020-03-13-25/davafons(casiano)]$ bin/egg.js examples/objects.egg
0
4
5  
```

## DOT

**Syntactic Sugar**: Introduzca el operador punto (dot) para poder acceder a los métodos y atributos de un  objeto.

La idea es que una expresión como:

  ```js
  a.b.c(arg1)
  ```
  
es equivalente a esta otra expresión:

```js
  a("b")("c")(arg1)
```

Esto es,el dot es como una llamada/apply del objeto en el que el primer argumento es el atributo/método

```
[.../p7-t3-egg-2-04-16-2020-03-13-25/davafons(casiano)]$ cat examples/dot.egg
```
```ruby
do(
  def(x, array[1,4,5]),
  def(s, x.join("-")),                 # The same as x("join")("-")
  print(s),                            # 1-4-5
  print(array[1,4,5].join("-").length) # 5
)
```

```
[.../p7-t3-egg-2-04-16-2020-03-13-25/davafons(casiano)]$ bin/egg.js examples/dot.egg
1-4-5
5
```

Otro ejemplo, esta vez con objetos Egg.

```
[~/.../crguezl-egg(private2019)]$ cat examples/dot-obj-2.egg
```
```
 .../p7-t3-egg-2-04-16-2020-03-13-25/davafons(casiano)]$ cat examples/dot-obj-2.egg
```
```ruby
do (
  def(x, object (
    c:   3,
    gc:  ->{this.c},
    sc:  ->{value, =(this, "c", value)},
    inc: ->{=(this, "c", +(this.c, 1))}
  )),

  print(x["c"]), # 3
  print(x.c),    # 3
  print(x.gc()), # 3
  print(x.sc(5)),# 5
  print(x.gc())  # 5
)
```
```
[.../p7-t3-egg-2-04-16-2020-03-13-25/davafons(casiano)]$ bin/egg.js examples/dot-obj-2.egg
3
3
3
5
5
```


Otro ejemplo con números:

```
  [.../p7-t3-egg-2-04-16-2020-03-13-25/davafons(casiano)]$ cat examples/dot-num.egg
```
```ruby
do{
  print(4.toFixed(2)),
  def(x, 4),
  print(x("toFixed")(2)),
  def(z, x.toFixed(2)),
  print(z),
}
```
```
[.../p7-t3-egg-2-04-16-2020-03-13-25/davafons(casiano)]$ bin/egg.js examples/dot-num.egg
4.00
4.00
4.00
```

## Require

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

## RegExps

* Añada expresiones regulares al lenguaje Egg. 
* Las delimitaremos mediante `r/regexpExpression/` comenzando por `r/`y terminando con una `/`. 
* Se admiten cualesquiera caracteres entre los delimitadores, incluyendo retornos de carro.
* Use XRegExp para darle mayor potencia a las expresiones regulares. 
* Recuerde que XRegExp admite 0 o mas repeticiones de estas opciones en las expresiones regulares: `[nsxAgimuy]*` 
* Las expresiones regulares son un nuevo tipo de token y conllevan una ligera modificación de la sintáxis. 
* Así mismo los AST ahora tendrán un nuevo tipo `regex`

```
[.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(master)]$ cat examples/regex-simple.egg
```
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

```
[.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(master)]$ bin/egg.js examples/regex-simple.egg 
true
[ 'a 42', 'a', '42', index: 4, input: ';;; a 42', groups: undefined ]
```

Otro ejemplo:

```
[.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(master)]$ cat examples/regex-2.egg 
```
```js
do {
  :=(d, r/
         (?<year>  \d{4} ) -?  # year
         (?<month> \d{2} ) -?  # month
         (?<day>   \d{2} )     # day
        /x),
  print(d("test")("1987-07-14")),  # true
  :=(m, d("exec")("1987-07-14")),
  print(m), #  [ '1987-07-14', '1987', '07', '14', index: 0, input: '1987-07-14' ] 
  print(m("index")), # 0

  :=(x, RegExp("exec")("2015-02-22", d)),
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
  print(x("year")), # 2015
  print(x("month")) # 02
}
```

```
[.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(master)]$ bin/egg.js examples/regex-2.egg 
true
[
  '1987-07-14',
  '1987',
  '07',
  '14',
  index: 0,
  input: '1987-07-14',
  groups: undefined
]
0
[
  '2015-02-22',
  '2015',
  '02',
  '22',
  index: 0,
  input: '2015-02-22',
  groups: undefined,
  year: '2015',
  month: '02',
  day: '22'
]
2015
02
```


## Bucles for

Extienda el lenguaje con uno o varios tipos de  bucle `for`

### Bucle for convencional

```
[.../TFA-04-16-2020-03-22-00/davafons(casiano)]$ cat examples/for.egg
```
```ruby
do(
  for(define(x, 0), <(x, 5), ++(x),
    print(x)
  )
)
```

```
[.../TFA-04-16-2020-03-22-00/davafons(casiano)]$ bin/egg.js examples/for.egg
0
1
2
3
4
```

### Bucle foreach

```
[.../TFA-04-16-2020-03-22-00/davafons(casiano)]$ cat examples/foreach.egg
```

```ruby
do {
  def(x, arr(1, 2, 3)),
  foreach(x, x, print(x)), # Different x from inner and outer scope

  def(y, map(a: 1, b: 2, c: 3)),
  foreach(key, y.keys(), print(key.toUpperCase()))
}
```

```
[.../TFA-04-16-2020-03-22-00/davafons(casiano)]$ bin/egg.js examples/foreach.egg
1
2
3
A
B
C
```

## Recursos

* [Eloquent JS: Chapter 11. Project: A Programming Language](http://eloquentjavascript.net/11_language.html)
* [El lenguaje egg: repo en GitHub](https://github.com/ULL-ESIT-PL-1617/egg)
* [Repo interpreter-egg](https://github.com/ULL-ESIT-PL-1617/interpreter-egg)
* [NodeJS Readline gist](https://gist.github.com/crguezl/430642e29a2b9293317320d0d1759387)
* En el repo [ULL-ESIT-PL-1617/interpreter-egg](https://github.com/ULL-ESIT-PL-1617/interpreter-egg) se muestra como hacer un bucle REPL
* [XRegExp](http://xregexp.com/)
* El módulo [@ull-esit-pl/example2test](https://www.npmjs.com/package/@ull-esit-pl/example2test)


