---
layout: default
title: p02-t0-revision-grupal
permalink: /tema0-introduccion/practicas/p02-t0-revision-grupal/index.html
previous: 
  url: 
next:
  url: 
---

# Revision Grupal (p02-t0-revision-grupal)

## Objetivos

* En esta tarea vamos a estudiar un poco de control de versiones con GitHub. 
* El objetivo de la tarea es realizar una co-evaluación de la tarea [Aprendiendo Markdown]({{site.baseurl}}/tema0-introduccion/practicas/p02-t0-aprender-markdown/index.html) entre los miembros del mismo equipo, valorando lo realizado, resolviendo dudas y emitiendo colaborativamente un informe sobre cada uno de los web sites

## Aceptación de la Tarea

* Usaremos los mismos equipos que en la primera parte de la asignatura ([Grupos Google meet AET1, ..., AET4](https://campusdoctoradoyposgrado.ull.es/mod/page/view.php?id=284636))
* He configurado esta tare en GH Classroom como tarea de equipo. Al aceptar la asignación de esta tarea en GitHub Classroom el proceso es ligeramente diferente que el que ha ocurrido en la aceptación de las tareas individuales
* En Esta Tarea de *Equipo* el primer alumno del equipo que accede al enlace de aceptación crea el *equipo GitHub* y le pone el nombre (*AET1*, *AET2*, ...)
* Los siguientes miembros de ese equipo cuando acceden al enlace de aceptación veran los equipos que ya han sido creados (*AET1*, *AET2*, ...) y eligen la opción de unirse  a su equipo 
* Para cada equipo se crea dentro de la organización un repo `asignatura-curso/nombredelatarea-nombredelequipo` que los alumnos del equipo  deberán usar para entregar la práctica
   * ![]({{site.baseurl}}/assets/images/classroom-equipos.png)


## Colaboración

Los pasos a dar son:

1. Da permisos de **triage** sobre tu repo de la tarea *aprender-markdown* al resto de los miembros del equipo (Ve a *settings* del repo y añádelos)
2. En equipo, pasen a discutir las dificultades, las soluciones, la estética de la web, sugerir mejoras, etc. 
  * Pueden usar las salas de grupo de [Google Meet](https://campusdoctoradoyposgrado.ull.es/mod/page/view.php?id=284636) o bien directamente [Google Chat](https://chat.google.com) para ello. 
  * Deberán crear incidencias en los repos para indicar los fallos y  sugerencias. El propietario del repo deberá cerrarlas cuando las haya resuelto. [Puedes en el commit usar una frase como `fixed issue number`](https://docs.github.com/en/enterprise/2.16/user/github/managing-your-work-on-github/closing-issues-using-keywords) y el commit se cerrará automáticamente
3. En el repo de esta asignación deberan crear en el fichero `README.md` un informe colaborativo sobre la realización de la práctica. Podemos seguir el siguiente flujo de trabajo (workflow):
  1. Se nombra un **coordinador** de equipo
  2. Cada alumno  crea una rama con su nombre o `aluXXX` e introduce en su sección del fichero `README.md` el informe de su práctica (incluyendo al menos un enlace a su repo y a su web desplegada) 
  3. Cada alumno hace un [pull request]() a la rama `main` de su rama solicitando la mezcla con la rama principal 
  4. El coordinador se encarga de acudir a la sección de pull requests y aceptar el request haciendo la mezcla o rechazarla comentando las razones 

