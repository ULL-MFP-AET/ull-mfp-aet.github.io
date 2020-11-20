En tu repl.it, el remoto git sigue apuntando al  repo que creaste en su momento:

```
GNU bash, version 4.4.20(1)-release (x86_64-pc-linux-gnu)
$ git remote -v
origin  https://github.com/ULL-MFP-AET-2021/JekyllBlog-mrguezl (fetch)
origin  https://github.com/ULL-MFP-AET-2021/JekyllBlog-mrguezl (push)
```
Configuramos nuestra identidad `git` en la máquina virtual de repl.it con estos comandos:

```
git config  user.email mariarguezleon@gmail.com
git config  user.name mrguezl
```

Nos situamos en el directorio `site`:

```
$ cd site
```

Y creamos un nuevo repo local con el comando `git init`:

```
$ git init .
Initialized empty Git repository in /home/runner/p04-t0-aprender-jekyll-no-aceptado/site/.git/
```

En el directorio `site` editamos un fichero con nombre [.gitignore](https://swcarpentry.github.io/git-novice-es/06-ignore/). En este fichero listamos aquellos ficheros y directorios que queremos que no estén bajo el control de versiones. Algo similar a esto:

```
$ cat .gitignore
_site
.DS_Store
.jekyll
.jekyll-metadata
.bundle
.sass-cache
.jekyll-cache*
```

Le indicamos a git que ponga todos los ficheros bajo el control de versiones del nuevo repo con `git add .`:

```
$ git add .
```

El punto `.` es un sinónimo de *directorio actual*.
Esto añadirá todos los cambios ocurridos en todos los ficheros en el directorio actual salvo los que fueron especificados en el `.gitignore`.

A continuación confirmamos los cambios en el repo con un `git commit`

```
$ git commit -am 'creating a repo inside site and linking it with the remote assignment repo'
...
create mode 100644 style.scss
```

Ahora hacemos que este repo local tenga como remoto el repo GitHub de entrega de la tarea [p4-t0-aprender-jekyll]({{site,baseurl}}/tema0-introduccion/practicas/p04-t0-aprender-jekyll/)

```
$ git remote add origin https://github.com/ULL-MFP-AET-2021/p04-t0-aprender-jekyll-mrguezl.git
```

Cuando hagamos el `push` git preguntará por el usuario y la clave en el remoto.
Para evitar que este preguntando a menudo por el usuario y la password 
de GitHub podemos decirle que los almacene con este comando:

```
git config credential.helper store
```

Empujamos los contenidos del directorio `site` en el repo de entrega de la práctica con `git push -u --force origin master:main`

```
$ git push -u --force origin master:main
Username for 'https://github.com': mrguezl
Password for 'https://mrguezl@github.com': 
Counting objects: 54, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (50/50), done.
Writing objects: 100% (54/54), 1.17 MiB | 2.05 MiB/s, done.
Total 54 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2), done.
To https://github.com/ULL-MFP-AET-2021/p04-t0-aprender-jekyll-mrguezl.git
 + c948d4f...c1fe9a0 master -> main (forced update)
Branch 'master' set up to track remote branch 'main' from 'origin'.
$ 
```

* La opción `--force` en `git push` es un poco peligrosa. Fuerza a que, cualquiera que fuera la historia previa del repo remoto nuestros cambios se impongan y sean llevados al mismo.
* `master:main` de esta forma le indicamos que nuestra rama local `master` debe ser copiada en la rama del epo remoto con nombre `main`
* La opción `-u` o `--set-upstream` hace en este caso que se vincule la rama empujada `master` del repo local con la rama `main` remoto `origin`. Los subsiguientes `git push` no tendrán que especificar las ramas implicadas  

Si nos vamos al repo de la entrega en github deberíamos ver algo como esto:

![]({{site.baseurl}}/assets/images/github-repo-after-push.png)


A continuación activamos GitHub Pages del Repo (elegimos la rama `main` y la raíz del proyecto)

![]({{site.baseurl}}/assets/images/activate-github-pages.png)

**Compruebe el buen funcionamiento. ¿Se ve mal? ¿funcionan bien los enlaces?**
Si algo va mal en este punto, recuerde abrir la cóonsola en las herramientas del desarrollador para ver los mensajes de error (En la página de despliegue, botón derecho -> inspect).

![]({{site.baseurl}}/assets/images/github-deployed-page.png)

Recordemos poner el enlace al despliegue en la sección de descripción del repo

En el `README.md`:

Añadimos un enlace al replit

Recuerde compartir el replit con el profesor (crguezl) y poner un enlace al mismo en el README.md

