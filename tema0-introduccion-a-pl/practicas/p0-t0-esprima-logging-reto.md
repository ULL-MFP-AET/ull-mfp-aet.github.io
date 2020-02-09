---
layout: default
title: p0-t0-esprima-logging-reto
formulario: https://campusvirtual.ull.es/1920/mod/assign/view.php?id=187733
permalink: /tema0-introduccion-a-pl/practicas/p0-t0-esprima-logging-reto/
next:
  url: /tema1-introduccion-a-javascript/practicas/p1-t1-iaas/
previous: 
  url: /tema0-introduccion-a-pl/practicas/p0-t0-esprima-logging/
---

# Práctica {{ page.title }}

Añada el número de línea a la información de log de la función en la que se entra:

```
[~/javascript-learning/esprima-pegjs-jsconfeu-talk(develop)]$ ./p0-t0-esprima-logging-sol.js input.js -o salida.js
input:
```
```js
function foo(a, b) {
  var x = 'blah';
  var y = (function (z) {
    return z+3;
  })(2);
}
foo(1, 'wut', 3);
```
```
---
Output in file 'salida.js'
[esprima-pegjs-jsconfeu-talk(develop)]$ cat salida.js
```
```js
function foo(a, b) {
    console.log(`Entering foo(${ a },${ b }) at line 1`);
    var x = 'blah';
    var y = function (z) {
        console.log(`Entering <anonymous function>(${ z }) at line 3`);
        return z + 3;
    }(2);
}
```
```
foo(1, 'wut', 3);[esprima-pegjs-jsconfeu-talk(develop)]$ node salida.js 
Entering foo(1,wut) at line 1
Entering <anonymous function>(2) at line 3
```