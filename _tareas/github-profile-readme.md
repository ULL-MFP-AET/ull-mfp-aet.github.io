---
layout: default
title: Creando Perfiles, Organizaciones, Aulas y Asignaciones
permalink: /practicas/creando-un-perfil
classroom: https://classroom.github.com/a/mgV_maOt
name: Managing your profile README
date: 0000/03/01
toc: true
equipos: https://campusdoctoradoyposgrado2223.ull.es/mod/page/view.php?id=839
foro: https://github.com/orgs/ULL-MFP-AET-2223/discussions
rubrica:
  - Aún sin publicar
---

# {{ page.title }}

## Objetivos

1. Aprender a crear un repo de perfil de un usuario en GitHub
2. Conocer con mas profundidad como aprender a crear y configurar
    1. Una organización para una asignatura que vas a impartir, 
    2. Su correspondiente aula GitHub Classroom,
    3. Como cuando seas profesor puedes solicitar los descuentos del programa "Global Campus" y actualizar tus organizaciones 
    4. Aprender a crear un repo de perfil de una organización en GitHub
3. Que es [GitHub Classroom](https://classroom.github.com) desde la perspectiva del profesor 
   1. Aprenderemos a crear una asignación Individual GHC
   2. Aprenderemos a crear una asignación de grupo GHC

## Crea tu repo profile

Siguiendo las instrucciones en la documentación de GitHub [Managing your profile README](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-github-profile/customizing-your-profile/managing-your-profile-readme) añade un README a tu perfil de GitHub para que otras personas sepan sobre ti.

GitHub muestra el README de tu perfil al inicio de tu página de perfil.

Tú decides qué información incluir en el README de tu perfil. Reutiliza el material creado en la práctica anterior.

Puedes encontrar ejemplos curiosos de *repos profile* en esta referencia:

* [abhisheknaiidu/awesome-github-profile-readme](https://github.com/abhisheknaiidu/awesome-github-profile-readme)
* La misma información pero en [la web](https://zzetao.github.io/awesome-github-profile/) asociada
* [articles about how to write a profile readme](https://github.com/abhisheknaiidu/awesome-github-profile-readme#articles). 

## Crea una Organización y un repo Profile para la misma

En este paso deberás crear ahora 

1. una organización para una asignatura que quieres impartir 
   * El nombre de la organización debe ser `ull-mfp-aet-2223-aluXXXX-siglas` donde `aluXXXX` es tu identificador ULL y `siglas` son las siglas de tu asignatura.  Si sale muy largo suprime las siglas
   * Invita a [crguezl](https://github.com/crguezl) como **owner** de la organización
   * Vaya a settings y configure la org. Añádale una profile picture y actualize también su profile picture personal
   * Recuerda poner el enlace a tu organización en el informe de esta práctica
2. añáde a la organización su repo de perfil/Profile describiendo a los alumnos la asignatura y cuales son los primeros pasos que deben dar para empezar a trabajar en la asignatura 

Los siguientes recursos te ayudarán a realizar estas tareas:

* [Crear una organización nueva desde cero](https://docs.github.com/es/organizations/collaborating-with-groups-in-organizations/creating-a-new-organization-from-scratch)
* [Personalizar el perfil de tu organización](https://docs.github.com/es/organizations/collaborating-with-groups-in-organizations/customizing-your-organizations-profile) 
 

## Crea un Classroom para la Organización

Crea un aula usando GitHub Classroom y la asocias a la organización creada en el apartado anterior. 
Si GHC  te provee varias aulas quédate sólo con una. 
Renombra el aula para que su nombre coincida con el de la organización.

**Invita a [crguezl](https://github.com/crguezl) como profesor asociado**.

Para poder llevar a cabo la tarea de crear un classroom y hacer las asignaciones deberás leer con detenimiento la sección [GitHub Classroom para Profesores]({{ site.baseurl}}/pages/github-classroom.html) de estos apuntes 

También te será de utilidad la documentación de GH en [Enseña con GitHub Classroom](https://docs.github.com/es/education/manage-coursework-with-github-classroom/teach-with-github-classroom). Aprende cómo configurar tu aula y tus tareas (cambia el idioma a inglés si eres eficiente en ese idioma).

## Crea asignaciones para tus estudiantes

Crea una asignación de grupo GHC para tu clase

* Configurala como una asignación de grupo con un sólo miembro por grupo como la primera que has hecho en este curso. 
* Usa la técnica descrita en la sección [Segunda Solución: Asignaciones de Grupos]({{ site.baseurl}}/pages/github-classroom.html#segunda-soluci%C3%B3n-asignaciones-de-grupos) y dale las instrucciones correspondientes a tus [alumnos]({{ page.equipos}}).
* Crea un repo de template para la asignación con las instrucciones y ejemplos para la tarea. Usa dicho template para la asignación
* Enviale el enlace a tus compañeros de [equipo]({{ page.equipos}})
* Documenta lo que has hecho en el fichero `README.md`  de tu repo de entrega de la práctica
  
## Acepta tus asignaciones como estudiante

Acepta las asignaciones que te han hecho tus profesores compañeros de equipo y procede a la entrega realizando un [issue]() mencionando al correspondiente profesor.

## Como profesor evalúa a tus estudiantes

Responde a las incidencias generadas por tus alumnos indicándoles si la tarea está bien hecha y cerrando la incidencia o indicándoles que deben corregir la tarea y volver a enviar una incidencia para su aprobación.

## Si eres profesor actualiza la organización para que se beneficie de los descuentos

Deberás, si no lo hiciste en la [tarea inicial]({{ site.baseurl }}/registrarse-en-github), beneficiarte de los descuentos que ofrece GitHub para lo que **deberás verificar tu condición de empleo académico** y una vez seas aceptado en el [programa *"Global Campus"*](https://docs.github.com/en/education/explore-the-benefits-of-teaching-and-learning-with-github-education/use-github-at-your-educational-institution/about-github-campus-program), podrás solicitar hojas de atajos, guías, pegatinas, etc. para tus estudiantes. Busca la sección de descuentos en la página [https://education.github.com](https://education.github.com/discount_requests/teacher_application)

Una vez que estás en el [programa *"Global Campus"*](https://docs.github.com/en/education/explore-the-benefits-of-teaching-and-learning-with-github-education/use-github-at-your-educational-institution/about-github-campus-program) podrás acogerte a los beneficios que ofrece GitHub a los educadores. 

Uno de estos es que tus organizaciones podrán tener privilegios especiales (repositorios y equipos privados, acceso al [editor en la nube CodeSpace](https://docs.github.com/es/codespaces/getting-started/quickstart), a la IA GitHub Copilot, etc.).  Aquí (si estás autenticado y dado de alta) encontrarás el boton de *Upgrade to GitHub Team* para que tus organizaciones se acojan a los beneficios: [GitHub Education: teacher's page](https://education.github.com/globalcampus/teacher). 

Los pasos iniciales que debes dar para obtener los descuentos y crear un aula para los alumnos en un curso usando GitHub Classroom los encontrarás resumidos en la sección [Inicio rápido para GitHub Educators](https://docs.github.com/es/education/quickstart) (La versión en inglés está aquí: [Quickstart for GitHub Educators
](https://docs.github.com/en/education/quickstart)). 

Crea  y configura una primera tarea asignación de grupo en GitHub Classroom para tus estudiantes. Publica el enlace con en tu LMS para que tus  estudiantes tengan acceso a la asignación. Acompañala de las instrucciones necesarias para su realización.



## Aprendiendo a usar un Foro de una Organización

Deberás leer el artículo [GitHub in the Classroom: Lessons Learnt]({{ site.baseurl}}/assets/pdfs/github-in-the-classroom-lessons-learnt.pdf) por Yu-Cheng Tu, Valerio Terragni, Ewan Tempero, Asma Shakil,
Andrew Meads, Nasser Giacaman, Allan Fowler, Kelly Blincoe. University of Auckland, [The Australasian Computing Education Conference](https://aceconference.wordpress.com/previous-conferences/), February 14–18, 2022, Virtual Event, Australia.

En el [foro de la organización de AET]({{ page.foro}}) dentro de la categoría **Q&A**

* o bien añades alguna pregunta sobre algo que no hayas entendido 
* o bien contestas la pregunta de otro alumno 
* o bien añades un breve resumen comentando tu opinión sobre el artículo

## Entrega

En el repo de entrega de esta tarea en esta organización dejas:

1. Enlaces a tu página de profile y al correspondiente repo. Puedes encontrar ejemplos de entregas para una práctica similar de los alumnos de la asignatura [Aprendizaje y Enseñanza de La Tecnología del curso 21/22 aquí](https://github.com/orgs/ULL-MFP-AET-2122/repositories?q=profile-readme&type=all&language=&sort=)
2. Enlace a la organización creada y al classroom de tu asignatura


## Referencias


{% include github-education-references.md %}


* [Mastering (GitHub) Markdown](https://guides.github.com/features/mastering-markdown/#examples)
* [Documentación GitHub sobre la Interfaz Web]({{site.baseurl}}/pages/documentacion-github-interfaz-web)
* [Edición en la nube]({{site.baseurl}}/pages/gitpod)
* [GitHub Glossary](https://docs.github.com/en/free-pro-team@latest/github/getting-started-with-github/github-glossary)
* [Apuntes del curso Elaboración de Material Docente con GitBook](https://casianorodriguezleon.gitbooks.io/elaboracion-de-material-docente-con-gitbook/content/)

