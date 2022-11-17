---
title: Generating a Web Site with a Static Generator
permalink: /practicas/asignatura-website/
date: 0000/03/03
key: asignatura-website
layout: default
classroom: https://classroom.github.com/a/UZ3hh6e8
name: Managing your profile README
website: true
toc: false
foro: https://github.com/orgs/ULL-MFP-AET-2223/discussions

rubrica:
  - "Se ha desplegado el sitio Web de la práctica"
  - "Se ha desplegado el sitio Web de la asignatura"
  - "Se ha aprendido a suar Codespaces"
  - "Se ha aprendido a hacer un workflow con pull requests"
  - Se ha aprendido a usar Liquid 
  - Se ha aprendido a parametrizar usando ficheros .csv, .yml  o .json desde la carpeta `_data` 
  - "Ha entregado el .zip en el campus"
video: "8KwoKgYz85k"
---

- [{{ page.title}}](#-pagetitle)
  - [Objetivos](#objetivos)
  - [Puesta a punto en CodeSpaces](#puesta-a-punto-en-codespaces)
  - [Puesta a punto con GitPod](#puesta-a-punto-con-gitpod)
  - [Modificando el Web Site](#modificando-el-web-site)
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

## Puesta a punto con GitPod 

Véase las [notas sobre GitPod]({{ site.baseurl}}/assets/tareas/asignatura-website/gitpod)

## Modificando el Web Site

Para mas detalle leemos los tutorials de [Jekyll](https://jekyllrb.com/docs/)

1. Arrancamos el server de jekyll (escriba `rake serve` en la terminal)
2. Limpiar las carpetas `leccion` y `_tareas` 
3. Aprender algo de Liquid usando una lección y una tarea
   1. Ver el fichero _includes/clases-impartidas.md y explicar
   2.  También ver el ejemplo de  la rúbrica en una práctica
4. Install paquete Jekyll support para codespaces: Liquid Template Language. Supports Formatting, Syntax Highlighting, Snippets, and more.
5. To enable Settings Sync, in the bottom-left corner of Visual Studio Code's Activity Bar, select  and click on the wheel. Turn on Settings Sync…. In the dialog box, select all the settings

## Desplegando en su organización ull-mfp-aet-2223-aluXXXX.github.io

Hemos estado generando el web site en el repo de la asignación de esta tarea. 
El objetivo es que este web site sea el de su organización, por lo tanto es conveniente que lo despliegue en su organización.

* Haga un fork del repo de la práctica a su organización: el repo de destino será en la organización de su asignatura:  `ULL-MFP-AET-2223-aluXXX/ull-mfp-aet-2223-aluXXX.github.io`
   *  Previamente el profesor debe configurar la organización para permitir los forks (settings -> member priveleges -> repository forking -> check Allow forking of private repositories)
* El nombre del repo de destino deberá ser el de la organización de su asignatura seguido del sufijo `.github.io`: `ull-mfp-aet-2223-aluXXXX.github.io`
* Configure el repo `ULL-MFP-AET-2223-aluXXX/ull-mfp-aet-2223-aluXXX.github.io` para usar github pages
* Modifique el `baseurl` en el archivo `_config.yml` a vacío `baseurl: ""` 
* Compruebe en las GitHub Actions del repo `ULL-MFP-AET-2223-aluXXX/ull-mfp-aet-2223-aluXXX.github.io` que el despliegue se ha realizado correctamente y observe el despliegue en el web site `https://ull-mfp-aet-2223-aluXXX.github.io` 
* Haga ahora mas cambios en el repo de la práctica `ULL-MFP-AET-2223/asignatura-website-aluXXX` y compruebe que se despliegan correctamente en su web site `https://ull-mfp-aet-2223-aluXXX.github.io/asignatura-website-aluXXX` 
* Haga un [pull request]({{ site.baseurl }}/glossary.html#pull-request) a la rama `main` del repo `ULL-MFP-AET-2223-aluXXX/ull-mfp-aet-2223-aluXXX.github.io` desde el repo de la práctica `ULL-MFP-AET-2223/asignatura-website-aluXXX`
* Ahora analice el pull request y acepte los cambios propuestos
* Observe los cambios en el despliegue de la web de su asignatura en `ull-mfp-aet-2223-aluXXX.github.io`

<!--
## Añadir una sección de Comentarios

Instale  utterances en su repo [https://github.com/apps/utterances](https://github.com/apps/utterances) y configurela para añadir comentarios a su repo.
-->


## Desplegando el Web Site de la Asignatura en Moodle

Siga las instrucciones en el artículo [Importing a Website into Moodle]({{site.baseurl}}/pages/moodle.html)

## Entrega

Deja en el fichero `README.md` de este repositorio 

* Los enlaces a la org, classroom y web de tu asignatura. 
* Evidencias de los requisitos solicitados en la rúbrica (*"Aprender ..."*)
* Opcional: Si tienes acceso a un curso Moodle despliega  tu web site de la asignatura en el curso Moodle y añádelo al informe

## References

[Referencias]({{ site.baseurl }}/assets/tareas/asignatura-website/referencias-website) para esta práctica

## Rúbrica

{% include rubrica.md %}

## Actividad de los Alumnos para {{ page.key }}

<a href="{{ site.baseurl }}/assets/tareas/{{ page.key }}/activity.html" target="_blank">Medidas de Actividad de los Alumnos para {{ page.key }}</a>
