---
layout: default
title: p04-t0-aprender-jekyll
permalink: /tema0-introduccion/practicas/p04-t0-aprender-jekyll/index.html
previous: 
  url: 
next:
  url: 
---

# Aprendiendo Jekyll (p04-t0-aprender-jekyll)

Partiendo del [repl.it](https://repl.it) que creó en la práctica anterior, vamos a profundizar en el generador de web sites y blogs estáticos ([Jekyll](jekyllrb.com)).

Siga estos pasos:


## En Repl.it

* Renombre su repl.it en que trabajó en la práctica anterior [p03-t0-aprender-ide]({{site.baseurl}}//tema0-introduccion/practicas/p03-t0-aprender-ide/) como `p03-t0-aprender-ide`
* Haga un fork de su repl.it en que trabajó en la práctica anterior [p03-t0-aprender-ide]({{site.baseurl}}//tema0-introduccion/practicas/p03-t0-aprender-ide/)
* Renómbrelo al nombre de esta práctica `p04-t0-aprender-jekyll`
* A partir de ahora trabajaremos en este replit


## Objetivos

* Modifique el projecto para que sea un web site para la asignatura que piensa desarrollar en su TFM y en sus Prácticas en Centros. En el directorio `_posts` escriba varias lecciones de  prueba. Algo así:

  ```
  ~/.../aet2021/apuntes(master)]$ tree _posts
  _posts
  ├── 2020-11-03-leccion.md
  ├── 2020-11-05-leccion.md
  ├── 2020-11-10-leccion.md
  ├── 2020-11-12-leccion.md
  └── 2020-11-17-leccion.md
  ```
* Recuerde poner el front-matter en sus posts. Especifique al menos el layout y el title.
  
  ```
    ---
    layout: post
    title:  "Clase del Jueves 12/11/2020"
    ---
  ```
* Defina una [collection](https://jekyllrb.com/docs/collections/) `temas` para los temas que va a impartir y ponga algún contenido
* Defina una [collection](https://jekyllrb.com/docs/collections/) `tareas` para las tareas que va a asignarles a sus alumnos y añádales algún contenido
* Aisle los datos en el directorio `_data` en un fichero JSON o yml de manera que el web site sea fácilmente modificable para adaptarlo a otra asignatura

## An Introduction to Jekyll Collections


{% capture jekyll_collections %}
  {% include jekyll-collections.md %}
{% endcapture %}

<!-- Use a character as º to mark the substitution points, that does no appear in any other part of the document -->
{{ jekyll_collections | replace: 'º#', '###' }}

<!--
* Haga un fork de este replit: [https://repl.it/@crguezl/JekyllBlog#main.sh](https://repl.it/@crguezl/JekyllBlog#main.sh) o bien duplique el de la última práctica
* Aquí tiene un ejemplo de CV usando Jekyll por Biagio Brattoli:
  * [Repo en GitHub](https://github.com/bbrattoli/bbrattoli.github.io)
  * [Despliegue en GitHub Pages](https://bbrattoli.github.io/)
* Aquí tienes otro ejemplo de CV
  * [Repo en GitHub](https://github.com/ddbullfrog/resumecard)
  * [Despliegue](https://ddbullfrog.github.io/resumecard/)
* Usando [git](https://git-scm.com/) clone en el directorio `site` el repo [bbrattoli/bbrattoli.github.io](https://github.com/bbrattoli/bbrattoli.github.io). Puede hacerlo en la terminal:

  ```
    $ rm -fR site
    $ git clone https://github.com/bbrattoli/bbrattoli.github.io.git site
    Cloning into 'site'...
    remote: Enumerating objects: 2119, done.
    remote: Total 2119 (delta 0), reused 0 (delta 0), pack-reused 2119
    Receiving objects: 100% (2119/2119), 4.17 MiB | 10.23 MiB/s, done.
    Resolving deltas: 100% (482/482), done.
  ```

* Lea la documentación en [jekyllrb.com](https://jekyllrb.com) y vaya modificando los ficheros en `_data`, `_config.yml` etc. para personalizarlo como su CV.
-->
## La Entrega

* En el repo de entrega asegúrese de añadir un enlace al replit
* Comparta su replit con el profesor (crguezl)
* Añada al repo de entrega todos los ficheros del directorio que contienen los ficheros generados para el web site (directorio `_site`). 
* Añada el fichero `.nojekyll` al repo
* Active GitHub Pages del Repo
* Ponga el enlace en la sección de descripción del repo
  
## Referencias

{% include jekyll-references.md %}

<!--
* [Repl.it Tutorial MAKE A BLOG USING JEKYLL](https://repl.it/talk/learn/GUIDE-MAKE-A-BLOG-USING-JEKYLL-POG-ALERT-KEK-HAHAYES-ENDORSED/59021)
  * [Repl de ejemplo](https://repl.it/@sourcerose/JekyllBlog#main.sh)
  * [Repo en GitHub](https://github.com/barryclark/jekyll-now.git)
* [Understanding the Repl.it IDE: a practical guide to building your first project with Repl.it](https://www.codewithrepl.it/01-introduction-to-the-repl-it-ide.html)
* [Repl.it Quick Start Guide](https://docs.repl.it/misc/quick-start)
* Documentación en [jekyllrb.com](https://jekyllrb.com)
* Ejemplo de CV de Biagio Brattoli usando Jekyll:
  * [Repo en GitHub](https://github.com/bbrattoli/bbrattoli.github.io)
  * [Despliegue en GitHub Pages](https://bbrattoli.github.io/)
* [Free Jekyll Themes](https://jekyllthemes.io/free)
-->