# Introducción a CodeSpaces

En el repo de la asignación , procedemos a abrir CodeSpaces. Para ello, en el repo, 
nos vamos a la etiqueta "Code" y elegimos la pestaña "CodeSpaces":

![]({{ site.baseurl }}/assets/images/codespaces.png)

Elegimos la opción `Create codespace on master` y hacemos click

![]({{ site.baseurl }}/assets/images/codespaces-create-on-master.png)

La consecuencia es que se nos abre una página con el editor CodeSpaces. 

## Instalación de Jekyll

En la ventana de la terminal escribimos el comando para instalar las dependencias: 

```
bundle install
```

este comando hace que se instalen las librerías necesarias para que el generador estático de contenidos Jekyll pueda funcionar:

![]({{ site.baseurl }}/assets/images/codespaces-bundle-install.png)

A continuación ponemos a correr el servidor `jekyll` en el contenedor creado. Para ello escribimos en la terminal:

```
bundle exec jekyll build
```

o bien aprovechar que dicho comando a sido como abreviado como tarea en el fichero `Rakefile`:

```
rake serve
```

Se nos abre una ventana emergente `Open in Browser`:

![]({{ site.baseurl }}/assets/images/codespaces-rake-serve.png)

El servidor web ha arrancado y esta a la escucha de las peticiones.

Hacemos click en `Open in Browser` y abrimos una nueva pestaña en la que visitamos la página web servida. 
Veremos algo similar a esto:

![]({{ site.baseurl }}/assets/images/codespaces-deployed.png)

¡Nuestra página web esta funcionando!

Si no hubieramos tenido ya instalado `bundler` podríamos haber hecho:

```
gem install bundler jekyll
bundle update
bundle exec jekyll serve
```

### Como Configurar un Repo para usar Jekyll en CodeSpaces

Ver el vídeo [GitHub Codespaces with GitHub Pages](https://youtu.be/8KwoKgYz85k) por 
Jon Gallant

{% include video-youtube.html %}

