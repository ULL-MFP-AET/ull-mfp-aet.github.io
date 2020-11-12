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

En esta práctica aprenderemos a usar una IDE en la nube ([repl.it](https://repl.it)) y seguiremos familiarizandonos con el generador de web sites estáticos ([Jekyll](jekyllrb.com)).

Siga estos pasos:

* Cree una cuenta en replit [https://repl.it/signup](https://repl.it/signup). Use la cuenta de GitHub para crear la cuenta de replit.
* Autorice a Replit para que pueda acceder a todos su repositorios GitHub
* Haga un fork de este replit: [https://repl.it/@crguezl/JekyllBlog#main.sh](https://repl.it/@crguezl/JekyllBlog#main.sh)
* Pulse el boton RUN o escriba en la terminal `source main.sh`
  - Debería configurarse y ejecutarse `jekyll`, construir las páginas web y arrancar un servidor. La página debería aparecer en la ventana superior derecha
* Intente familiarizarse con la IDE en la nube Replit. 
* Modifique el fichero `index.html` y compruebe que se reflejan los cambios al refrescar la página
* Abre una terminal: Para ello pulse `<F1>` y escriba `shell`. Luego elige `open shell`
* Vamos a aprender a usar git y GitHub en repl.it. Para ello sigamos el tutorial:
  * [GIT on repl.it](https://repl.it/talk/learn/)
  * Creamos un nuevo repo **público** en GitHub en la organización **ULL-MFP-AET-2021** y lo llamamos `JekyllBlog-aluXXX` (sustituya `aluXXX` por su usuario GitHub)
  * Conectamos nuestro replit con el repo
  * Create a new branch by clicking the `+`, and create a branch named `development`
  * After working on your project for a while and you're ready to finish, click `commit & push`
  * Now, if you switch branches, you'll see that master does not have the same contents as the development branch
  * To `merge` the code back into `master`, you need to create a `Pull request`. Go to your GitHub repository
  * Click `Compare and pull request`, and write a description of the change
  * Once you're done, click the green `Create pull request` button
  * If you return to you repl, and switch to the `master` branch, you should see a new button appear
  * Click `Pull <-` to update your code. Repl.it will update your code to reflect your repo, and you can continue to work!
  * Congrats! That's the basics of git in repl.it!
* Ahora:
  * Detenga la ejecución de Jekyll. Para ello, haga click en el botón `stop` o si es usted de la vieja guardia, en la terminal en la que está ejecutándose Jekyll pulse `Ctrl-C` 
  * Borre el directorio `site` con todos los ficheros en él. 
    * Puede hacerlo desde la IDE de replit: To remove the folder `site`, click the icon with 3 dots on the very right and click the `delete` button 

      ![](https://storage.googleapis.com/replit/images/1556246404868_e600f8187296777bf09df32fbdc94a58.jpe)
    * O bien si es usted un hacker puede usar la terminal:
  
      ```
      $ pwd              # pwd nos dice en que carpeta estamos
    /home/runner/JekyllBlog/site
      $ cd ..            # nos cambiamos a la carpeta que contiene a esta
      $ rm -fR site      # rm sirve para borrar. La opción -R indica que se borren recursivamente todas las carpetas dentro de site
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
  * Si al cabo de un tiempo no ve los cambios en la ventana de `Files`, es posible que tenga que refrescar en el navegador la página para que se actualicen
  * Borre la carpeta oculta `.git` en el repo clonado:

    ```
    $ cd site
    $ rm -fR .git
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
  * Ahora pare el servidor  con `Ctrl-C` y edite el fichero `site/_config.yml`. Cambie la entrada `name:` para que contenga su nombre. Vuelva a ejecutar jekyll.
  ¿Que ocurre?. 

  Para entender un poco edite el fichero `_site/_layouts/default.html`y busque por la aparición de la palabra `site.name`. El lenguaje que estamos viendo es una mezcla de HTML con un lenguaje de templates que se conoce como [Liquid](https://shopify.github.io/liquid/)

  ```html
  ...
  <a href="{ { site.baseurl } }/" class="site-avatar"><img src="{ { site.avatar } }" /></a>

  <div class="site-info">
    <h1 class="site-name"><a href="{ { site.baseurl } }/">{ { site.name } }</a></h1>
    <p class="site-description">{ { site.description } }</p>
  </div>
  ...
  ```

* Repita los pasos vistos sobre control de versiones y añada todos los cambios realizados en las etapas anteriores al repo creado `JekyllBlog-aluXXX`
* En el repo de entrega `p03-t0-aprender-ide-aluXXX` asegúrese de añadir en el `README.md` un enlace al repo creado y un enlace al replit
* Escriba un informe de lo aprendido
* Añada al repo de entrega  `p03-t0-aprender-ide-aluXXX`  todos los ficheros del directorio generado por jekyll que están en `_site` 
  * Primero descargue a su ordenador todos los ficheros de `JekyllBlog-aluXXX` (Vea en la etiqueta `code` la opción `Download zip`) o bien desde el mismo repl.it:

    ![](https://storage.googleapis.com/replit/images/1576753896253_8e8fda782173c0a08fe72fec7d8a0dee.png)
  * Pruebe a abrir el fichero descargado  `_site/index.html` con su navegador. ¿Que ve?
  * Luego use la opción `Add file` de la interfaz de GitHub en el repo para añadir los archivos en `_site`
* Añada un fichero `.nojekyll` vacío al repo de entrega  `p03-t0-aprender-ide-aluXXX`. Esto hará que Jekyll deje de funcionar como servidor por defecto para este repo y se use un servidor estático ordinario
* Active las GitHub Pages del Repo de entrega  `p03-t0-aprender-ide-aluXXX` a partir de la rama `main` y la carpeta principal

## Referencias

{% include replit-references.md %}

