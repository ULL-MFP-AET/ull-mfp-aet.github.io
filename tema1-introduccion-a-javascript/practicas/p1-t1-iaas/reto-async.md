# Reto Async

Escriba un programa Node.js que usando `fs.readFile` lea  un conjunto de ficheros pasados en vía de comandos y produzca como salida la concatenación de los mismos en **el orden especificado**. Evite usar `fs.readFileSync`:

```
$ concat -f one.txt -f two.txt -f three.txt -o salida.txt
```

Con [commander](https://www.npmjs.com/package/commander?activeTab=readme) es posible indicar una opción que se puede repetir

```js
const program = require('commander');
function collect(value, previous) {
  return previous.concat([value]);
}
program.option('-c, --collect <value>', 'repeatable value', collect, []);
program.parse(process.argv);
console.log(program.collect)
```

```
$ node repeatable-option-commander.js -c a -c b -c c
[ 'a', 'b', 'c' ]
```

1. Lea la sección [The Async Module]({{site.baseurl}}/tema1-introduccion-a-javascript/event-loop/async-js) de los apuntes y encuentre una solución usando `Async`. Considere la posibilidad la posibilidad de excepciones debidas a que alguno de los ficheros no exista. En esa misma sección encontrará un ejemplo con [una solución](/introduccion/tema1-introduccion-a-javascript/event-loop/async-js#ejemplo-concatenación-de-ficheros)
3. Encuentre  una solución sin hacer uso de `Async`
4. Haciendo abstracción de la solución encontrada en el paso anterior escriba una función `asyncMap` que funcione como el `map` del módulo `Async`:

  ```js
  asyncMap(inputs, (item, cb) => fs.readFile(item, cb), (err, contents) => { ... });
  ```

## Observaciones 

Si hace las pruebas de funcionamiento con ficheros de similar tamaño la probabilidad de que su algoritmo produzca una salida que respeta el orden especificado es alta, incluso si su algoritmo es erróneo y ordena la salida de los ficheros según el criterio *El primero que termina es el primero que se concatena*.

Puede simular que los ficheros son de distinto tamaño retrasando las lecturas con un `setTimeout` que espere por un número aleatorio de milisegundos:

```
[~/.../eval/p2-t1-c3-filesystem-reto-eduardobritosan(master)]$ cat slowread.js
```

```js
const fs = require('fs')

const ir = (min, max) =>  Math.round((Math.random() * (max - min) + min))

console.time("reading")
setTimeout(
  () => fs.readFile("estas", 
                    {encoding: "utf8"}, 
                    (err, data) => { 
                      console.timeEnd("reading")
                      console.log(data);
                    } ),
  ir(500,2000)
)
```

Ejecución:

```
~/.../eval/p2-t1-c3-filesystem-reto-eduardobritosan(master)]$ cat estas
estas
~/.../eval/p2-t1-c3-filesystem-reto-eduardobritosan(master)]$ node slowread.js 
reading: 1251.443ms
estas
[~/.../eval/p2-t1-c3-filesystem-reto-eduardobritosan(master)]$ node slowread.js 
reading: 1343.851ms
estas
[~/.../eval/p2-t1-c3-filesystem-reto-eduardobritosan(master)]$ node slowread.js 
reading: 779.224ms
estas
```

## Soluciones

* [Al apartado 3](https://github.com/ULL-ESIT-PL-1920/reto-readfiles-and-concat/blob/master/concat-file-2.js)