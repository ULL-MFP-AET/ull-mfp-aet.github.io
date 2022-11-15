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
  - "Ha entregado el .zip en el campus"
video: "8KwoKgYz85k"
---

- [{{ page.title}}](#-pagetitle)
  - [Objetivos](#objetivos)
  - [Puesta a punto en CodeSpaces](#puesta-a-punto-en-codespaces)
    - [Puesta a punto con GitPod](#puesta-a-punto-con-gitpod)
  - [Modificando el Web Site](#modificando-el-web-site)
  - [Añadir una sección de Comentarios](#añadir-una-sección-de-comentarios)
  - [Desplegando en su organización ull-mfp-aet-2223-aluXXXX.github.io](#desplegando-en-su-organización-ull-mfp-aet-2223-aluxxxxgithubio)
  - [Desplegando el Web Site de la Asignatura en Moodle](#desplegando-el-web-site-de-la-asignatura-en-moodle)
  - [Entrega](#entrega)
  - [References](#references)
  - [Rúbrica](#rúbrica)
  - [Actividad de los Alumnos para {{ page.key }}](#actividad-de-los-alumnos-para--pagekey-)


# {{ page.title}}

## Objetivos

En esta tarea vamos a aprender a construir web sites usando un [generador estático de contenidos]({{ site.baseurl }}/glossary.html#static-site-generators). 

Para ello usaremos 

1. los servicios de alojamiento de websites que provee GitHub mediante [GitHub Pages](https://pages.github.com/)
2. el generador de web sites estáticos Jekyll.

Al aceptar esta asignación se creará un repo con los archivos y carpetas necesarios para la generación de un web site usando Jekyll. 

En este  web site deberás crear un web site en un repo con nombre `<organization>/<organization>.github.io` para la organización que creaste en la tarea anterior  con una estructura similar al  web site de este curso conteniendo temas, tareas, comentarios, enlaces, etc. 

## Puesta a punto en CodeSpaces

Véase las [notas sobre CodeSpaces]({{ site.baseurl}}/assets/tareas/asignatura-website/codespaces)

### Puesta a punto con GitPod 

Véase las [notas sobre GitPod]({{ site.baseurl}}/assets/tareas/asignatura-website/gitpod)

## Modificando el Web Site

A continuación lea los tutorials de [Jekyll](https://jekyllrb.com/docs/)

## Añadir una sección de Comentarios

Instale  utterances en su repo [https://github.com/apps/utterances](https://github.com/apps/utterances) y configurela para añadir comentarios a su repo.

## Desplegando en su organización ull-mfp-aet-2223-aluXXXX.github.io

Hemos estado generando el web site en el repo de la asignación de esta tarea. 
El objetivo es que este web site sea el de su organización, por lo tanto es conveniente que lo despliegue en su organización.

1. Haga un fork del repo de su práctica a su organización. 
2. El nombre del repo de destino deberá ser el de la organización de su asignatura seguido del sufijo `.github.io`: `ull-mfp-aet-2223-aluXXXX.github.io`
3. Configure el repo de destino para activar las GitHub Pages
4. Cambie el `baseurl` a vacío

## Desplegando el Web Site de la Asignatura en Moodle

Siga las instrucciones en el artículo [Importing a Website into Moodle]({{site.baseurl}}/pages/moodle.html)


## Entrega

Deja en el fichero `README.md` de este repositorio los enlaces a la web de tu asignatura. 

Si tienes acceso a un curso Moodle despliega tanto tu página web como tu web site de la asignatura en el curso Moodle.


## References

[Referencias]({{ site.baseurl }}/assets/tareas/asignatura-website/referencias-website) para esta práctica

## Rúbrica

{% include rubrica.md %}

## Actividad de los Alumnos para {{ page.key }}

<a href="{{ site.baseurl }}/assets/tareas/{{ page.key }}/activity.html" target="_blank">Medidas de Actividad de los Alumnos para {{ page.key }}</a>
