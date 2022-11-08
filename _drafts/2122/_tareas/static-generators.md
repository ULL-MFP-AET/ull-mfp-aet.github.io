---
title: Generating a Web Site with a Static Generator
permalink: /practicas/asignatura-website/
date: 0000/03/03
key: asignatura-website
layout: default
classroom: https://classroom.github.com/a/UZ3hh6e8
name: Managing your profile README

toc: false
foro: https://github.com/orgs/ULL-MFP-AET-2223/discussions

rubrica:
  - "Se ha desplegado el sitio Web en GitHub pages usando Jekyll"
  - Se resumen correctamente los conceptos del capítulo
  - "Despliegue en netlify"
  - Se ha creado una Jekyll Collection 
  - Se ha hecho uso de liquid (mostrar ejemplo en el informe)
  - Se ha hecho uso de un .csv o .json en `_data` (mostrar ejemplo en el informe)
  - Ha reconfigurado los defaults del _config.yml
  - "Página personal en GitHub Pages"
  - "Página personal en GitHub Pages enlazada desde el perfil GitHub del alumno"
  - "Ha entregado el .zip en el campus con el repo"
---

# Generating a Web Site with a Static Generator

En esta tarea vamos a construir un web site para una asignatura. 
Para ello usaremos los servicios de alojamiento de websites que provee GitHub mediante [GitHub Pages](https://pages.github.com/) y el generador de web sites estáticos Jekyll.

Para el desarrollo usaremos [GitPod](https://www.gitpod.io/docs/getting-started).

Al aceptar se le creará un repo con los archivos y carpetas necesarios para la generación de un web site usando Jekyll. Despliegue el repo en GitPod usando el botón GitPod. El contenedor/Docker/Máquina Virtual creado instalará Jekyll (lleva su tiempo, tenga paciencia) y arrancará Jekyll en modo servidor.

![]({{site.baseurl}}/assets/images/jekyll-serve.png)

Haga click en *http://127.0.0.1:4000 Follow link using forwarded port*

![]({{site.baseurl}}/assets/images/minimal-mistakes.png)

A continuación lea los tutorials de [Jekyll](https://jekyllrb.com/docs/) y [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/)


## References

### GitHub Pages

* [GitHub Pages](https://pages.github.com/)
{% include jekyll-references.md %}

### GitPod

{% include gitpod-references.md %}

## Rúbrica

{% include rubrica.md %}

## Actividad de los Alumnos para {{ page.key }}

<a href="{{ site.baseurl }}/assets/tareas/{{ page.key }}/activity.html" target="_blank">Medidas de Actividad de los Alumnos para {{ page.key }}</a>
