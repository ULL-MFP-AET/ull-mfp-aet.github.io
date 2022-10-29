---
layout: default
title: aprender-markdown
key: aprender-markdown
myurl: "https://campusdoctoradoyposgrado2223.ull.es/mod/assign/view.php?id=890&forceview=1"
permalink: tema0-introduccion/practicas/aprender-markdown/
name: Aprender Markdown
date: 0000/01/02
toc: true
rubrica:
  - El nombre del equipo creado sigue el formato correcto
  - Ha rellenado el custionario con la relación GitHub/AluXXX
  - "Se incluyen todos los aspectos solicitados en el markdown y se visualizan correctamente"
  - "Se ha aprendido a usar un editor  en la nube y/o en su máquina local"
  - "Ha entregado el enlace al repo en el campus"
---

- [Aprender Markdown (aprender-markdown)](#aprender-markdown-aprender-markdown)
  - [Aceptando la Tarea](#aceptando-la-tarea)
  - [Entrega en el Campus virtual](#entrega-en-el-campus-virtual)
  - [Aprender Markdown](#aprender-markdown)
    - [Matemáticas](#matemáticas)
    - [Diagramas con mermaid](#diagramas-con-mermaid)
    - [Task lists](#task-lists)
  - [Edición en la Nube de Repositorios GitHub](#edición-en-la-nube-de-repositorios-github)
  - [Primeros Pasos con GitHub Classroom](#primeros-pasos-con-github-classroom)
  - [Rúbrica](#rúbrica)
  - [Actividad de los Alumnos para {{ page.key }}](#actividad-de-los-alumnos-para--pagekey-)
  - [Referencias](#referencias)


# Aprender Markdown (aprender-markdown)

## Aceptando la Tarea

Deberás comenzar aceptando la tarea asociada a esta parte haciendo click en el enlace en la [tarea correspondiente del campus]({{ page.myurl}}) con el texto *"acepta la asignación de la tarea"*. 
En cada una de los tareas de esta parte que requieren de la creación de un repositorio de trabajo encontrarás un enlace  similar. 

Esta tarea inicial ha sido configurada por el profesor como una tarea de equipo.
Eso significa que cuando hagan click en la aceptación  de la tarea les saldrá un formulario para elegir el nombre del equipo. En este caso el equipo será individual.

1. Escriba su nombre y apellidos seguido de su ID de la ULL separados por guiones `nombre-apellido1-apellido2-ullid`. 
2. Si su nombre es compuesto como Ana María Laza Pérez, escriba `ana_maria-laza-perez-aluXXXXX` usando un guión bajo.
3. No uses acentos, ni caracteres especiales, sólo las letras del alfabeto US. Cambia la ñ por la secuencia "ny". No uses blancos.
4. Si no tiene segundo apellido o si la aplicación GH Classroom se queja de que el nombre del team es muy largo, simplemente omítalo y escriba `nombre-apellido1-ullid`
5. Si La aplicación se sigue quejando de que el nombre del team es muy largo omita también el primer apellido. 

![]({{site.baseurl}}/assets/images/github-classroom-team-assignment-1.png)

{% include instrucciones-tareas-de-equipo.md %}

Una vez creado el equipo y aceptada la asignación deberá aparecer despues de un momento la URL del repo recién creado.
**Si no aparece, refresque la página en el navegador**. Se habrá creado un repo con una URL como esta

"https://github.com/{{ site.organization.name }}/{{ page.title }}-nombre-apellido1-apellido2-aluXXXX"


## Entrega en el Campus virtual

En la tarea del campus simplemente escribes el enlace al repo de la tarea.

## Aprender Markdown

Para aprender markdown puedes consultar [Mastering (GitHub) Markdown](https://guides.github.com/features/mastering-markdown/#examples)
y  para mas detalles consulta la guía de usuario
<a href="https://docs.github.com/en/free-pro-team@latest/github/writing-on-github/getting-started-with-writing-and-formatting-on-github" target="_blank">Getting started with writing and formatting on GitHub</a>

Acepta la asignación de esta tarea y en el repositorio creado en GitHub edita el fichero `README.md` y rellenalo con un breve e informal CV.

* Incluye alguna imagen 
* Incluye algunos enlaces (por ejemplo un enlace a tu usuario en el campus virtual).
* Incluya alguna lista 
* Una cita favorita (blockquote)
* Un fragmento de código inline de un lenguaje de programación 
* Incluye un trozo de código que ocupe varias líneas como este y asegúrate de que aprece coloreado:

  ```javascript
  function fancyAlert(arg) {
    if(arg) {
      $.facebox({div:'#foo'})
    }
  }
  ```
* Incluye una tabla

  First Header | Second Header
  ------------ | -------------
  Content from cell 1 | Content from cell 2
  Content in the first column | Content in the second column

* Incluye un emoji. Por ejemplo: :+1:
* Añade un fichero `master.md`  (puedes crearlo usando el menu o bien visitando una ruta con la sintáxis `https://github.com/:owner:/:repo:/new/main`) en el que describas tu experiencia hasta ahora en este master y lo enlazas desde el fichero `README.md`.  
  * En el fichero 
`master.md` pon un enlace de vuelta al `README.md`

- Podemos hacer uso del editor que provee la interfaz web de GitHub.
- Pero hay editores alternativos mejores como [el editor web de GitHub  y GitPod]({{site.baseurl}}/pages/gitpod)
- Recuerda hacer "commits" para guardar los cambios.
- En la tarea entrega el enlace al repo con los contenidos de tu trabajo

* Añade una imagen-enlace. Se deberá ver la imagen pero esta será un enlace 
a otra página

### Matemáticas

Añade una fórmula matemática escrita en [\\(\LaTeX\\)](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/writing-mathematical-expressions)

Si escribes una fórmula  matemática en latex y la rodeas de `$$`, el markdown de GH la mostrará como un bloque. Por ejemplo: 

```
**The Cauchy-Schwarz Inequality**

$$\left( \sum_{k=1}^n a_k b_k \right)^2 \leq \left( \sum_{k=1}^n a_k^2 \right) \left( \sum_{k=1}^n b_k^2 \right)$$
```
Se ve:

**The Cauchy-Schwarz Inequality**

$$\left( \sum_{k=1}^n a_k b_k \right)^2 \leq \left( \sum_{k=1}^n a_k^2 \right) \left( \sum_{k=1}^n b_k^2 \right)$$

Para incluir una expresión matemática en línea con su texto, delimite la expresión con un símbolo de dólar `$`. Por ejemplo:

```
This sentence uses `$` delimiters to show math inline:  $\sqrt{3x-1}+(1+x)^2$
```
Se ve como esto:

This sentence uses `$` delimiters to show math inline: \\(\sqrt{3x-1}+(1+x)^2\\)
  
### Diagramas con mermaid

Puedes incluir diagramas en tus documentos usando [mermaid](https://mermaid-js.github.io/mermaid/). Por ejemplo:


    ```mermaid
      graph TD;
          A-->B;
          A-->C;
          B-->D;
          C-->D;
    ```

que se verá como:

![]({{ site.baseurl}}/assets/images/mermaid.png)

### Task lists

Ejemplo:

    - [x] #739
    - [ ] https://github.com/octo-org/octo-repo/issues/740
    - [ ] Add delight to the experience when all tasks are complete :tada:

Se verá así:

- [x] #739
- [ ] https://github.com/octo-org/octo-repo/issues/740
- [ ] Add delight to the experience when all tasks are complete :tada:

Este ejemplo muestra también como escribir un emoji por nombre `:tada:`.

Mas información en [Acerca de las listas de tareas](https://docs.github.com/es/issues/tracking-your-work-with-issues/about-task-lists)

## Edición en la Nube de Repositorios GitHub

Hay múltiples formas de editar en la nube un repositorio GitHub.
en estas [notas]({{site.baseurl}}/pages/gitpod) recogemos estas alternativas:

1. Editar directamente usando el [editor on-line de GitHub](https://docs.github.com/es/repositories/working-with-files/managing-files/editing-files)
2. [Usar el editor GitHub.dev][githubdev]. Véase también las [notas en estos apuntes sobre GitHub.dev][githubdev]. Véase también las [notas en estos apuntes sobre GitHub.dev]({{site.baseurl}}/pages/gitpod#editing-with-githubdev-editor): se activa simplemente  tecleando el punto cuando se está visitando el repo
4. Usar [Codespaces][codespaces] (Probablemente la opción mas recomendable si dispones de este servicio)
3. Usar [GitPod]({{ site.baseurl }}/pages/gitpod#gitpod), una alternativa a [Codespaces][codespaces]

[githubdev]: https://docs.github.com/en/codespaces/the-githubdev-web-based-editor
[codespaces]: /pages/gitpod#codespaces


## Primeros Pasos con GitHub Classroom

GitHub Classroom es una aplicación web para los docentes que proporciona herramientas para la administración de cursos integradas con GitHub. 

Un objetivo de esta lección/tarea es conseguir cierta familiaridad con los conceptos que conlleva Github Classroom: [asignación][assignment], asignación individual, asignación de grupo, [identificación del alumnado][identificacion], *[rosters][rosters]*, etc.

Este video en YouTube "[How to use VS Code to submit an assignment to Github Classroom (initially empty repository)](https://youtu.be/iqW_yzZkU_8)" 

{% include youtubePlayer.html id="iqW_yzZkU_8" %}

muestra como deben hacer los estudiantes para aceptar, trabajar y entregar una tarea asignada con GHC usando el editor VS Code

[rosters]: https://docs.github.com/en/education/manage-coursework-with-github-classroom/get-started-with-github-classroom/glossary#roster
[assignment]: https://docs.github.com/en/education/manage-coursework-with-github-classroom/get-started-with-github-classroom/glossary#assignment
[identificacion]: {{ site.baseurl }}/pages/github-classroom.html#el-problema-de-enlazar-las-cuentas-gh-con-las-cuentas-del-lms

## Rúbrica

{% include rubrica.md -%}

## Actividad de los Alumnos para {{ page.key }}

<a href="{{ site.baseurl }}/assets/tareas/aprender-markdown/activity.html" target="_blank">Medidas de Actividad de los Alumnos para {{ page.key }}</a>

## Referencias

* [Mastering (GitHub) Markdown](https://guides.github.com/features/mastering-markdown/#examples)
* Para mas detalles consulta la guía de usuario
<a href="https://docs.github.com/en/free-pro-team@latest/github/writing-on-github/getting-started-with-writing-and-formatting-on-github" target="_blank">Getting started with writing and formatting on GitHub</a>
* [Use Markdown to display mathematical expressions on GitHub](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/writing-mathematical-expressions)
* [Documentación GitHub sobre la Interfaz Web]({{site.baseurl}}/pages/documentacion-github-interfaz-web)
* [Visual Studio Code in Browsers]({{site.baseurl}}/pages/gitpod)
* [GitHub Glossary](https://docs.github.com/en/free-pro-team@latest/github/getting-started-with-github/github-glossary)

<!--
* [A Simple Guide to GitHub for Non-Developers: How to Speak GitHub](https://unito.io/blog/guide-to-github-for-project-managers/#how-to-speak-github) contiene un glosario de términos
* [A guide to using GitHub for people who don't code and don't want to code.](https://github.com/tvanantwerp/github-for-non-programmers) tvanantwerp/github-for-non-programmers GitBook
-->

* [Apuntes del curso Elaboración de Material Docente con GitBook](https://casianorodriguezleon.gitbooks.io/elaboracion-de-material-docente-con-gitbook/content/)

* Resto de [Referencias]({{site.baseurl}}/references)
