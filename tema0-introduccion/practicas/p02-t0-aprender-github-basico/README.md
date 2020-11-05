---
layout: default
title: p02-t0-aprender-github-basico
permalink: /tema0-introduccion/practicas/p02-t0-aprender-github-basico/index.html
previous: 
  url: 
next:
  url: 
---

# Aprender GitHub Básico (p02-t0-aprender-github-basico)


## Jekyll Data Files

- Seguiremos el tutorial [Jekyll Data Files](https://jekyllrb.com/docs/datafiles/) y lo intentaremos reproducir en la web de nuestra práctica p02-t0-aprender-markdown
- Añade un fichero `_data/cv.json`   y escribe en [formato JSON](https://en.wikipedia.org/wiki/JSON) conteniendo un objeto JSON que describa tu CV. Algo así:

```json
{
    "nombre": "Casiano",
    "apellidos": "Rodríguez",
    "titulo": "Matemáticas",
    "antiguedad": 42,
    "cursos_recibidos": [ "UAI2015", "Moodle Avanzado", "Evolutionary Computing"],
    "profesor": true,
    "asignaturas": [ 
        { "siglas": "AET", "curso": "20/21" },
        { "siglas": "PL", "curso": "20/21" }
    ],
    "parrafo_grande": "Clase del Martes 03/11/2020\n\nNo olvides:\n\n\n  Rellena la tarea de asistencia\n\n\nComenzaremos repasando la introducción a la asignatura que hizo el profesor ..."
}
```

y luego usando [Liquid](https://shopify.github.io/liquid/) rellenas el fichero `README.md` de manera que tu web site no tenga dependencias específicas de la persona 

## Issues Milestones

Antes de empezar con [la tarea anterior](#jekyll-data-files) cree una [Milestone](https://docs.github.com/en/free-pro-team@latest/github/managing-your-work-on-github/about-milestones) con 

* **Title**: *CV independiente de la persona*
* **Due date**: Para el próximo Domingo
* **Description**: Queremos que toda la parte dependiente del usuario quede aislada en un sólo fichero JSON que contiene los datos de la persona

A continuación cree tres incidencias *relacionadas con lograr la milestone CV independiente de la persona*:

1. Create file `_data/cv.json`
2. Show simple fields in the CV page (like *nombre*, *apellidos*)
3. Show complex fields in the web page (like *asignaturas*)

Cada vez que logre un objetivo y haga el commit **cierre la incidencia**.

Observe en la milestone la barra de progreso de su trabajo.

## Releases

Cuando hayas terminado esta parte cree una [release](https://docs.github.com/en/free-pro-team@latest/github/administering-a-repository/releasing-projects-on-github).

*Releases are deployable project iterations you can package and make available for a wider audience to download and use*.

Vea la sección [Managing releases in a repository](https://docs.github.com/en/free-pro-team@latest/github/administering-a-repository/managing-releases-in-a-repository) para ver como crear la release. 

Una **release** le proveerá con un enlace a ficheros en formatos `.zip` y `.tar.gz` que cualquier persona con los permisos adecuados podrá descargar para obtener esa versión del proyecto.
