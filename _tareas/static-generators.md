---
title: Generating a Web Site with a Static Generator
permalink: /practicas/asignatura-website/
date: 0000/03/07
key: asignatura-website
layout: default
classroom: https://classroom.github.com/a/UZ3hh6e8
name: Managing your profile README
website: true
toc: false
foro: https://github.com/orgs/ULL-MFP-AET-2324/discussions
hide: false # true
rubrica:
  - "Se ha desplegado el sitio Web de la asignatura"
  - "Se ha desplegado un sitio Web de usuario en GitHub Pages"
  - "Se ha aprendido a usar Codespaces"
  - "Se ha aprendido a hacer un workflow con pull requests"
  - "Se ha aprendido a usar Liquid"
  - "Opcional (Trabajo autónomo): Se ha aprendido a parametrizar usando ficheros .csv, .yml  o .json desde la carpeta `_data`" 
  #- "Ha entregado el .zip en el campus"
video: "8KwoKgYz85k"
---

- [{{ page.title}}](#-pagetitle)
  - [Objetivos](#objetivos)
  - [Puesta a punto del entorno de trabajo](#puesta-a-punto-del-entorno-de-trabajo)
  - [Adaptar los contenidos del Web Site a nuestra Asignatura](#adaptar-los-contenidos-del-web-site-a-nuestra-asignatura)
  - [Aprender Jekyll](#aprender-jekyll)
    - [Jekyll docs](#jekyll-docs)
    - [Ejemplos](#ejemplos)
    - [Liquid extension for VSCode](#liquid-extension-for-vscode)
  - [Desplegando en su organización ull-mfp-aet-2324-aluXXXX.github.io](#desplegando-en-su-organización-ull-mfp-aet-2324-aluxxxxgithubio)
  - [Llevando sucesivos cambios del repo de la práctica a su repo de organización](#llevando-sucesivos-cambios-del-repo-de-la-práctica-a-su-repo-de-organización)
  - [Página web del usuario en GitHub](#página-web-del-usuario-en-github)
  - [Desplegando el Web Site de la Asignatura en Moodle](#desplegando-el-web-site-de-la-asignatura-en-moodle)
  - [Entrega](#entrega)
  - [References](#references)
  - [Rúbrica](#rúbrica)
  - [Actividad de los Alumnos para {{ page.key }}](#actividad-de-los-alumnos-para--pagekey-)


# {{ page.title}}

## Objetivos

En esta tarea vamos a aprender a construir web sites usando un [generador estático de contenidos]({{ site.baseurl }}/glossary.html#static-site-generators). 

Para ello aprenderemos a usar 

1. los servicios de alojamiento de websites que provee GitHub mediante [GitHub Pages](https://pages.github.com/)
2. como funciona el generador de web sites estáticos Jekyll.

Al aceptar esta asignación se creará un repo con los archivos y carpetas necesarios para la generación de un web site usando Jekyll. 

En este  web site deberás crear un web site en un repo con nombre `<organization>/<organization>.github.io` para la organización que creaste en la tarea anterior  con una estructura similar al  web site de este curso conteniendo temas, tareas, comentarios, enlaces, etc. así como una página de usuario en GitHub Pages.




## Puesta a punto del entorno de trabajo

1. Abrimos un codespaces en el repo de la asignación
   1. Si es necesario repase las [notas sobre CodeSpaces]({{ site.baseurl}}/assets/tareas/asignatura-website/codespaces).
   2. Alternativamente, véanse las [notas sobre GitPod]({{ site.baseurl}}/assets/tareas/asignatura-website/gitpod)
2. A continuación arrancamos el server de jekyll. Para ello escriba  en la terminal:
   1. `cd docs` pulse retorno de carro. Esto le sitúa en la carpeta `docs` que es donde se encuentran los ficheros  del web site de la asignatura
   2. `bundle install` pulse retorno de carro. Este comando instala las dependencias necesarias para que el generador estático de contenidos Jekyll pueda funcionar
   3. `rake serve` pulse retorno de carro. Este comando arranca el servidor web de Jekyll
   4. alternativamente puede escribir `bundle exec jekyll serve` en la terminal
   5. Haga click en `Open in Browser`: se  abrirá una nueva pestaña en la que visitamos la página web servida.
     
     ![/assets/images/codespaces/codespaces-jekyll-serve.png]({{ site.baseurl}}/assets/images/codespaces/codespaces-jekyll-serve.png)

## Adaptar los contenidos del Web Site a nuestra Asignatura

1. Cambiar el nombre de la asignatura y los datos en el fichero `_config.yml`
   - Cada vez que se modifique el fichero `_config.yml` hay que parar el servidor de desarrollo y volverlo a arrancar. Pulse `Ctrl-C` en la terminal para parar el servidor y posicionándose en la carpeta `docs/` vuelva a arrancar el servidor  con `rake serve`
2. Limpiar los documentos en las carpetas `leccion` y `_tareas` y sustituirlos por nuestras lecciones y tareas correspondientes a nuestra asignatura


## Aprender Jekyll

### Jekyll docs

Para aprender mas tenemos los tutorials en la documentación de <a href= "https://jekyllrb.com/docs/" target="_blank">Jekyll</a>

* [Jekyll docs](https://jekyllrb.com/docs/)
  *   [Pages](https://jekyllrb.com/docs/pages/)
  *   [Posts](https://jekyllrb.com/docs/posts/)
  *   [Front Matter](https://jekyllrb.com/docs/front-matter/)
  *   [Collections](https://jekyllrb.com/docs/collections/)
         *   [Page Sections in Jekyll - Separating Content from Layout](https://dev-notes.eu/2016/08/page-sections-in-jekyll-seperating-content-from-layout/)
         * [Explain like I’m five: Jekyll collections](https://ben.balter.com/2015/02/20/jekyll-collections/)
  *   [Data Files](https://jekyllrb.com/docs/datafiles/)
         * [Why I love Jekyll Data Files - Chen Hui Jing // JekyllConf 2019](https://youtu.be/CERXESTZ5w4) YouTube
  *   [Assets](https://jekyllrb.com/docs/assets/)
  *   [Static Files](https://jekyllrb.com/docs/static-files/)

### Ejemplos

Aprender algo de Liquid usando una lección y una tarea
   1. Ver el fichero _includes/clases-impartidas.md y explicar
   2.  También ver el ejemplo de  la rúbrica en una práctica

### Liquid extension for VSCode

Opcionalmente puede instalar el [paquete Liquid](https://marketplace.visualstudio.com/items?itemName=sissel.shopify-liquid) para su Codespaces.
   
![assets/images/liquid-vscode-package]({{ site.baseurl }}/assets/images/liquid-vscode-package.png)

Recuerde que para habilitar la sincronización de configuración, en la esquina inferior izquierda de la barra de actividad  seleccione y haga clic en la rueda dentada. Active la *sincronización de configuración…*. En el cuadro de diálogo, seleccione todas las configuraciones.

## Desplegando en su organización ull-mfp-aet-2324-aluXXXX.github.io

Hemos estado generando el web site en el repo de la asignación de esta tarea. 
El objetivo es que este web site sea el de su organización, por lo tanto es conveniente que lo despliegue en su organización.

1.  Haga un fork del repo de la práctica a su organización: el repo de destino será en la organización de su asignatura:  `ULL-MFP-AET-2324-aluXXX/ull-mfp-aet-2324-aluXXX.github.io`
   *  Previamente el profesor debe configurar la organización para permitir los forks (settings -> member priveleges -> repository forking -> check Allow forking of private repositories)
1.  El nombre del repo de destino deberá ser el de la organización de su asignatura seguido del sufijo `.github.io`: `ull-mfp-aet-2324-aluXXXX.github.io`
1.  Configure el repo `ULL-MFP-AET-2324-aluXXX/ull-mfp-aet-2324-aluXXX.github.io` para usar github pages
1.  Modifique el `baseurl` en el archivo `_config.yml` a vacío `baseurl: ""` 
1.  Compruebe en las GitHub Actions del repo `ULL-MFP-AET-2324-aluXXX/ull-mfp-aet-2324-aluXXX.github.io` que el despliegue se ha realizado correctamente y observe el despliegue en el web site `https://ull-mfp-aet-2324-aluXXX.github.io` 

## Llevando sucesivos cambios del repo de la práctica a su repo de organización 

1.  Haga ahora mas cambios en el repo de la práctica `ULL-MFP-AET-2324/asignatura-website-aluXXX` y compruebe que se despliegan correctamente en su web site `https://ull-mfp-aet-2324-aluXXX.github.io/asignatura-website-aluXXX` 
2.  Haga un [pull request]({{ site.baseurl }}/glossary.html#pull-request) a la rama `main` del repo `ULL-MFP-AET-2324-aluXXX/ull-mfp-aet-2324-aluXXX.github.io` desde el repo de la práctica `ULL-MFP-AET-2324/asignatura-website-aluXXX`
3.  Ahora analice el pull request y acepte los cambios propuestos
4.  Observe los cambios en el despliegue de la web de su asignatura en `ull-mfp-aet-2324-aluXXX.github.io`

<!--
## Añadir una sección de Comentarios

Instale  utterances en su repo [https://github.com/apps/utterances](https://github.com/apps/utterances) y configurela para añadir comentarios a su repo.
-->

## Página web del usuario en GitHub

Siguen algunos ejemplos de páginas web de usuarios en GitHub que pueden servir de inspiración para us página web de usuario:

* <a href="https://github.com/topics/academic-website" target="_blank">GitHub Topics: <b>academic-website</b></a>. Una lista de repositorios en las que figura el tópico `academic-website`
* [The GitHub organization academicpages](https://github.com/academicpages) has several repos including one with a beautiful CV template at [academicpages/sb-personal](https://github.com/academicpages/sb-personal). You can see it deployed at 
[https://academicpages.github.io/](https://academicpages.github.io/)
* Ejemplo de CV de Biagio Brattoli usando Jekyll:
  * [Repo en GitHub](https://github.com/bbrattoli/bbrattoli.github.io)
  * [Despliegue en GitHub Pages](https://bbrattoli.github.io/)
* [crguezl/crguezl.github.io](https://github.com/crguezl/crguezl.github.io) es el repo que contiene el web site de este profesor. 
  * [Despliegue en GitHub Pages](https://crguezl.github.io/)

## Desplegando el Web Site de la Asignatura en Moodle

Si tiene acceso a un curso Moodle puede desplegar el web site de la asignatura en el curso Moodle.
Para ello puede seguir las instrucciones en la sección [Importing a Website into Moodle]({{site.baseurl}}/pages/moodle.html)

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
