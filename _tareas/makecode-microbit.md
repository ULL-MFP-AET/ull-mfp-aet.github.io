---
title: "MakeCode"
permalink: /practicas/makecode/
date: 0000/03/04
key: makecode
layout: default
classroom: 
name: MakeCode
website: true
toc: false
foro: https://github.com/orgs/ULL-MFP-AET-2223/discussions
hide: true
rubrica:
  - "Se ha aprendido a usar Makecode"
  - "Ha hecho una asignación con GitHub Classroom en la que el editor asociado es MakeCode Arcade"
  - "Ha entregado el .zip en el campus"
video: "8KwoKgYz85k"
---


# {{ page.title}}

## Objetivos

En esta tarea vamos a
- Aprender a usar [MakeCode](https://arcade.makecode.com/) arcade, un entorno de programación visual que permite desarrollar un videojuego usando un lenguaje de bloques (o en Python o JavaScript/TypeScript) para ejecutarlo en una consola virtual o descargarlo en diferentes dispositivos.
- Aprender,  a hacer una nueva asignación en GitHub Classroom ([chase-the-pizza](https://arcade.makecode.com/tutorials/chase-the-pizza)) que deberá hacer  en la que el editor asociado será MakeCode Arcade en la organización y classroom que creó en prácticas anteriores. 
- Deberá como alumno de los otros compañeros/profesores del equipo realizar la asignación `chase-the-pizza`.
- En el repo de esta asignación deberá subir un fichero `README.md` con las enlaces a la asiganción, el repo template, y los repos de los alumnos.

## Piensa Computacionalmente. Programación con Arcade MakeCode

{% include youtubePlayer.html id="k0GVfAtmUmM" %}

En esta píldora, [Rafael Herrero Álvarez](https://rafaherrero.github.io/) del [Aula Cultural de Pensamiento Computacional](https://sites.google.com/a/ull.edu.es/pensamiento-computacional/) de la Universidad de La Laguna (ULL), nos enseña como usar [Arcade MakeCode](https://arcade.makecode.com/) para desarrollar nuestro videojuego y ejecutarlo en una videoconsola virtual o cargar el programa en diferentes placas de desarrollo como la [Adafruit](https://learn.adafruit.com/). 

Además, [Arcade Makecode](https://arcade.makecode.com/) permite trabajar con repositorios alojados en la plataforma GitHub, por lo que siempre estará el trabajo sincronizado. Al crear un nuevo proyecto, [Arcade MakeCode](https://arcade.makecode.com/) nos muestra diferentes opciones de ejercicios que se pueden completar para entrenar habilidades de programación. También hay tutoriales y ejemplos de proyectos que se pueden ejecutar. 

- Para comenzar, Herrero accede al tutorial de [Chase the pizza](https://arcade.makecode.com/tutorials/chase-the-pizza) y 
  selecciona la opción bloques. 
- Aparece un vídeo que explica el objetivo del juego, similar al de la serpiente, donde un objeto tiene que desplazarse para atrapar otro. 
- Además, dispone de un cronómetro y de un contador de puntos. 
- Una vez que el juego sea totalmente funcional, se pueden agregar muchas más funciones 

## Programación con Arcade MakeCode (2)

Esta es la parte 1 de la colección de vídeos [How to create a video game with MakeCode Arcade](https://youtube.com/playlist?list=PLMMBk9hE-SeoU2gS3trU9gRKbX0hX8p7O&si=JDeC4nLvfDoaUX3K) with MakeCode Arcade

{% include youtubePlayer.html id="9bSX9Q5aP6E" %}


## GitHub Classroom and MakeCode Arcade

En este vídeo [GitHub Classroom and MakeCode Arcade](https://youtu.be/XQ9TU9R-Gw0?si=VW7sp02TPk2mR2mK), Arelia Jones y Jacqueline Russell muestran como utilizar GitHub Classroom para crear una asignación que use como entorno de desarrollo MakeCode Arcade.

{% include youtubePlayer.html id="XQ9TU9R-Gw0" %}

Comienza Jacqueline Russell explicando que MakeCode Arcade es un entorno de desarrollo para crear videojuegos. Luego Arelia Jones (5:47) repasa que es GitHub Classroom, como se crea una organización, como actualizarla para obtener el "Teams Plan" de forma gratuita, como crear una asignación con GH Classroom, como asociar  un roster, añadir un repo template, etc.  y como asignarle MakeCode Arcade como editor, dándole también permisos a MakeCode para que pueda acceder a la organización del GH Classroom. La asignación es configurada con [Leave feedback with pull requests](https://docs.github.com/en/education/manage-coursework-with-github-classroom/teach-with-github-classroom/leave-feedback-with-pull-requests) (min. [23](https://www.youtube.com/watch?v=XQ9TU9R-Gw0&t=1382s)). También muestra como un estudiante acepta la asignación, se identifica contra el roster  y progresa en la tarea empujando sus cambios a GitHub y como el profesor (28:53) puede ver el progreso de los estudiantes usando el botón `review` para ver los pull requests creados en la rama `feedback` y como haciendo click en el botón `View IDE` puede abrir MakeCode Arcade en el proyecto del alumno.
En (20:59) crea una asignación de grupo.


* <https://arcade.makecode.com/>
* [Jacqueline Russell en GitHub](https://github.com/Jaqster) Tiene muchos repositorios de MakeCode, microbit, etc. Por ejemplo <https://github.com/Jaqster/csta-2021>
* [Arelia Jones en GitHub](https://github.com/arelia)
* Microsoft MakeCode is based on the open source project Microsoft Programming Experience Toolkit (PXT): <https://github.com/microsoft/pxt>. [You can install it on your machine](https://github.com/microsoft/pxt#build)

## BBC Micro:bit

La Dra. Gara Miranda Valladares del [Aula Cultural de Pensamiento Computacional](https://sites.google.com/a/ull.edu.es/pensamiento-computacional/) la Universidad de La Laguna nos enseña como se puede programar  utilizando BBC micro:bit.

BBC micro:bit es una pequeña tarjeta programable que ha sido diseñada para aprender a programar de forma gradual y divertida. Esta tarjeta está compuesta por un hardware y software de código abierto.

La parte hardware es una placa que dispone de una pantalla constituida por 25 luces led, aparte de disponer de varios botones y sensores, junto con dispositivos de entrada y salida que nos permite programar nuestro entorno.

El software se encarga de indicarle al micro:bit lo que debe hacer exactamente en cada momento. Para ello, debemos de escribir un programa con las indicaciones que debe seguir el dispositivo. Hacemos uso de Microsoft makecode, entorno de programación gráfico que nos ayuda a definir las instrucciones que le damos al dispositivo a través de lenguaje de programación visual basado en bloques. Otras alternativas para programar y escribir el lenguaje de programación son JavaScript, Python o Scratch.

Para poder desarrollar un proyecto con micro:bit debemos seguir una serie de pasos. El primer paso es escribir el programa, aquí  se eligen los objetivos que queremos alcanzar, lo que nos lleva a crear el código necesario para llevar a conseguirlo. El segundo paso es transferir el programa al dispositivo. Finalmente en el tercer paso ejecutamos el programa para poder conseguir el objetivo que perseguimos.

{% include youtubePlayer.html id="0dEM3qEHZ4A" %}


## Entrega

Deja en el fichero `README.md` de este repositorio 

* Evidencias de los requisitos solicitados en la rúbrica 

## References

- [How to make a 2d game](https://www.youtube.com/playlist?list=PLMMBk9hE-SepfPK6z19t6aAfwbOQNY6K7) with MakeCode Arcade (Video collection)
- Vea los ejercicios en la sección [Concepts](https://arcade.makecode.com/concepts) de la documentación de MakeCode.
- Le será de utilidad la [Documentación de arcade makedocs](https://arcade.makecode.com/docs) y en particular la sección [Blocks](https://arcade.makecode.com/blocks).
* [MakeCode](https://arcade.makecode.com/)
* Sección [Blocks](https://arcade.makecode.com/blocks) de la documentación.
* GitHub with MakeCode: Getting Started

{% include youtubePlayer.html id="J-pI1sEWPV0" %}

* Programación con Javascript y MakeCode Arcade. Programa tu primer videojuego. 2022. 

{% include youtubePlayer.html id="u3GVIjvyJiU" %}


## Rúbrica

{% include rubrica.md %}

## Actividad de los Alumnos para {{ page.key }}

<a href="{{ site.baseurl }}/assets/tareas/{{ page.key }}/activity.html" target="_blank">Medidas de Actividad de los Alumnos para {{ page.key }}</a>
