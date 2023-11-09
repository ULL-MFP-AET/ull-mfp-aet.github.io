---
title: "MakeCode"
permalink: /practicas/makecode/
date: 0000/03/04
key: makecode-arcade
layout: default
classroom: 
name: MakeCode
website: true
toc: false
foro: https://github.com/orgs/ULL-MFP-AET-2223/discussions
#hide: false
rubrica:
  - "Se ha aprendido a usar Makecode"
  - "Ha hecho una asignación basada en este template con GitHub Classroom en la que el editor asociado es MakeCode Arcade"
  - "Se ha hecho un roster para su clase"
  - "Se ha configurado la asignación con *Leave feedback with pull requests*"
  - "Ha entregado el .zip en el campus"
video: "8KwoKgYz85k"
toc: true
---


# {{ page.title}}

## Objetivos

En esta tarea vamos a
- Aprender a usar [MakeCode](https://arcade.makecode.com/) arcade, un entorno de programación visual que puede ser útil en la introducción del pensamiento computacional y la digitalización en la enseñanza. Arcade Makecode permite desarrollar un videojuego usando un lenguaje de bloques (o en Python o JavaScript/TypeScript) para ejecutarlo luego en una consola virtual o descargarlo en diferentes dispositivos.
- Familiarizarnos con el concepto de "Pensamiento Computacional" y  con como la LOMLOE implanta los contenidos de Ciencias de la Computación en la enseñanza secundaria y bachillerato.
- Aprender,  a hacer una nueva asignación en GitHub Classroom ([chase-the-pizza](https://arcade.makecode.com/tutorials/chase-the-pizza)) que tenga como editor asociado MakeCode Arcade. Deberá hacerlo en la organización y classroom que creó en prácticas anteriores. El repo [ULL-MFP-AET/makecode-template](https://github.com/ULL-MFP-AET/makecode-template) puede serle útil para el  template. Cree un [roster](https://docs.github.com/en/education/manage-coursework-with-github-classroom/teach-with-github-classroom/manage-classrooms#creating-a-roster-for-your-classroom) para su clase. La asignación debe configurarse con *[Leave feedback with pull requests](https://docs.github.com/en/education/manage-coursework-with-github-classroom/teach-with-github-classroom/leave-feedback-with-pull-requests)*
- Deberá como alumno de los otros compañeros/profesores del equipo realizar la asignación `chase-the-pizza`.
- En el repo de esta asignación deberá subir un fichero `README.md` con las enlaces a la asignación, al repo template, y a  los repos de sus alumnos.

## Las Ciencias de la Computación y el Pensamiento Computacional en la Educación Secundaria y el Bachillerato

Una de las competencias clave que se deben desarrollar en la educación es el pensamiento computacional. El pensamiento computacional es un proceso de resolución de problemas que incluye:

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
Ciencias de la Computación son: **[Tecnología y Digitalización](https://educagob.educacionyfp.gob.es/curriculo/curriculo-lomloe/menu-curriculos-basicos/ed-secundaria-obligatoria/materias/tecno-digitali/desarrollo.html)** y **[Digitalización](https://educagob.educacionyfp.gob.es/curriculo/curriculo-lomloe/menu-curriculos-basicos/ed-secundaria-obligatoria/materias/digitalizacion/desarrollo.html)**.

Además, se establece que, en el conjunto de los tres primeros cursos, se debe
cursar alguna materia optativa, cuya oferta debe incluir una materia para el desarrollo de la
competencia digital. 
La oferta de estas materias optativas será realizada por las [administraciones educativas]({{ site.baseurl }}/assets/pdfs/ordenacion-enseñanzas-lomloe-canarias.pdf) y puede consultarse desde 
[el portal del sistema educativo español del Ministerio de Educación y FP](https://educagob.educacionyfp.gob.es/inicio.html).

Véase este [resumen]({{ site.baseurl }}/assets/pdfs/ordenacion-enseñanzas-lomloe-canarias.pdf) anotado de 21 de Marzo de 2023 para algunos detalles sobre la CCAA de Canarias.

### Tecnología y Digitalización 

En al menos uno de los tres cursos (1o a 3o), todo el
alumnado cursará la materia [Tecnología y Digitalización](https://educagob.educacionyfp.gob.es/curriculo/curriculo-lomloe/menu-curriculos-basicos/ed-secundaria-obligatoria/materias/tecno-digitali/desarrollo.html). Véase la adaptación de la [Consejería de Educación Gobierno y Deportes](https://www.gobiernodecanarias.org/cmsweb/export/sites/educacion/web/_galerias/descargas/Secundaria/Ordenacion_curriculo/borrador_curriculo_2022/Tecnologia_digitalizacion_ESO.pdf) del Gobierno de Canarias. Sus saberes básicos se organizan en cinco bloques:

1. Proceso de resolución de problemas; 
2. Comunicación y difusión de ideas; 
3. **Pensamiento computacional**, **programación** y robótica; 
4. Digitalización del entorno personal de aprendizaje; y 
5. Tecnología sostenible.

### Digitalización 

Materia de opción de 4o curso. La materia de [Digitalización](https://educagob.educacionyfp.gob.es/curriculo/curriculo-lomloe/menu-curriculos-basicos/ed-secundaria-obligatoria/materias/digitalizacion/desarrollo.html) 
Véase la adaptación de la [Consejería de Educación Gobierno y Deportes](https://www.gobiernodecanarias.org/cmsweb/export/sites/educacion/web/_galerias/descargas/Secundaria/Ordenacion_curriculo/borrador_curriculo_2022/Digitalizacion_ESO.odt)
del Gobierno de Canarias. Sus saberes básicos se organizan en cuatro bloques:

1. Dispositivos digitales, sistemas operativos y de comunicación; 
2. Digitalización del entorno personal de aprendizaje;
3. Seguridad y bienestar digital; y 
4. Ciudadanía digital crítica.

### Tecnología e Ingeniería en Bachillerato

Véase [Tecnología e Ingeniería](https://educagob.educacionyfp.gob.es/curriculo/curriculo-lomloe/menu-curriculos-basicos/bachillerato/materias/tecnologia-ingenieria/desarrollo.html) I y II en el [Bachillerato](https://educagob.educacionyfp.gob.es/curriculo/curriculo-lomloe/menu-curriculos-basicos/bachillerato.html). Véase la adaptación de la [Consejería de Educación Gobierno y Deportes](https://www.gobiernodecanarias.org/cmsweb/export/sites/educacion/web/_galerias/descargas/bachillerato/curriculo/nuevo_curriculo/decreto30_2023/Tecnologia_e_Ingenieria_BACH.pdf) del Gobierno de Canarias.

La materia se articula en torno a seis bloques:

- Proyectos de investigación y desarrollo
- Materiales y fabricación 
- Sistemas mecánicos 
- Sistemas eléctricos y electrónicos 
- Sistemas informáticos 
- Sistemas automáticos 
- Tecnología sostenible

## Piensa Computacionalmente. Programación con Arcade MakeCode

{% include youtubePlayer.html id="k0GVfAtmUmM" %}

En esta píldora, [Rafael Herrero Álvarez](https://rafaherrero.github.io/) del [Aula Cultural de Pensamiento Computacional](https://sites.google.com/a/ull.edu.es/pensamiento-computacional/) de la Universidad de La Laguna (ULL), nos enseña como usar [Arcade MakeCode](https://arcade.makecode.com/) para desarrollar nuestro videojuego y ejecutarlo en una videoconsola virtual o cargar el programa en diferentes placas de desarrollo como la [Adafruit](https://learn.adafruit.com/). 

Además, [Arcade Makecode](https://arcade.makecode.com/) permite trabajar con repositorios alojados en la plataforma GitHub, por lo que siempre estará el trabajo sincronizado. Al crear un nuevo proyecto, [Arcade MakeCode](https://arcade.makecode.com/) nos muestra diferentes opciones de ejercicios que se pueden completar para entrenar habilidades de programación. También hay tutoriales y ejemplos de proyectos que se pueden ejecutar. 

- Para comenzar, Herrero accede al tutorial de [Chase the pizza](https://arcade.makecode.com/tutorials/chase-the-pizza) y 
  selecciona la opción bloques. 
- Aparece un vídeo que explica el objetivo del juego, similar al de la serpiente, donde un objeto tiene que desplazarse para atrapar otro. 
- Además, dispone de un cronómetro y de un contador de puntos. 
- Una vez que el juego sea totalmente funcional, se pueden agregar muchas más funciones 

## Un ejercicio algo mas complejo

Una posible continuación del ejercicio anterior es el juego de [Jacqueline Russell](https://github.com/Jaqster) en  <https://github.com/ULL-MFP-AET/csta-2021>. Haga un fork del repo en su organización y experimente a cambiarlo.

## Un juego mas Avanzado 

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
* [Arelia Jones en GitHub](https://github.com/arelia)
* Microsoft MakeCode is based on the open source project Microsoft Programming Experience Toolkit (PXT): <https://github.com/microsoft/pxt>. [You can install it on your machine](https://github.com/microsoft/pxt#build)


## Entrega

En la organización y el classroom creados en prácticas anteriores 

1. Cree una nueva asignación partiendo de este template [ULL-MFP-AET/makecode-template](https://github.com/ULL-MFP-AET/makecode-template).
2. Configure como editor de la asignación MakeCode Arcade. 
3. Cree también un roster para su clase. 
4. La asignación debe configurarse con *[Leave feedback with pull requests](https://docs.github.com/en/education/manage-coursework-with-github-classroom/teach-with-github-classroom/leave-feedback-with-pull-requests)*

Deja en el fichero `README.md` de este repositorio enlaces a 

1. Su organización, 
2. su classroom, 
3. a la asignación creada en GitHub Classroom 

Deje evidencias de los requisitos solicitados en la rúbrica 

## References

### El Pensamiento Computacional en la Educación Secundaria y el Bachillerato

- [Las Ciencias de la Computación en el sistema educativo: Conceptos y Políticas](https://drive.google.com/file/d/1E4IJ_ROXilyqWjDXNwNUTHyxFnbBxP89/view) por Coromoto León, Carmen Elvira Ramos Domínguez, Pedro A. Toledo. JUTE. 2023.
- [Ordenación de las Enseñanzas LOMLOE Canarias](https://canarias.fe.ccoo.es/0b18b74e01901c629d90fc0ce17715e8000063.pdf) en <https://www3.gobiernodecanarias.org/medusa/edublog/iescandidomaranteexposito/ordenacion-de-las-ensenanzas-lomloe-canarias/> 21/04/2023. Fernando Concepción.
- [Pensamiento computacional en todas las etapas no universitarias: análisis de la LOMLOE](https://programamos.es/pensamiento-computacional-en-todas-las-etapas-no-universitarias-analisis-de-la-lomloe/). Jesús Moreno León. 2021.
- [Aula Cultural de Pensamiento Computacional](https://sites.google.com/a/ull.edu.es/pensamiento-computacional/) de la Universidad de La Laguna (ULL) 
- Portal del Sistema Educativo Español educagob: [Educación Secundaria Obligatoria](https://educagob.educacionyfp.gob.es/ensenanzas/secundaria.html)
  - [Gobierno de Canarias. Secundaria](https://www.gobiernodecanarias.org/educacion/web/secundaria/)
- Portal del Sistema Educativo Español educagob: [Bachillerato](https://educagob.educacionyfp.gob.es/ensenanzas/bachillerato.html)
  - [Gobierno de Canarias. Bachillerato](https://www.gobiernodecanarias.org/educacion/web/bachillerato/)
- Ministerio de Educación,. TodoFP. [Ciclos Formativos de Grado Básico](https://www.todofp.es/que-estudiar/ciclos/fp-grado-basico.html)
- Ministerio de Educación,. TodoFP. [Ciclos Formativos de Grado Superior](https://www.todofp.es/que-estudiar/ciclos/grado-superior.html)
- [Programas Educativos del Gobierno de Canarias](https://www.gobiernodecanarias.org/educacion/web/programas-redes-educativas/programas-educativos/steam/)
  - [Programa STEAM del Gobierno de Canarias](https://www.gobiernodecanarias.org/educacion/web/programas-redes-educativas/programas-educativos/steam/) 
    - [Proyecto Pensamiento Computacional y Ciencias del Espacio](https://www.gobiernodecanarias.org/educacion/web/programas-redes-educativas/programas-educativos/steam/convocatorias/proyecto-pensamiento-computacional-y-ciencias-del-espacio/index.html)
- [Engaging Primary and Secondary School Students in Computer Science Through Computational Thinking Training](https://ieeexplore.ieee.org/document/9749967) by R. Herrero-Álvarez, G. Miranda, C. León and E. Segredo. IEEE Transactions on Emerging Topics in Computing, vol. 11, no. 1, pp. 56-69, 1 Jan.-March 2023, [doi: 10.1109/TETC.2022.3163650](https://doi.org/10.1109/TETC.2022.3163650).
  
### MakeCode

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
