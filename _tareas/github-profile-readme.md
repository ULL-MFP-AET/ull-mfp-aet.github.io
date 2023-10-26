---
layout: default
title: Creando Perfiles, Organizaciones, Aulas y Asignaciones
permalink: /practicas/creando-un-perfil
classroom: https://classroom.github.com/a/mgV_maOt
name: Managing your profile README
date: 0000/03/01
key: profile
toc: true
teams: /practicas/equipos-de-3/
equipos: https://campusdoctoradoyposgrado2324.ull.es/mod/assign/view.php?id=30039&forceview=1
foro: https://github.com/orgs/ULL-MFP-AET-2324/discussions
hide: false
rubrica:
  - Creado perfil GH
  - Creado  organización con el nombre correcto
  - Creado perfil de la organización
  - Organización configurada
  - Pertenece a un team de al menos 2 personas
  - crguezl es owner de la organización y los otros dos estudiantes son members
  - Creado GH Classroom asociado a la organización
  - Invitado crguezl como teacher del aula
  - Creada correctamente una asignación de grupo de tamaño 1 en GH Classroom
  - Creado repo de template para la asignación en la organización
  - Ha aceptado como alumnos las tareas asignadas por los otros miembros del equipo
  - Ha hecho alguna pregunta a algún profesor / compañero haciendo uso de los issues GH
  - Ha retroalimentado a sus estudiantes usando las issues de GH
  - Ha hecho un post en el foro de discussions de la organización ULL-MFP-AET-2324
---

# {{ page.title }}

## Aceptando la Tarea

Deberás comenzar aceptando la tarea asociada a esta parte haciendo click en el enlace en la [tarea correspondiente del campus]({{ page.myurl}}) con el texto *"acepta la asignación de la tarea"*.
En cada una de los tareas de esta parte que requieren de la creación de un repositorio de trabajo encontrarás un enlace  similar. 

Esta tarea inicial ha sido configurada por el profesor como una tarea de equipo.
Eso significa que cuando hagan click en la aceptación  de la tarea les saldrá un formulario para elegir el nombre del equipo. En este caso el equipo será individual.

1. Escriba su nombre y apellidos seguido de su ID de la ULL separados por guiones `nombre-apellido1-apellido2-idnumerico`. El `idnumerico` es sin el prefijo `alu`. Por ejemplo, para el alumno `alu0101234567` el nombre del equipo será `nombre-apellido1-apellido2-0101234567`.
2. Si su nombre es compuesto como Ana María Laza Pérez, escriba `ana_maria-laza-perez-0101234567` usando un guión bajo.
3. No uses acentos, ni caracteres especiales, sólo las letras del alfabeto US. Cambia la ñ por la secuencia "ny". No uses blancos.
4. Si no tiene segundo apellido o si la aplicación GH Classroom se queja de que el nombre del team es muy largo, simplemente omítalo y escriba `nombre-apellido1-ullnumericid`
5. Si La aplicación se sigue quejando de que el nombre del team es muy largo omita también el primer apellido. 

## Objetivos

1. Aprender a crear un repo de perfil de un usuario en GitHub
2. Conocer con mas profundidad como aprender a crear y configurar
    1. Una organización para una asignatura que vas a impartir, 
    2. Su correspondiente aula GitHub Classroom,
    3. Como cuando seas profesor puedes solicitar los descuentos del programa "Global Campus" y actualizar tus organizaciones 
    4. Aprender a crear un repo de perfil de una organización en GitHub
3. Que es [GitHub Classroom](https://classroom.github.com) desde la perspectiva del profesor 
4. Aprenderemos a crear una asignación de grupo GHC

## Crea tu repo profile

Siguiendo las instrucciones en la documentación de GitHub [Managing your profile README](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-github-profile/customizing-your-profile/managing-your-profile-readme) añade un README a tu perfil de GitHub para que otras personas sepan sobre ti.

GitHub muestra el README de tu perfil al inicio de tu página de perfil.

Tú decides qué información incluir en el README de tu perfil. Reutiliza el material creado en la práctica anterior.

### Prerequisitos

GitHub mostrará su perfil `README` en su página de perfil si se cumple:

1. Has creado un repositorio con un nombre que **coincide con tu nombre de usuario** de GitHub. Por ejemplo mi repo perfil está en <https://github.com/crguezl/crguezl>
2. El repositorio es **público**.
3. El repositorio contiene un archivo llamado `README.md` en su raíz.

### Ejemplos

Puedes encontrar ejemplos curiosos de *repos profile* en estas referencias:

* [abhisheknaiidu/awesome-github-profile-readme](https://github.com/abhisheknaiidu/awesome-github-profile-readme)
* La misma información pero en [la web](https://zzetao.github.io/awesome-github-profile/) asociada
* [articles about how to write a profile readme](https://github.com/abhisheknaiidu/awesome-github-profile-readme#articles). 

Uno de los trucos típicos para hacer algo curioso es "llamar" a una aplicación web (aquí `github-readme-stats.vercel.app/api`) a la que se le pasan ciertos parámetros (p.ej. `username=crguezl`) y devuelve
una imagen de acuerdo a los parámetros pasados. Por ejemplo:

```markdown
![crguezl stats](https://github-readme-stats.vercel.app/api?username=crguezl&show_icons=true&locale=en)
```
produce esta imagen con las estadísticas correspondientes a la actividad "pública" del usuario `crguezl`:

![crguezl stats](https://github-readme-stats.vercel.app/api?username=crguezl&show_icons=true&locale=en)

O bien esta otra:

```markdown
![Jokes Card](https://readme-jokes.vercel.app/api)
```

que produce una imagen conteniendo un chiste aleatorio sobre programación como este:

![Jokes Card](https://readme-jokes.vercel.app/api)

## Crea una Organización y un repo Profile para la misma

En este paso deberás ahora 

1. [Crear una organización](https://docs.github.com/en/organizations/collaborating-with-groups-in-organizations/creating-a-new-organization-from-scratch) para una asignatura que quieres impartir 
2. El nombre de la organización debe ser `ull-mfp-aet-2324-aluXXXX` donde `aluXXXX` es tu identificador ULL
3. [Invita](https://docs.github.com/en/organizations/managing-membership-in-your-organization/inviting-users-to-join-your-organization#inviting-a-user-to-join-your-organization) a [crguezl](https://github.com/crguezl) como **owner** de la organización
4. Esta organización la vas a usar para impartir una asignatura de **Tecnología** al nivel que quieras elegir. Tu serás el profesor encargado de esa asignatura. Ponte de acuerdo con otros compañeros para que ellos hagan el papel de alumnos de tu asignaturas. En correspondencia, deberás hacer tu el papel de alumno en la asignatura que ellos impartan.
5. Realiza la tarea crear [equipos]({{ page.teams }}) para crear los equipos. Decide con que compañeros quieres colaborar
  * Cada miembro del equipo actuará como profesor en la organización que ha creado y con el rol de estudiante en las organización de los otros miembros del equipo 
6. Vaya a **settings**  de la organización y configure la org. Añádale una profile picture. Hay mucha información sobre la gestión de una organización GitHub en [este enlace](https://docs.github.com/en/organizations/managing-organization-settings)
7. Si tuvieras concedidos los descuentos para profesores ahora podrías acudir a <https://education.github.com/globalcampus/teacher>  y actualizar tu organización <a href="https://education.github.com/globalcampus/teacher" target="_blank"><span style="color: white; background-color: green; text-decoration: underline;text-decoration-style: dotted;">**Upgrade to GitHub Team**</span></a>
8. [Añáde a la organización un repo de perfil/Profile](https://docs.github.com/en/organizations/collaborating-with-groups-in-organizations/customizing-your-organizations-profile#adding-a-public-organization-profile-readme) describiendo a los alumnos la asignatura  y cuales son los primeros pasos que deberán dar para empezar a trabajar en tu asignatura 

Los siguientes recursos contienen la versión en español de las ayudas para realizar estas tareas:

* [Crear una organización nueva desde cero](https://docs.github.com/es/organizations/collaborating-with-groups-in-organizations/creating-a-new-organization-from-scratch)
* [Personalizar el perfil de tu organización](https://docs.github.com/es/organizations/collaborating-with-groups-in-organizations/customizing-your-organizations-profile) 
 

## Crea un Classroom para la Organización

Crea un aula usando GitHub Classroom ([https://classroom.github.com](https://classroom.github.com)) y la asocias a la organización creada en el apartado anterior. 

Si GHC  te provee varias aulas quédate sólo con una. 

**Renombra el aula para que su nombre coincida con el de la organización**: `ull-mfp-aet-2324-aluXXXX` donde `aluXXXX` es tu identificador ULL.

**Invita a [crguezl](https://github.com/crguezl) como profesor asociado**. Para que la invitación pueda hacerse deberás haber primero invitado a [crguezl](https://github.com/crguezl) como **owner** de la organización y este debe haber aceptado.

Para poder llevar a cabo la tarea de crear un classroom y hacer las asignaciones deberás leer con detenimiento la sección [GitHub Classroom para Profesores]({{ site.baseurl}}/pages/github-classroom.html) de estos apuntes 

También te será de utilidad la documentación de GH en [Enseña con GitHub Classroom](https://docs.github.com/es/education/manage-coursework-with-github-classroom/teach-with-github-classroom). Aprende cómo configurar tu aula y tus tareas. Cambia el idioma a inglés si eres eficiente en ese idioma: [Teach with GitHub Classroom](https://docs.github.com/en/education/manage-coursework-with-github-classroom/teach-with-github-classroom)

## Crea asignaciones para tus estudiantes

Lea la información en la sección [Create a Group assignment](https://docs.github.com/en/education/manage-coursework-with-github-classroom/teach-with-github-classroom/create-a-group-assignment)

### Crea una primera asignación de grupo GHC para tu clase de Tecnología

* Configurala como una asignación de grupo con un sólo miembro por grupo como la primera que has hecho en este curso. 
* El nombre del grupo de teams será **STUDENTS**
* Usa la técnica descrita en la sección [Segunda Solución: Asignaciones de Grupos]({{ site.baseurl}}/pages/github-classroom.html#segunda-soluci%C3%B3n-asignaciones-de-grupos) y dale las instrucciones correspondientes a tus [alumnos]({{ page.equipos}}). Lee también la sección "[El problema de Enlazar las Cuentas GH con las cuentas del LMS]({{ site.baseurl }}/pages/github-classroom.html#el-problema-de-enlazar-las-cuentas-gh-con-las-cuentas-del-lms)" en estos apuntes
* [Crea un repo de template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-template-repository) para la asignación dentro de la organización `ull-mfp-aet-2324-aluXXXX` con las instrucciones y ejemplos para la tarea. 
  * El nombre del repo tendrá que tener el sufijo `-template`
  * En los settings del repo deberás indicar que es un repo template
  * Usa dicho repo template como template para la asignación
* Pon una fecha de entrega
* Enviale el enlace a tus otros compañeros/alumnos del [equipo]({{ page.equipos}}). Puedes dejar el enlace en una incidencia en el repo asignado a la práctica [equipos]({{ site.baseurl }}/practicas/equipos/) mencionando al team creado. También puedes usar el [chat de Google](https://mail.google.com/chat/u/0) para enviarle el link al resto. 
* Documenta lo que has hecho en el fichero `README.md`  de tu repo de entrega de esta práctica

### Crea una segunda asignación reutilizando el grupo de teams 

* Configurala como una asignación de grupo y reutilizas el grupo de teams creado en la anterior. 
* Crea un nuevo repo de template para la asignación dentro de la organización `ull-mfp-aet-2324-aluXXXX` con las instrucciones y ejemplos para la tarea como en la anterior
* Enviale el enlace a tus otros compañeros/alumnos del [equipo]({{ page.equipos}}). Puedes usar el [chat de Google](https://mail.google.com/chat/u/0) para comunicarte con tus alumnos. 
* Documenta lo que has hecho en el fichero `README.md`  de tu repo de entrega de esta práctica

## Acepta tus asignaciones como estudiante

Supuesto que tu eres el alumno `AluYYY`, para cada uno de los otros miembros `AluXXX` del equipo procede de este modo:

1. acepta las dos asignaciones que te ha hecho tu compañero  `AluXXX` como profesor.
   * La primera vez que aceptes deberás crear el equipo. Sigue las instrucciones en la sección [Aceptando la tarea]({{ site.baseurl }}tema0-introduccion/practicas/aprender-markdown/#aceptando-la-tarea) que dimos en la primera práctica de esta parte
2. una vez aceptadas, en la organización `ULL-MFP-AET-AluXXX` del profesor `AluXXX` encontraras los dos repos en los que debes trabajar. Suponiendo que ha puesto como prefijos `Tecnologia-1` y `Tecnologia-2`los nombres de esos repos siguen el patrón:
   1. `ULL-MFP-AET-AluXXX/Tecnologia-1-Nombre-Apellidos-AluYYY`
   2. `ULL-MFP-AET-AluXXX/Tecnologia-2-Nombre-Apellidos-AluYYY`
3. sigue las instrucciones que te ha indicado `AluXXX` y realiza las tareas que te asignaron en el repo de entrega
4. Cuando creas que están terminadas procede a las entregas realizando un [issue](https://docs.github.com/en/issues) en el repo de la tarea `ULL-MFP-AET-AluXXX/tarea-prefijo-Nombre-Apellidos-AluYYY` mencionando al correspondiente profesor `@AluXXX` y a `@crguezl` indicándole que has acabado.

## Como profesor evalúa a tus estudiantes

Para cada asignación `Tecnologia-i` y cada alumno `AluYYY` visita su repo, lee su informe y visita el enlace **Insights** del repo para ver las estadísticas de actividad del alumno. Puede consultar [Viewing activity and data for your repository](https://docs.github.com/en/repositories/viewing-activity-and-data-for-your-repository)


Responde a las [incidencias/issues](https://docs.github.com/en/issues/tracking-your-work-with-issues/about-issues) generadas por tus alumnos `aluYYY` indicándoles 

1. Si la tarea está bien hecha y en tal caso **cerrando la incidencia** o bien
2. indicándoles que deben corregir la tarea y volver a enviar una incidencia para su aprobación. 
3. En la incidencia, menciona  al  alumno `@AluYYY` y al profesor `@crguezl`


## Si eres profesor actualiza la organización para que se beneficie de los descuentos

**Si es posible** y no lo hiciste en la [tarea inicial]({{ site.baseurl }}/tema0-introduccion/practicas/registrarse-en-github/)), beneficiarte de los descuentos que ofrece GitHub para lo que 

1. **deberás verificar tu condición de empleo académico** y una vez seas aceptado en el [programa *"Global Campus"*](https://docs.github.com/en/education/explore-the-benefits-of-teaching-and-learning-with-github-education/use-github-at-your-educational-institution/about-github-campus-program), 
2. podrás solicitar hojas de atajos, guías, pegatinas, etc. para tus estudiantes. 

Busca la sección de descuentos en la página [https://education.github.com](https://education.github.com/discount_requests/teacher_application)

Una vez que estás en el [programa *"Global Campus"*](https://docs.github.com/en/education/explore-the-benefits-of-teaching-and-learning-with-github-education/use-github-at-your-educational-institution/about-github-campus-program) podrás acogerte a los beneficios que ofrece GitHub a los educadores. 

Uno de estos es que tus organizaciones podrán tener privilegios especiales (repositorios y equipos privados, acceso al [editor en la nube CodeSpace](https://docs.github.com/es/codespaces/getting-started/quickstart), a la IA GitHub Copilot, etc.).  

Aquí (si estás autenticado y dado de alta) encontrarás el boton de 
<span style="color: white; background-color: green; text-decoration: underline;text-decoration-style: dotted;">**Upgrade to GitHub Team**</span>. Haz click en él y sigue las instrucciones para que tus organizaciones se acojan a los beneficios: [GitHub Education: teacher's page](https://education.github.com/globalcampus/teacher). 

![]({{ site.baseurl }}/assets/images/upgrade-your-organizations.png)

Los pasos iniciales que debes dar para obtener los descuentos y crear un aula para los alumnos en un curso usando GitHub Classroom los encontrarás resumidos en la sección [Inicio rápido para GitHub Educators](https://docs.github.com/es/education/quickstart) (La versión en inglés está aquí: [Quickstart for GitHub Educators
](https://docs.github.com/en/education/quickstart)). 


## Aprendiendo a usar un Foro de una Organización

Añade un foro a la organización que creaste para tu asignatura.

Para ello creas un repo público con nombre "**foro**" en tu organización y configuras la organización (**settings -> discussions**) para usarlo como foro de discusión. 

Para subscribirse al foro y recibir notificaciones de nuevos mensajes es necesario ir al repo del foro y pulsar el botón **"Watch"** en la barra superior y seleccionar  **"Custom" -> "Discussions"** (o seleccionando **"All Activity"**).

Deberás leer el artículo [GitHub in the Classroom: Lessons Learnt]({{ site.baseurl}}/assets/pdfs/github-in-the-classroom-lessons-learnt.pdf) por Yu-Cheng Tu, Valerio Terragni, Ewan Tempero, Asma Shakil,
Andrew Meads, Nasser Giacaman, Allan Fowler, Kelly Blincoe. University of Auckland, [The Australasian Computing Education Conference](https://aceconference.wordpress.com/previous-conferences/), February 14–18, 2022, Virtual Event, Australia.

En el [foro de la organización de AET]({{ page.foro}}) dentro de la categoría **Q&A**

* o bien añades alguna pregunta sobre algo que no hayas entendido 
* o bien contestas la pregunta de otro alumno 
* o bien añades un breve resumen comentando tu opinión sobre el artículo

## Entrega

En el README.md del repo de entrega de esta práctica deja enlaces a la organización y al classroom creados:

```
* [Organización de la práctica ull-mfp-aet-2324-alumnoXXX](https://github.com/ull-mfp-aet-2324-alumnoudv4)
* [Classroom ULL-MFP-AET-2324-alumnoXXXX](https://classroom.github.com/classrooms/108617085-ull-mfp-aet-2324)
```

Añade a la lista enlaces a los profiles GH de los miembros de tu equipo.

## Actividad de los Alumnos para {{ page.key }}

<a href="{{ site.baseurl }}/assets/tareas/{{ page.key }}/activity.html" target="_blank">Medidas de Actividad de los Alumnos para {{ page.key }}</a>


## Rúbrica

{% include rubrica.md %}

## Referencias

* Ejemplos de entregas para una práctica similar de los alumnos de la asignatura [Aprendizaje y Enseñanza de La Tecnología del curso 21/22 aquí](https://github.com/orgs/ULL-MFP-AET-2122/repositories?q=profile-readme&type=all&language=&sort=)
* [Mastering (GitHub) Markdown](https://guides.github.com/features/mastering-markdown/#examples)
* [Documentación GitHub sobre la Interfaz Web]({{site.baseurl}}/pages/documentacion-github-interfaz-web)
* [Edición en la nube]({{site.baseurl}}/pages/gitpod)
* [GitHub Glossary](https://docs.github.com/en/free-pro-team@latest/github/getting-started-with-github/github-glossary)
* [Apuntes del curso Elaboración de Material Docente con GitBook](https://casianorodriguezleon.gitbooks.io/elaboracion-de-material-docente-con-gitbook/content/)
* [angelmicelti](https://github.com/angelmicelti?tab=repositories) Profesor de Tecnología del I.E.S. Virgen de Villadiego, de Peñaflor (Sevilla)
  * <https://angelmicelti.github.io/>
  * <https://angelmicelti.github.io/2_eso.html>
  * <https://angelmicelti.github.io/3_eso.html>
  * <https://angelmicelti.github.io/4_eso.html>

### Otras referencias

{% include github-education-references.md %}

