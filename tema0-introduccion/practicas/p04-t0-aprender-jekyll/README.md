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

* Haga un fork de este replit: [https://repl.it/@crguezl/JekyllBlog#main.sh](https://repl.it/@crguezl/JekyllBlog#main.sh) o bien duplique el de la última práctica
* Aquí tiene un ejemplo de CV usando Jekyll por Biagio Brattoli:
  * [Repo en GitHub](https://github.com/bbrattoli/bbrattoli.github.io)
  * [Despliegue en GitHub Pages](https://bbrattoli.github.io/)
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

* En el repo de entrega asegúrese de añadir un enlace al replit creado.
* Comparta su replit con el profesor
* Añada al repo de entrega todos los ficheros del directorio que contienen los fuentes para el web `site`: 
  - Suprimir el directorio `.git`
  - Crea un repo (desde la IDE o bien `git init`, etc) y lo conecta con el creado en GitHub por la asignación de esta tarea

## Referencias

* [Repl.it Tutorial MAKE A BLOG USING JEKYLL](https://repl.it/talk/learn/GUIDE-MAKE-A-BLOG-USING-JEKYLL-POG-ALERT-KEK-HAHAYES-ENDORSED/59021)
  * [Repl de ejemplo](https://repl.it/@sourcerose/JekyllBlog#main.sh)
  * [Repo en GitHub](https://github.com/barryclark/jekyll-now.git)
* [Understanding the Repl.it IDE: a practical guide to building your first project with Repl.it](https://www.codewithrepl.it/01-introduction-to-the-repl-it-ide.html)
* [Repl.it Quick Start Guide](https://docs.repl.it/misc/quick-start)
* Documentación en [jekyllrb.com](https://jekyllrb.com)
* Ejemplo de CV de Biagio Brattoli usando Jekyll:
  * [Repo en GitHub](https://github.com/bbrattoli/bbrattoli.github.io)
  * [Despliegue en GitHub Pages](https://bbrattoli.github.io/)

