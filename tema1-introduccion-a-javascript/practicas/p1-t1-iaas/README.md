---
layout: default
title: p1-t1-iaas
formulario: https://campusvirtual.ull.es/1920/mod/assign/view.php?id=187733
permalink: /tema1-introduccion-a-javascript/practicas/p1-t1-iaas/index.html
next:
  url: /tema1-introduccion-a-javascript/practicas/p2-t1-vscode/
previous: 
  url: /tema0-introduccion-a-pl/practicas/p0-t0-esprima-logging
---

# Descripción de la Práctica p1-t1-iaas

* Realice el tutorial [Introduction to Node with Express](https://lab.github.com/everydeveloper/introduction-to-node-with-express) de GitHub Learning Lab
* Siguiendo las instrucciones en el  [repositorio SYTW/iaas-ull-es](https://github.com/SYTW/iaas-ull-es) despliegue un ejemplo como el que aparece en [crguezl/express-start](https://github.com/crguezl/express-start) en su máquina virtual del servicio [iaas.ull.es](https://iaas.ull.es).
* Puede encontrar un vídeo del profesor introduciendo el [iaas.ull.es aquí](https://youtu.be/qKHgbV0lYbA).
    - [![iaas.ull.es](http://i3.ytimg.com/vi/qKHgbV0lYbA/hqdefault.jpg)](https://youtu.be/qKHgbV0lYbA)
* Añada en el `README.md` un pequeño tutorial de como usar y desplegar una aplicación web en [iaas.ull.es](https://iaas.ull.es).
  - Haga capturas de pantalla que muestren que su máquina esta bien configurada y funcionando
* La IP dinámica de su máquina virtual no debería cambiar si no la apaga. Publique la URL de despliegue en su máquina
* Prepare la máquina para poder trabajar:
  - Opcional: Instale [linuxbrew](http://linuxbrew.sh/)
  - Instale git si es necesario
  - [Configura git](https://git-scm.com/book/es/v1/Empezando-Configurando-Git-por-primera-vez)
  - Procure que la rama actual aparezca en el prompt de la terminal. 
     - Puede usar [git prompt](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
     - Puede añadir algo como esto a su PS1: `PS1="\$(git branch 2>/dev/null | sed -n 's/\* \(.*\)/\1 /p')$ "`
     - Yo tengo algo parecido a esto: 
       ```bash
       PS1='\[\033]0;\u@\h:\w\007\]\[\033[0;34m\][\[\033[0;31m\]\w\[\033[0;32m\]($(git branch 2>/dev/null | sed -n "s/\* \(.*\)/\1/p"))\[\033[0;34m\]]$'
        ``` 
        que se ve así: `[~/campus-virtual/books-shared(master)]$`
     - Recuerde que si su prompt es muy largo siempre puede acortarlo con `PROMPT_DIRTRIM=1`
  - [git aliases](https://git-scm.com/book/tr/v2/Git-Basics-Git-Aliases)
   - Instale [nvm](https://github.com/creationix/nvm)
  - Instale nodeJS usando nvm
  - [jshint](http://jshint.com/install/) y [jshint on vim](https://coderwall.com/p/zfhquw/jshint-in-vim)
  - Ideas opcionales:
    - Instale [hub](https://github.com/github/hub)
    - [ghi](https://github.com/stephencelis/ghi) o [gh](https://github.blog/2020-02-12-supercharge-your-command-line-experience-github-cli-is-now-in-beta/)
    - Instale un gestor de versiones de Ruby ([rvm](https://github.com/rvm/ubuntu_rvm) o rbenv)
    - Instale [NERDTree](https://github.com/scrooloose/nerdtree) para vim. The NERDTree is a file system explorer for the Vim editor. Using this plugin, users can visually browse complex directory hierarchies, quickly open files for reading or editing, and perform basic file system operations.
    - Instale [ctags](https://courses.cs.washington.edu/courses/cse451/10au/tutorials/tutorial_ctags.html)
    - [ag](http://conqueringthecommandline.com/book/ack_ag) o [ack](http://conqueringthecommandline.com/book/ack_ag)
    - [Como instalar X11 en las máquinas de iaas.ull.es](https://youtu.be/m2y0gq35Ujc) Vídeo en Youtube
    - etc. 


- Tutorial: [Express Web Framework (Node.js/JavaScript)](https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs) (Mozilla)

<!--
### GitHub Classroom: Outside Colaborators and members

* Una vez acepte la tarea en GitHub Classroom, pasará a ser *outside collaborator* de la organización de la asignatura,
* (Aún por decidir) En algun momento, el profesor le hará una invitación a ser miembro de pleno derecho de la organización
    - [Acepte la invitacion del profesor a pertenecer a la organización Github de la asignatura visitando la página de la organización]({{site.organization.url}})
    - También recibirá un email con la invitación. Puede aceptar haciendo click en el correspondiente enlace

### Formulario

Si no la hecho ya, recuerde cumplimentar el [formulario solicitado]({{page.formulario}}) en la tarea en el Campus Virtual con sus usuarios de GitHub

-->