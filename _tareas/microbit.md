---
title: "Micro:bit"
permalink: /practicas/microbit/
date: 0000/03/05
key: microbit
layout: default
classroom: 
name: microbit
website: true
toc: false
foro: https://github.com/orgs/ULL-MFP-AET-2223/discussions
#hide: false
rubrica:
  - "Se ha aprendido a usar Microbit"
  - "Ha hecho una asignación basada en este template con GitHub Classroom en la que el editor asociado es makecode.microbit.org"
  - "Se ha hecho un roster para su clase"
  - "Se ha configurado la asignación con *Leave feedback with pull requests*"
  - "Ha entregado el .zip en el campus"
video: 
toc: true
---


# {{ page.title}}

## Introducción a BBC Micro:bit

La [Dra. Gara Miranda Valladares](https://portalciencia.ull.es/investigadores/81584/detalle) del [Aula Cultural de Pensamiento Computacional](https://sites.google.com/a/ull.edu.es/pensamiento-computacional/) la Universidad de La Laguna nos enseña como se puede programar  utilizando [BBC micro:bit](https://microbit.org/).

[BBC micro:bit](https://microbit.org/) es una pequeña tarjeta programable que ha sido diseñada para aprender a programar de forma gradual y divertida. Esta tarjeta está compuesta por un hardware y software de código abierto.

La parte hardware es una placa que dispone de una pantalla constituida por 25 luces led, aparte de disponer de varios botones y sensores, junto con dispositivos de entrada y salida que nos permite programar nuestro entorno.

![](https://cdn.sanity.io/images/ajwvhvgo/production/4cfb4a0c22aa25164ba6f5f9cb4ae2d53cbf35ba-2577x1068.png?w=653&q=80&fit=max&auto=format)

El software se encarga de indicarle al [micro:bit](https://microbit.org/) lo que debe hacer exactamente en cada momento. Para ello, debemos de escribir un programa con las indicaciones que debe seguir el dispositivo. Hacemos uso de <https://makecode.microbit.org/>, un entorno de programación gráfico en la nube que nos ayuda a definir las instrucciones que le damos al dispositivo a través de lenguaje de programación visual basado en bloques. Otras alternativas para programar y escribir el lenguaje de programación son JavaScript, Python o Scratch.


{% include youtubePlayer.html id="0dEM3qEHZ4A" %}

Para poder desarrollar un proyecto con micro:bit debemos seguir una serie de pasos. El primer paso es escribir el programa en el editor que se encuentra en <https://makecode.microbit.org/>, aquí  se eligen los objetivos que queremos alcanzar, lo que nos lleva a crear el código necesario para llevar a conseguirlo. El segundo paso es transferir el programa al dispositivo. Finalmente en el tercer paso ejecutamos el programa para poder conseguir el objetivo que perseguimos.

## micro:bit classroom

Véase:

* <https://microbit.org/teach/teaching-tools/>

Usando <https://classroom.microbit.org/> el profesor puede:

- Editar el código que ven los estudiantes 
- Enviar código desde su espacio de codificación o el de cualquiera de los estudiantes a uno o más estudiantes. Esto sobrescribirá el código que ya tienen.
- Probar el código en el simulador o descargarlo a su micro:bit

{% include youtubePlayer.html id="QD8kpuSC0Vc?si=3tC0O9rjHtPk-Eyk" %}


## Ejemplos: Step Counter

Turn your BBC micro:bit into a step counter (or pedometer) to help you track how active you are - and learn some coding at the same time!

* [Step Counter project](https://microbit.org/projects/make-it-code-it/step-counter/)
* [Sensitive Step Counter](https://microbit.org/projects/make-it-code-it/sensitive-step-counter/)
* [Low energy step counter](https://microbit.org/projects/make-it-code-it/sensitive-step-counter/)


## Entrega

En la organización y el classroom creados en prácticas anteriores 

1. Cree una nueva asignación partiendo de este template [ULL-MFP-AET/microbit-template](https://github.com/ULL-MFP-AET/microbit-template).
2. No asigne editor e indique en las instrucciones como usar <makecode.microbit.org>. 

Deja en el fichero `README.md` de este repositorio enlaces a 

1. Su organización, 
2. su classroom, 
3. a la asignación creada en GitHub Classroom 

Deje evidencias de los requisitos solicitados en la rúbrica 

## References



* [Micro:bit Makecode editor](https://makecode.microbit.org/)
* [Micro:bit Classroom](https://classroom.microbit.org/) Manage whole class micro:bit coding sessions. [Youtube introductory video](https://youtu.be/QD8kpuSC0Vc?si=-bRF3my_S9IiTMCw). It makes it quick and easy for teachers to share code with students, track their progress, help them debug, and save their progress.
* [Behind the MakeCode Hardware - LEDs on micro:bit](https://youtu.be/qqBmvHD5bCw?si=LerCSQQv2BumHXhT) Youtube video
* Repo [carlosperate/awesome-microbit](https://github.com/carlosperate/awesome-microbit)
* [A 14 week Introduction to Computer Science course](https://makecode.microbit.org/courses/csintro)
* [Manual de Programación Micro:bit]({{ site.baseurl }}/assets/pdfs/manual-de-programacion-microbit.pdf). José Francisco Muñoz. 2019


## Rúbrica

{% include rubrica.md %}

## Actividad de los Alumnos para {{ page.key }}

<a href="{{ site.baseurl }}/assets/tareas/{{ page.key }}/activity.html" target="_blank">Medidas de Actividad de los Alumnos para {{ page.key }}</a>
