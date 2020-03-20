---
layout: default
title: p2-t1-testing
permalink: /tema2-expresiones-regulares-y-analisis-lexico/practicas/p3-t2-regexp/reto
previous:
  url: /tema1-introduccion-a-javascript/practicas/p2-t1-testing/
next:
  url: /tema2-expresiones-regulares-y-analisis-lexico/practicas/p9-t2-lexer/
repo: https://github.com/ULL-ESIT-PL-1819/regexp-exercises/blob/master/
---


# Práctica: Manejo de Expresiones Regulares (p3-t2-regexp)

## Introducción

* [Repo de partida para los ejercicios: ULL-ESIT-PL-1819/regexp-exercises](https://github.com/ULL-ESIT-PL-1819/regexp-exercises)

Esta práctica se divide en varios apartados que se corresponden con distintos programas JavaScript:
 
```
eloquentregexp.js
boundaries.js
diophantine3xplus2yequal14.js
imperial2metric.md
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

* [boundaries.js]({{page.repo}}/boundaries.js)
* Resuelva [diophantine3xplus2yequal14.js]({{page.repo}}/diophantine3xplus2yequal14.js)
  * [Diophantic Equations en los apuntes]({{site.baseurl}}/tema2-expresiones-regulares-y-analisis-lexico/#diophantic-equations)
* Resuelva los ejercicios en [singlequotestodoublequotes.js]({{page.repo}}/singlequotestodoublequotes.js)
* Resuelva los ejercicios en [replaceexercises.js]({{page.repo}}/replaceexercises.js)
* [imperial2metric.md]({{page.repo}}/imperial2metric.md)
  * [Véase la sección replace en los apuntes]({{site.baseurl}}/tema2-expresiones-regulares-y-analisis-lexico/#replace)
* Resuelva los ejercicios en [regexpexercises.js]({{page.repo}}/regexpexercises.js)

Aunque en cada uno de los problemas se ha proveído  algunos ejemplos de cadenas con las que deberia casar o no casar, en general es conveniente que aumente el número de casos de prueba.

## Recursos

* [Repo de partida para los ejercicios: ULL-ESIT-PL-1819/regexp-exercises](https://github.com/ULL-ESIT-PL-1819/regexp-exercises)
* [Apuntes: Expresiones Regulares]({{site.baseurl}}/tema2-expresiones-regulares-y-analisis-lexico/)
* [Eloquent JavaScript: Capítulo Expresiones Regulares](http://eloquentjavascript.net/09_regexp.html)

