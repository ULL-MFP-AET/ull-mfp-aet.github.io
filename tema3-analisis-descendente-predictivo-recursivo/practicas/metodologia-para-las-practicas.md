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

