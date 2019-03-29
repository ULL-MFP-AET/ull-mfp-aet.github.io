# Práctica: Egg. A Programming Language (p5-t1-egg-0)

### Requisitos

1. Use el repo de GitHub dado por la asignación de esta tarea partiendo del repo en [ULL-ESIT-PL-1617/egg](https://github.com/ULL-ESIT-PL-1617/egg)
2. Use [XRegExp](http://xregexp.com/) para sangrar y comentar las expresiones regulares
3. Guarde en el objeto token el `offset` de comienzo, la línea de comienzo, etc
4. Mejore los mensajes de error usando esta información
5. El analizador léxico actual destruye la cadena conteniendo el programa conforme la analiza.  Es posible  escribir una analizador léxico que recorra la cadena conteniendo el programa sin destruirla usando la opción `sticky`. Estudie esta mejora
6. Mejore las pruebas, especialmente con programas que contienen errores
8. Haga que el ejecutable `egg` funcione como un bucle REPL cuando no se le proporciona un fichero de entrada
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

  * En este [Vídeo *Programando un bucle REPL para el lenguaje Egg*](https://youtu.be/5gIlt6r29lw) explicamos como hacerlo
<!-- 6. Añada índices negativos (a la Ruby) para los arrays -->
<!-- 7. Añada mapas/hashes al lenguaje -->
9. Parta de este [repo](https://github.com/ULL-ESIT-PL-1617/egg)

### Recursos

* [Eloquent JS: Chapter 12. Project: A Programming Language](http://eloquentjavascript.net/11_language.html)
* [Eloquent JS 2nd Edition: Chapter 11. Project: A Programming Language](https://eloquentjavascript.net/2nd_edition/11_language.html)
* [El lenguaje egg: repo en GitHub](https://github.com/ULL-ESIT-PL-1617/egg)
* [Repo interpreter-egg](https://github.com/ULL-ESIT-PL-1617/interpreter-egg)
* [NodeJS Readline gist](https://gist.github.com/crguezl/430642e29a2b9293317320d0d1759387)
* En el repo [ULL-ESIT-PL-1617/interpreter-egg](https://github.com/ULL-ESIT-PL-1617/interpreter-egg) se muestra como hacer un bucle REPL
* [XRegExp](http://xregexp.com/)
