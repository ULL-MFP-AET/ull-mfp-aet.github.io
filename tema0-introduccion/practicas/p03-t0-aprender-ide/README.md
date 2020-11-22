---
layout: default
title: p03-t0-aprender-ide
permalink: /tema0-introduccion/practicas/p03-t0-aprender-ide/index.html
previous: 
  url: tema0-introduccion/practicas/p02-t0-revision-grupal/
next:
  url: tema0-introduccion/practicas/p04-t0-aprender-jekyll/
---

# Aprendiendo a usar una IDE (p03-t0-aprender-ide)

En esta práctica aprenderemos a usar una IDE en la nube ([repl.it](https://repl.it)) y seguiremos familiarizandonos con el generador de web sites estáticos ([Jekyll](jekyllrb.com)).

Siga estos pasos:

## Primeros pasos

* Cree una cuenta en replit [https://repl.it/signup](https://repl.it/signup). Use la cuenta de GitHub para crear la cuenta de replit.
* Autorice a Replit para que pueda acceder a todos su repositorios GitHub
* Haga un fork de este replit: [https://repl.it/@crguezl/JekyllBlog#main.sh](https://repl.it/@crguezl/JekyllBlog#main.sh) y cambie el nombre a `JekyllBlog-aluXXX` 
* Pulse el boton RUN o escriba en la terminal `bash main.sh`
  - Debería configurarse y ejecutarse `jekyll`, construir las páginas web y arrancar un servidor. La página debería aparecer en la ventana superior derecha
* Intente familiarizarse con la IDE en la nube Replit. 
* Modifique el fichero `index.html` y compruebe que se reflejan los cambios al refrescar la página
* Abre una terminal: Para ello pulse `<F1>` y escriba `shell`. Luego elige `open shell`

## El Chat

* Invite a colaborar a un compañero de equipo (botón `Share` arriba a la derecha). Puede hacerlo especificando el usuario o mediante un un enlace
* En otra pestaña acepte y únase a la invitación de su compañero
* Observe los múltiples cursores. Pueden iniciar un chat haciendo click en el icono de chat abajo a la derecha

## Control de Versiones

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

## Clonando un Repositorio con un Web Site Jekyll

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

  ### Eliminando el Histórico de Versiones del repo clonado

  * Borre la carpeta oculta `.git` en el repo clonado:

    ```
    $ cd site
    $ rm -fR .git
    ``` 

    **¿Que estamos haciendo?** Al borrar la carpeta `.git`estamos borrando todo el histórico del control de versiones del repo `barryclark/jekyll-now`. Con esto la carpeta `site` deja de ser un repo para convertirse en una simple carpeta 
  
  ## Aprendiendo más sobre Jekyll

  * Vuelva a correr el servidor Jekyll:

    ```
    $ bash main.sh
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
  * Ahora pare el servidor  con `Ctrl-C` y edite el fichero `site/_config.yml`. Cambie la entrada `name:` para que contenga su nombre. 
  Cambie  el `avatar` o `footer-link.github` ¿Que ocurre cuando refresca? ¿Se ven los cambios?
  Vuelva a ejecutar jekyll.
  ¿Que ocurre?. 

    **NOTA:** Jekyll vigila los cambios que hacemos y refresca el web site cada vez que ocurre uno. Sin embargo, no vigila el fichero `_config.yml`. Es por eso que debemos rearrancarlo


* Mire en el directorio `_layouts` ¿Que es un [layout](https://jekyllrb.com/docs/step-by-step/04-layouts/)?
  - **Layouts are templates that wrap around your content**. They live in a directory called `_layouts`.
  -  Para entender un poco edite el fichero `_site/_layouts/default.html`y busque por la aparición de la palabra `site.name`. El lenguaje que estamos viendo es una mezcla de HTML con un lenguaje de templates que se conoce como [Liquid](https://shopify.github.io/liquid/)

    ```html
    ...
    <a href="{ { site.baseurl } }/" class="site-avatar"><img src="{ { site.avatar } }" /></a>

    <div class="site-info">
      <h1 class="site-name"><a href="{ { site.baseurl } }/">{ { site.name } }</a></h1>
      <p class="site-description">{ { site.description } }</p>
    </div>
    ...
    ```
* Observa que `posts.html` y `page.html` son layouts que se envuelven en el layout `default.html`
* ¿Cómo se especifica que layout se aplica a una página? Mira en:
  - index.md
  - 404.md
  - Un post en `_posts`
* [front matter](https://jekyllrb.com/docs/front-matter/)
* Observe en el fichero `default.html` la línea:

  ```
     { % include svg-icons.html % }
  ```
  ¿Que hace un [include](https://jekyllrb.com/docs/includes/)?
* Edite el fichero `_includes/svg-icons.html` ¿Que hacen las sentencias [if](https://shopify.github.io/liquid/tags/control-flow/)?
* Vaya al directorio `_posts` y vea los ficheros que hay allí. ¿Que son los [posts](https://jekyllrb.com/docs/posts/)?
  - Añada un posts. Refresque la página ¿Porque se actualiza automáticamente?
  - Edite el fichero `index.html` para entender porque se actualiza con el nuevo post:

    ```html
      <div class="posts">
    { % for post in site.posts % }
      <article class="post">

        <h1><a href="{ { site.baseurl } }{ { post.url } }">{ { post.title } }</a></h1>

        <div class="entry">
          { { post.excerpt } } ...
        </div>

        <a href="{ { site.baseurl } }{ { post.url } }" class="read-more">Read More</a>
      </article>
    { % endfor % }
    ```
  - Acorte el `excerpt` del post en `index.html` usando un [filtro Liquid](https://shopify.dev/docs/themes/liquid/reference/filters) como [slice](https://shopify.dev/docs/themes/liquid/reference/filters/string-filters). You can play your ideas at [JumpSeller's Liquid SandBox](https://jumpseller.com/support/liquid-sandbox/)
    - You can access a snippet of a posts’s content by using `excerpt` variable on a post. By default this is the first paragraph of content in the post
 * Edite el fichero `404.md` ¿Cual es la función del fichero [404.md](https://jekyllrb.com/tutorials/custom-404-page/)?
   - Vuelva a editar el post que creó antes. Añádale un enlace a un fichero que no existe `[click here](does-not-exist.md)`. ¿Que ocurre cuando hacemos click en el enlace?. Modifique el fichero `404.md` 
* Observe el uso de `site.baseurl` para los enlaces:

    ```html
  [<img src="{ { site.baseurl } }/images/404.jpg" alt="Constructocat by https://github.com/jasoncostello" style="width: 400px;"/>
    ```

  ¿Cual es la razón para usar `site.baseurl`?
  - El `config.yml` de estos apuntes contiene esta línea:

    ```yml
    baseurl: '/introduccion'
    ```

    Note que los apuntes son servidos desde [https://ull-mfp-aet-2021.github.io/introduccion/tema0-introduccion/practicas/p04-t0-aprender-jekyll/]({{site.baseurl}}/tema0-introduccion/practicas/p04-t0-aprender-jekyll/)
* Observe el uso de la variable permalink en el `404.md`. ¿Que es un [permalink](https://jekyllrb.com/docs/permalinks/)?
  - Permalinks are the output path for your pages, posts, or collections. They allow you to structure the directories of your source code different from the directories in your output 
* En este caso las hojas de estilo han sido escritas en [SASS](https://jekyllrb.com/docs/assets/) *a mano*. No se ha hecho uso de un theme. Vea el fichero `style.scss`

## Entrega

### Opción: Entrega usando git

En su repl.it, asegúrese que Jekyll ha generado correctamente el web site en la carpeta `_site`. 

Después nos posicionamos en `_site`:

```
cd ~/p03-t0-aprender-ide/site/_site    
```

Convertimos `_site` en un repo git. Esto crea la carpeta oculta `.git`:

```
git init .   
```

Después añadimos todos los ficheros en `_site` al repo
```
git add .
```

Antes de hacer un commit tenemos que configurar el programa `git` declarando nuestra identidad para el rastreo de versiones:

```
git config --global user.email "aluXXX@ull.edu.es"
git config --global user.name nombre-aluXXX
```

Ahora confirmamos nuestros cambios:

```
git commit -am '_site converted to repo'
```

Ahora vamos a establecer el remoto. Esta vez, por simplicidad, elegimos la URL con https:

```
git remote add origin https://github.com/ULL-MFP-AET-2021/p03-t0-aprender-ide-aluXXX.git # Apuntamos el remoto al repo de la entrega
```

Cada vez  que empujemos a GitHub se nos pedirán el usuario y la clave de github. Esto puede resultar pesado. Para evitarlo y que sólo ocurra la primera vez, le indicamos a git que la primera vez que nos identifiquemos con GitHub almacene el usuario y la clave:

```
git config credential.helper store  # Para que no nos esté preguntando la password cada vez
```

En este momento estamos en la rama `master`:

```
~/.../site/_site$ git branch
* master
```

Ahora hacemos un empuje al remoto de la rama `master`. Esto creará la rama `master`en el remoto (recuerde que GitHub trabaja ahora con la rama `main` como rama principal)

```
git push -u --force origin master 
```

Nos pedirá el usuario y clave de GitHub y las almacenará.

En el navegador, nos situamos en el tab del repo de GitHub, reconfiguramos en la sección `settings` las github-pages del repo para que tire de la rama `master` y el directorio raíz.

Visite la web. Algo va mal. ¿Que ocurre?. Abra las herramientas del desarrollador en su navegador. 
En la cónsola verá el mensaje. 

Resuelva el problema cambiando en `_config.yml`  con una entrada como esta:

```yml
baseurl: "/p03-t0-aprender-ide-aluXXXX"
```



### Opción: Entrega mediante Descarga

* [Opción: Entrega mediante Descarga]({{site.baseurl}}/tema0-introduccion/practicas/p03-t0-aprender-ide/entrega-download)

## Referencias


{% include replit-references.md %}

