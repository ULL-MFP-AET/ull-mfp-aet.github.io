# Práctica: Manejo de Expresiones Regulares

## Introducción

Esta práctica se divide en varios retos que se corresponden con distintos programas JavaScript:
 
```
eloquentregexp.js
boundaries.js
diophantine3xplus2yequal14.js
replaceexercises.js
regexpexercises.js
singlequotestodoublequotes.js
```

Siga las instrucciones en los comentarios del programa, 
rellene las partes que faltan.

## Reto eloquentregexp.js

> For each of the following items, write a regular expression to test
> whether any of the given substrings occur in a string. The regular
> expression should match only strings containing one of the substrings
> described. Do not worry about word boundaries unless explicitly
> mentioned. When your expression works, see whether you can make it
> any smaller.

En cada problema 

```js
// car and cat
verify(/.../,
       ["my car", "bad cats"],
       ["camper", "high art"]);
```

el comentario les indica el objetivo y los `...`indican donde debe escribir la regexp.
El segundo argumento de `verify` es un array de cadenas con las que se supone debería casar, el tercero un array de cadenas con las que no debe  casar.

Si la rellenas con una solución errónea como:

```js
// car and cat
verify(/ca[xf]/,
       ["my car", "bad cats"],
       ["camper", "high art"]);
```

y ejecutas `node eloquentregexp.js` obtendrás una ayuda como esta:

```js
~/.../p3-t2-regexp/regexp-exercises(master)]$ node eloquentregexp.js 
Failure to match 'my car'
Failure to match 'bad cats'
2 errors
Quedan 6 regexps sin escribir
```

## Resto de Ejercicios

El resto de ejercicios sigue un esquema similar al anterior. 
Para cada uno, lea las instrucciones
en los comentarios:

* [boundaries.js](boundaries.js)
* Resuelva [diophantine3xplus2yequal14.js](diophantine3xplus2yequal14.js)
* Resuelva los ejercicios en [singlequotestodoublequotes.js](singlequotestodoublequotes.js)
* Resuelva los ejercicios en [replaceexercises.js](replaceexercises.js)
* Resuelva los ejercicios en [regexpexercises.js](regexpexercises.js)

Aunque en cada uno de los problemas se ha proveído  algunos ejemplos de cadenas con las que deberia casar o no casar, en general es conveniente que aumente el número de casos de prueba.

## Recursos

* [Apuntes: Expresiones Regulares](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/regexp/)
* [Eloquent JavaScript: Capítulo Expresiones Regulares](http://eloquentjavascript.net/09_regexp.html)
