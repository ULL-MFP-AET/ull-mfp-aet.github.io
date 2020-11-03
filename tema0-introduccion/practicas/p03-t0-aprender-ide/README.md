---
layout: default
title: p03-t0-aprender-ide
permalink: /tema0-introduccion/practicas/p03-t0-aprender-ide/index.html
previous: 
  url: 
next:
  url: 
---

# Aprendiendo a usar una IDE (p03-t0-aprender-ide)

En esta práctica aprenderemos a usar una IDE en la nube ([repl.it](https://repl.it)) y empezaremos a familiarizarnos con un generador de web sites y blogs estáticos ([Jekyll](jekyllrb.com)).

Siga estos pasos:

* Cree una cuenta en replit [https://repl.it/signup](https://repl.it/signup). Use la cuenta de GitHub para crear la cuenta de replit.
* Autorice a Replit para que pueda acceder a todos su repositorios GitHub
* Haga un fork de este replit: [https://repl.it/@crguezl/JekyllBlog#main.sh](https://repl.it/@crguezl/JekyllBlog#main.sh)
* Pulse el boton RUN o escriba en la terminal `source main.sh`
  - Debería configurarse y ejecutarse `jekyll`, construir las páginas web y arrancar un servidor. La página debería aparecer en la ventana superior derecha
* Intente familiarizarse con la IDE en la nube Replit. 
  * Este tutorial [Understanding the Repl.it IDE: a practical guide to building your first project with Repl.it](https://www.codewithrepl.it/01-introduction-to-the-repl-it-ide.html) puede ayudar
  * [Repl.it Quick Start Guide](https://docs.repl.it/misc/quick-start)
* Modifique el fichero `index.html` y compruebe que se reflejan los cambios al refrescar la página
* Ahora:
  * Borre el directorio `site` con todos los ficheros en él:
  
    ```
    $ pwd
  /home/runner/JekyllBlog/site
    $ cd ..
    $ rm -fR site
    ```
  * Clone el repositorio [https://github.com/barryclark/jekyll-now.git](https://github.com/barryclark/jekyll-now) en el directorio `site`:
  
    ```
    git clone https://github.com/barryclark/jekyll-now.git site
    Cloning into 'site'...
    remote: Enumerating objects: 1300, done.
    remote: Total 1300 (delta 0), reused 0 (delta 0), pack-reused 1300
    Receiving objects: 100% (1300/1300), 8.17 MiB | 12.47 MiB/s, done.
    Resolving deltas: 100% (717/717), done.
    ```

  * Vuelva a correr el servidor Jekyll:

    ```
    $ source main.sh
    Please Wait....
    jekyll 4.1.1
    Configuration file: /home/runner/JekyllBlog/site/_config.yml
                Source: /home/runner/JekyllBlog/site
          Destination: /home/runner/JekyllBlog/site/_site
    Incremental build: disabled. Enable with --incremental
          Generating... 
                        done in 0.198 seconds.
    Auto-regeneration: enabled for '/home/runner/JekyllBlog/site'
        Server address: http://0.0.0.0:8080/
      Server running... press ctrl-c to stop.
    ```

  * Refresque la página del blog:
     
     ![]({{site.baseurl}}/assets/images/first-jekyll-blog.png)
  
    debería verse parecida a esta imagen

* En el repo de entrega asegúrese de añadir un enlace al replit creado.
* Comparta su replit con el profesor
* Añada al repo de entrega todos los ficheros del directorio que contienen los fuentes para el web `site` 

## Referencias

* [Repl.it Tutorial MAKE A BLOG USING JEKYLL](https://repl.it/talk/learn/GUIDE-MAKE-A-BLOG-USING-JEKYLL-POG-ALERT-KEK-HAHAYES-ENDORSED/59021)
  * [Repl de ejemplo](https://repl.it/@sourcerose/JekyllBlog#main.sh)
  * [Repo en GitHub](https://github.com/barryclark/jekyll-now.git)
* [Understanding the Repl.it IDE: a practical guide to building your first project with Repl.it](https://www.codewithrepl.it/01-introduction-to-the-repl-it-ide.html)
* [Repl.it Quick Start Guide](https://docs.repl.it/misc/quick-start)
* Documentación en [jekyllrb.com](https://jekyllrb.com)
