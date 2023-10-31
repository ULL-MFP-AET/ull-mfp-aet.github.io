---
layout: default
title: Extensiones de GitHub Command Line para la Educación
permalink:  /gh-cli
classroom: https://classroom.github.com/a/Plohp5Ra
date: 0000/07/01
toc: true
---

# {{ page.title}}

## Objetivos

* Conocer que es [gh-cli](https://cli.github.com/)
* Aprender a usar algunas extensiones para educación
* Mejorar nuestra eficiencia en procesos de evaluación, retroalimentación al alumnado, detección de plagio, etc. usando `gh` *extensions* 

## Introducción a gh

Véase las notas en [GitHub Command Line Interface]({{ site.baseurl }}/pages/gh)

## Uso de GitHub Classroom con GitHub CLI

Instale la extensión [GitHub Classroom](https://github.com/github/gh-classroom) para `gh`:

```bash
gh extension install github/gh-classroom
```
o actualícela:

```bash
gh extension upgrade classroom
```

Esta es la ayuda:

```
$ gh classroom --help
A GitHub Classroom CLI

Usage:
  classroom [command]

Available Commands:
  accepted-assignments List your student's accepted assignments
  assignment           Show the details of an assignment
  assignment-grades    Download a CSV of grades for an assignment in a classroom
  assignments          Display a list of assignments for a classroom
  clone                Clone starter code or a student's submissions
  completion           Generate the autocompletion script for the specified shell
  help                 Help about any command
  list                 List classrooms
  view                 Show the details of a classroom

Flags:
  -h, --help   help for classroom

Use "classroom [command] --help" for more information about a command.
```

```
$ gh classroom list --help
List of classrooms you own

Usage:
  classroom list [flags]

Aliases:
  list, ls

Examples:
$ gh classroom list --page 1

Flags:
  -h, --help           help for list
      --page int       Page number (default 1)
      --per-page int   Number of classrooms per page (default 30)
      --web            Open the classroom list in a browser
```

Por ejemplo:

```
➜  2122ocw gh classroom list --page 4 | grep 2324
185636  ULL-ESIT-DMSI-2324                             https://classroom.github.com/classrooms/143794118-ull-esit-dmsi-2324
185748  ULL-MII-SYTWS-2324                             https://classroom.github.com/classrooms/144119227-ull-mii-sytws-2324
```

Si queremos clonar los repos de los estudiantes para una asignación debemos usar el comando `gh classroom clone`:

```
practicas-alumnos gh classroom clone student-repos -a 482607      
Creating directory:  /Users/casianorodriguezleon/campus-virtual/2324/dmsi2324/practicas-alumnos/aprender-markdown-submissions
Cloning into: /Users/casianorodriguezleon/campus-virtual/2324/dmsi2324/practicas-alumnos/aprender-markdown-submissions/aprender-markdown-casiano-rodriguez-leon-alu0100291865
...
```

Sin embargo, si se pretende clonar repos de asignaciones por nombre la extensión [gh-cli-for-education/gh-org-clone](https://github.com/gh-cli-for-education/gh-org-clone) es mas adecuada.

Para mas detalles lea [Using GitHub Classroom with GitHub CLI](https://docs.github.com/en/education/manage-coursework-with-github-classroom/teach-with-github-classroom/using-github-classroom-with-github-cli)


## gh-cli en la Enseñanza

La idea del proyecto *gh-cli en la Enseñanza* viene reflejada en el texto en esta publicación en las discussions de Global Campus Teachers:

* [A call for software contributions to extend gh cli with extensions targeted to teachers using github #32](https://github.com/community/Global-Campus-Teachers/discussions/32)

> In August 24 2021 [GitHub Cli](https://github.blog/2021-08-24-github-cli-2-0-includes-extensions/) introduced [gh cli extensions](https://cli.github.com/manual/gh_extension), allowing anyone to make custom commands that build on the core functionality of [GitHub CLI](https://docs.github.com/en/github-cli).

> During the first term of this course 2021/2022 I have been benefitting of [many GitHub Cli extensions written by others](https://github.com/search?q=topic%3Agh-extension&type=Repositories&ref=advsearch&l=&l=) and [sometimes by myself](https://github.com/search?q=topic%3Agh-extension++user%3Acrguezl+user%3Agh-cli-for-education+language%3AJavaScript&type=Repositories&ref=advsearch&l=JavaScript&l=), that assisted me in my daily teaching work managing the associated GitHub Organizations and GitHub classroom assignments.
 
> To foster the writing of gh cli extensions targeted to  teachers I have created a the GitHub Organization called [gh-cli-for-education](https://github.com/gh-cli-for-education). If you are a teacher or a student that uses GitHub, is familiar with GitHub Cli and fell you can help with this goal, please [join the organization! (send me an issue)](https://github.com/gh-cli-for-education/github-cli-discussions/issues/new)  or comment here. 

> Looking forward for people that will be willing to lead the way in this direction

la idea es desarrollar un conjunto de extensiones `gh` que faciliten los tareas de la comunidad educativa que usa GitHub en su día a día.

## Ejemplos de Evaluación Asistida desde la línea de comandos

Reproduzca los ejemplos en la sección [evaluación asistida desde la línea de comandos]({{site.baseurl}}/pages/evaluacion-asistida.html) y elabore un informe con lo aprendido.

## Referencias

{% include references-gh.md %}