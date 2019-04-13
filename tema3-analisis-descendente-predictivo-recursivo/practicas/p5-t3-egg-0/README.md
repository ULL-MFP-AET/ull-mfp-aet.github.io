# Práctica: Egg. A Programming Language (p5-t1-egg-0)

### Requisitos

1. Use el repo de GitHub dado por la asignación de esta tarea partiendo del repo en [ULL-ESIT-PL-1617/egg](https://github.com/ULL-ESIT-PL-1617/egg)
2. Use [XRegExp](http://xregexp.com/) para sangrar y comentar las expresiones regulares
3. Guarde en el objeto token el `offset` de comienzo, la línea de comienzo, etc
4. Mejore los mensajes de error usando esta información
5. El analizador léxico actual destruye la cadena conteniendo el programa conforme la analiza.  Es posible  escribir una analizador léxico que recorra la cadena conteniendo el programa sin destruirla usando la opción `sticky`. Estudie esta mejora
6. Mejore las pruebas, especialmente con programas que contienen errores
8. Haga que el ejecutable `egg` funcione como un bucle REPL cuando no se le proporciona un fichero de entrada
  * En este [Vídeo *Programando un bucle REPL para el lenguaje Egg*](https://youtu.be/5gIlt6r29lw) explicamos como hacerlo

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


<!-- 6. Añada índices negativos (a la Ruby) para los arrays -->
<!-- 7. Añada mapas/hashes al lenguaje -->

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
