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
  - "Se ha hecho un roster para su clase"
  - "Se ha configurado la asignación con *Leave feedback with pull requests*"
  - "Se ha hecho la asignación `chase-the-pizza` para los otras clases"
  - "Ha entregado el .zip en el campus"
video: "8KwoKgYz85k"
toc: true
---


# {{ page.title}}

## Objetivos

En esta tarea vamos a
- Aprender a usar [MakeCode](https://arcade.makecode.com/) arcade, un entorno de programación visual que puede ser útil en la introducción del pensamiento computacional y la digitalización en la enseñanza secundaria. Arcade Makecode permite desarrollar un videojuego usando un lenguaje de bloques (o en Python o JavaScript/TypeScript) para ejecutarlo luego en una consola virtual o descargarlo en diferentes dispositivos.
- Familiarizarnos con el concepto de "Pensamiento Computacional" y  con como la LOMLOE implanta los contenidos de Ciencias de la Computación en la enseñanza secundaria.
- Aprender,  a hacer una nueva asignación en GitHub Classroom ([chase-the-pizza](https://arcade.makecode.com/tutorials/chase-the-pizza)) que tenga como editor asociado MakeCode Arcade. Deberá hacerlo en la organización y classroom que creó en prácticas anteriores. Cree un [roster](https://docs.github.com/en/education/manage-coursework-with-github-classroom/teach-with-github-classroom/manage-classrooms#creating-a-roster-for-your-classroom) para su clase. La asignación debe configurarse con *[Leave feedback with pull requests](https://docs.github.com/en/education/manage-coursework-with-github-classroom/teach-with-github-classroom/leave-feedback-with-pull-requests)*
- Deberá como alumno de los otros compañeros/profesores del equipo realizar la asignación `chase-the-pizza`.
- En el repo de esta asignación deberá subir un fichero `README.md` con las enlaces a la asignación, al repo template, y a  los repos de sus alumnos.

## Las Ciencias de la Computación y el Pensamiento Computacional en la Educación Secundaria

> "... el proceso de pensamiento envuelto en formular un problema y sus soluciones de manera que las soluciones son representadas de una forma en que pueden ser llevadas a un agente de procesamiento de información.".

[Wing (Marzo 2006)](https://www.cs.cmu.edu/~15110-s13/Wing06-ct.pdf) Communications of the ACM. Vol 49. No 3.

La [Ley Orgánica 3/2020, de 29 de diciembre (**LOMLOE**)](https://www.boe.es/buscar/pdf/2020/BOE-A-2020-17264-consolidado.pdf), 
por la que se modifica la
Ley Orgánica 2/2006, de 3 de mayo, de Educación (LOE), ha renovado el ordenamiento
legal que conlleva, entre otras importantes modificaciones, 

1. la implantación de una nueva definición del currículo y sus elementos básicos y 
2. una redistribución de las competencias educativas entre Gobierno y Comunidades Autónomas. 

Concretamente los Reales Decretos: RD 157/2022 y [RD 217/2022](https://www.boe.es/buscar/pdf/2022/BOE-A-2022-4975-consolidado.pdf), por los que se establecen la
ordenación y las enseñanzas mínimas de la Educación Primaria y Secundaria  Obligatoria, respectivamente.

En la **Educación Secundaria Obligatoria** las materias con contenidos de 
Ciencias de la Computación son: **Tecnología y Digitalización](https://educagob.educacionyfp.gob.es/curriculo/curriculo-lomloe/menu-curriculos-basicos/ed-secundaria-obligatoria/materias/tecno-digitali/desarrollo.html)** y **[Digitalización](https://educagob.educacionyfp.gob.es/curriculo/curriculo-lomloe/menu-curriculos-basicos/ed-secundaria-obligatoria/materias/digitalizacion/desarrollo.html)**.

Además, se establece que, en el conjunto de los tres primeros cursos, se debe
cursar alguna materia optativa, cuya oferta debe incluir una materia para el desarrollo de la
competencia digital. La oferta de estas materias optativas será realizada por las
administraciones educativas y puede consultarse desde el portal del sistema educativo
español del Ministerio de Educación y FP.

Véase este [resumen]({{ site.baseurl }}/assets/pdf/ordenacion-enseñanzas-lomloe-canarias.pdf) para algunos detalles sobre la CCAA de Canarias.

### Tecnología y Digitalización 

En al menos uno de los tres cursos (1o a 3o), todo el
alumnado cursará la materia [Tecnología y Digitalización](https://educagob.educacionyfp.gob.es/curriculo/curriculo-lomloe/menu-curriculos-basicos/ed-secundaria-obligatoria/materias/tecno-digitali/desarrollo.html). Sus saberes básicos se organizan en cinco bloques:

1. Proceso de resolución de problemas; 
2. Comunicación y difusión de ideas; 
3. Pensamiento computacional, programación y robótica; 
4. Digitalización del entorno personal de aprendizaje; y 
5. Tecnología sostenible.

### Digitalización 

Materia de opción de 4o curso. La materia de [Digitalización](https://educagob.educacionyfp.gob.es/curriculo/curriculo-lomloe/menu-curriculos-basicos/ed-secundaria-obligatoria/materias/digitalizacion/desarrollo.html) se organiza en cuatro
bloques interrelacionados de saberes básicos: 

1. Dispositivos digitales, sistemas operativos y de comunicación; 
2. Digitalización del entorno personal de aprendizaje;
3. Seguridad y bienestar digital; y 
4. Ciudadanía digital crítica.

### Tecnología e Ingeniería en Bachillerato

Véase [Tecnología e Ingeniería](https://educagob.educacionyfp.gob.es/curriculo/curriculo-lomloe/menu-curriculos-basicos/bachillerato/materias/tecnologia-ingenieria/desarrollo.html) I y II en el [Bachillerato](https://educagob.educacionyfp.gob.es/curriculo/curriculo-lomloe/menu-curriculos-basicos/bachillerato.html).

## Piensa Computacionalmente. Programación con Arcade MakeCode

{% include youtubePlayer.html id="k0GVfAtmUmM" %}

En esta píldora, [Rafael Herrero Álvarez](https://rafaherrero.github.io/) del [Aula Cultural de Pensamiento Computacional](https://sites.google.com/a/ull.edu.es/pensamiento-computacional/) de la Universidad de La Laguna (ULL), nos enseña como usar [Arcade MakeCode](https://arcade.makecode.com/) para desarrollar nuestro videojuego y ejecutarlo en una videoconsola virtual o cargar el programa en diferentes placas de desarrollo como la [Adafruit](https://learn.adafruit.com/). 

Además, [Arcade Makecode](https://arcade.makecode.com/) permite trabajar con repositorios alojados en la plataforma GitHub, por lo que siempre estará el trabajo sincronizado. Al crear un nuevo proyecto, [Arcade MakeCode](https://arcade.makecode.com/) nos muestra diferentes opciones de ejercicios que se pueden completar para entrenar habilidades de programación. También hay tutoriales y ejemplos de proyectos que se pueden ejecutar. 

- Para comenzar, Herrero accede al tutorial de [Chase the pizza](https://arcade.makecode.com/tutorials/chase-the-pizza) y 
  selecciona la opción bloques. 
- Aparece un vídeo que explica el objetivo del juego, similar al de la serpiente, donde un objeto tiene que desplazarse para atrapar otro. 
- Además, dispone de un cronómetro y de un contador de puntos. 
- Una vez que el juego sea totalmente funcional, se pueden agregar muchas más funciones 

## Programación Avanzada con Arcade MakeCode 

Esta es la parte 1 de la colección de vídeos [How to create a video game with MakeCode Arcade](https://youtube.com/playlist?list=PLMMBk9hE-SeoU2gS3trU9gRKbX0hX8p7O&si=JDeC4nLvfDoaUX3K)

{% include youtubePlayer.html id="9bSX9Q5aP6E" %}


- Puedes encontrar la [Segunda parte aquí](https://youtu.be/8DhGcCPfOU4?si=BN1Etk1uKVvIdJfa)
- [Tercera parte](https://youtu.be/CPkC37FzmnU?si=dnzWHH4FY2-dMRcv)
- El juego final después de realizar la tercera parte: <https://makecode.com/_Herf79YRm2tU>
- Handheld devices: https://arcade.makecode.com/hardware
- forum: <https://forum.makecode.com>

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

- [Las Ciencias de la Computación en el sistema educativo: Conceptos y Políticas](https://drive.google.com/file/d/1E4IJ_ROXilyqWjDXNwNUTHyxFnbBxP89/view) por Coromoto León, Carmen Elvira Ramos Domínguez, Pedro A. Toledo. JUTE. 2023.
- [Ordenación de las Enseñanzas LOMLOE Canarias](https://canarias.fe.ccoo.es/0b18b74e01901c629d90fc0ce17715e8000063.pdf) en <https://canarias.fe.ccoo.es/> 11/04/2022
- [Pensamiento computacional en todas las etapas no universitarias: análisis de la LOMLOE](https://programamos.es/pensamiento-computacional-en-todas-las-etapas-no-universitarias-analisis-de-la-lomloe/). Jesús Moreno León. 2021.
- [Educación Secundaria Obligatoria](https://educagob.educacionyfp.gob.es/ensenanzas/secundaria.html)
  - [Canarias](https://www.gobiernodecanarias.org/educacion/web/secundaria/)
- [Bachillerato](https://educagob.educacionyfp.gob.es/ensenanzas/bachillerato.html)
  - [Canarias](https://www.gobiernodecanarias.org/educacion/web/bachillerato/)
- [Ciclos Formativos de Grado Básico](https://www.todofp.es/que-estudiar/ciclos/fp-grado-basico.html)
- [Ciclos Formativos de Grado Superior](https://www.todofp.es/que-estudiar/ciclos/grado-superior.html)
- [How to make a 2d game](https://www.youtube.com/playlist?list=PLMMBk9hE-SepfPK6z19t6aAfwbOQNY6K7) with MakeCode Arcade (Video collection)
- Vea los ejercicios en la sección [Concepts](https://arcade.makecode.com/concepts) de la documentación de MakeCode.
- Le será de utilidad la [Documentación de arcade makedocs](https://arcade.makecode.com/docs) y en particular la sección [Blocks](https://arcade.makecode.com/blocks).
* [MakeCode](https://arcade.makecode.com/)
* Sección [Blocks](https://arcade.makecode.com/blocks) de la documentación.
<!-- [GitHub with MakeCode: Getting Started](J-pI1sEWPV0)
Programación con Javascript y MakeCode Arcade. Programa tu primer videojuego. 2022. id="u3GVIjvyJiU"
-->

## Rúbrica

{% include rubrica.md %}

## Actividad de los Alumnos para {{ page.key }}

<a href="{{ site.baseurl }}/assets/tareas/{{ page.key }}/activity.html" target="_blank">Medidas de Actividad de los Alumnos para {{ page.key }}</a>
