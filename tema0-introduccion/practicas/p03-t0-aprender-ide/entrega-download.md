* Repita los pasos vistos sobre control de versiones y añada todos los cambios realizados en las etapas anteriores al repo creado `JekyllBlog-aluXXX`
* En el repo de entrega `p03-t0-aprender-ide-aluXXX` asegúrese de añadir en el `README.md` un enlace al repo creado y un enlace al replit
* Escriba un informe de lo aprendido
* Añada al repo de entrega  `p03-t0-aprender-ide-aluXXX`  todos los ficheros del directorio generado por jekyll que están en `_site` 
  * Primero descargue a su ordenador todos los ficheros de `JekyllBlog-aluXXX` (Vea en la etiqueta `code` la opción `Download zip`) o bien desde el mismo repl.it:

    ![](https://storage.googleapis.com/replit/images/1576753896253_8e8fda782173c0a08fe72fec7d8a0dee.png)
  * Pruebe a abrir el fichero descargado  `_site/index.html` con su navegador. ¿Que ve?
  * Luego use la opción `Add file` de la interfaz de GitHub en el repo para añadir los archivos en `_site`
* Añada un fichero `.nojekyll` vacío al repo de entrega  `p03-t0-aprender-ide-aluXXX`. *Esto hará que Jekyll deje de funcionar como servidor por defecto* para este repo y se use un [servidor estático ordinario]({{site.baseurl}}/glossary.html#static-server) (See [Bypassing Jekyll on GitHub Pages](https://github.blog/2009-12-29-bypassing-jekyll-on-github-pages/) by Tom Preston-Werner)
* Active las GitHub Pages del Repo de entrega  `p03-t0-aprender-ide-aluXXX` a partir de la rama `main` y especifique la carpeta principal como carpeta que contiene el web site
