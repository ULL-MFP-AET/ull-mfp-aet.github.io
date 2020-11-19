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

  ![]({{site.baseurl}}/assets/images/replit-fork.png)
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

En tu repl.it, el remoto git sigue apuntando al  repo que creaste en su momento:

```
GNU bash, version 4.4.20(1)-release (x86_64-pc-linux-gnu)
 git remote -v
origin  https://github.com/ULL-MFP-AET-2021/JekyllBlog-jrguezl (fetch)
origin  https://github.com/ULL-MFP-AET-2021/JekyllBlog-jrguezl (push)
```
Configuramos nuestra identidaad `git` en la máquina virtual de repl.it con estos comandos:

```
 git config --global user.email juanarguezleon@gmail.com
 git config --global user.name jrguezl
```

Nos situamos en el directorio `site`:

```
 cd site
```

Y creamos un nuevo repo local con el comando `git init`:

```
 git init .
Initialized empty Git repository in /home/runner/p04-t0-aprender-jekyll-no-aceptado/site/.git/
```

Le indicamos a git que ponga todos los ficheros bajo el control de versiones del nuevo repo con `git add .`:

```
 git add .
ll-jrguezl.gitdd origin https://github.com/ULL-MFP-AET-2021/p04-t0-aprender-jekyl
```

```
ignment repo'-am 'creating a repo inside site and linking it with the remote assi
[master (root-commit) c1fe9a0] creating a repo inside site and linking it with the remote assignment repo
 35 files changed, 950 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 .jekyll-cache/Jekyll/Cache/Jekyll--Cache/b7/9606fb3afea5bd1609ed40b622142f1c98125abcfe89a76a661b0e8e343910
 create mode 100644 .jekyll-cache/Jekyll/Cache/Jekyll--Converters--Markdown/15/b6358a87c7cc1498f3e8d812da39625a565466f0f25ecf972285ef0f43f6ae
 create mode 100644 .jekyll-cache/Jekyll/Cache/Jekyll--Converters--Markdown/1c/a5d52e9e249290dc671a507f5c024b35abaa398ce12ed3ccfc66f1f08019ad
 create mode 100644 .jekyll-cache/Jekyll/Cache/Jekyll--Converters--Markdown/2f/644b4d1157f7c45f8f31e73874d2c524849c7618b71e00470ee21043263b2a
 create mode 100644 .jekyll-cache/Jekyll/Cache/Jekyll--Converters--Markdown/52/0cc169b6684dfcb27cce7a5c7d9a5e36c904cc1afce04a119f70cb9715374d
 create mode 100644 .jekyll-cache/Jekyll/Cache/Jekyll--Converters--Markdown/ad/ec53e4f43e6bb7d97b2ff268bf8439495395f816120581ad7730b8d0ba6bb7
 create mode 100644 .jekyll-cache/Jekyll/Cache/Jekyll--Converters--Markdown/d8/9b23a2ca96e9a3e0b9e5254fe5e18b7396b29845010f5e813665eecebae45b
 create mode 100644 404.md
 create mode 100644 CNAME
 create mode 100644 LICENSE
 create mode 100644 README.md
 create mode 100644 _config.yml
 create mode 100644 _includes/analytics.html
 create mode 100644 _includes/disqus.html
 create mode 100644 _includes/meta.html
 create mode 100644 _includes/svg-icons.html
 create mode 100644 _layouts/default.html
 create mode 100644 _layouts/page.html
 create mode 100644 _layouts/post.html
 create mode 100644 _posts/2014-3-3-Hello-World.md
 create mode 100644 _posts/2020-11-17-clase.md
 create mode 100644 _sass/_highlights.scss
 create mode 100644 _sass/_reset.scss
 create mode 100644 _sass/_svg-icons.scss
 create mode 100644 _sass/_variables.scss
 create mode 100644 about.md
 create mode 100644 images/404.jpg
 create mode 100644 images/config.png
 create mode 100644 images/first-post.png
 create mode 100644 images/jekyll-logo.png
 create mode 100644 images/jekyll-now-theme-screenshot.jpg
 create mode 100644 images/step1.gif
 create mode 100644 index.html
 create mode 100644 style.scss
 git branch -a
* master
  remotes/origin/feedback
  remotes/origin/main
  remotes/origin/master
```
Empujamos los contenidos del directorio `site` en el repo de entrega de la práctica con `git push -u --force origin master:main``

```
 git push -u --force origin master:main
Username for 'https://github.com': jrguezl
Password for 'https://jrguezl@github.com': 
Counting objects: 54, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (50/50), done.
Writing objects: 100% (54/54), 1.17 MiB | 2.05 MiB/s, done.
Total 54 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2), done.
To https://github.com/ULL-MFP-AET-2021/p04-t0-aprender-jekyll-jrguezl.git
 + c948d4f...c1fe9a0 master -> main (forced update)
Branch 'master' set up to track remote branch 'main' from 'origin'.
 
```

* En el repo de entrega asegúrese de añadir un enlace al replit
* Comparta su replit con el profesor (crguezl)
* Active GitHub Pages del Repo
* Ponga el enlace en la sección de descripción del repo
  
## Referencias

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

## Tips

* [js-yaml](https://www.npmjs.com/package/js-yaml)
  - `npx js-yaml data.yml > data.json` converts from .yml to .json
{% include jekyll-references.md %}
