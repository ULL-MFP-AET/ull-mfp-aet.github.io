---
layout: default
title: GitHub Classroom para Profesores
toc: true
---

# {{ page.title }}

### Que es Github Classroom (GHC)

Github Classroom (GHC) es "una herramienta para profesores que utiliza la API de GitHub para habilitar el flujo de trabajo de GitHub para la educación". GHC permite la creación de "aulas" y "asignaciones" dentro del aula. Las "aulas" o "classrooms" proporcionan los medios para organizar tareas para un curso, repositorios para las tareas y estudiantes para los repositorios.

### El proceso de gestión de asignaciones

El proceso de gestión de asignaciones es el siguiente:

1. El profesor crea una tarea, que debe estar asociada con un
repo
  * El repositorio debe ser un repositorio de plantilla. 
2. El profesor da nombre a la tarea.
  * Si la tarea es configurada como de grupo, este campo permite distinguir los diferentes conjuntos de equipos. Si ya existe un conjunto previo de equipos, aparece una opción para seleccionarlo(o bien se puede definir un nuevo conjunto de equipos). Si se elige un conjunto existente de equipos, cuando los estudiantes acepten la tarea no necesitarán seleccionar a que equipo quieren pertenecer)
3. El profesor toma otras decisiones para la tarea: 
  * Si los estudiantes tienen derechos de administrador sobre los repos creados. 
  Para cursos pequeños y en los que los alumnos no tengan conocimientos puede que sea preferible no darles derechos de admin, sin embargo, en general es una buena idea darles permisos de admin.
  Aunque los estudiantes tengan derechos de admin sobre sus repos, [es posible aplicar restricciones sobre los miembros a nivel de organización](https://docs.github.com/en/organizations/managing-organization-settings/setting-permissions-for-deleting-or-transferring-repositories). Por ejemplo evitar que  los estudiantes pueden eliminar un repositorio, transferirlo a otra cuenta o cambiar su visibilidad.
  * Si los repos serán públicos o privados. Los repositorios deben ser privados cuando se quiera evitar el plagio. 
  * Si se usará la versión de VSCode en la nube de GitHub denominada CodeSpaces (en los settings del classroom tendrá que tener la opción `codespaces` a `enabled`. Vea la sección *GitHub Codespaces* en la <a href="#settings">figura con los settings</a>) y la documentación [*Using GitHub Codespaces with GitHub Classroom*](https://docs.github.com/en/education/manage-coursework-with-github-classroom/integrate-github-classroom-with-an-ide/using-github-codespaces-with-github-classroom)
  * etc. 
3. Una vez que el profesor rellena los detalles de la tarea, GHC genera una
enlace de invitación (URL)
4. Este enlace se pone a disposición de los estudiantes via el LMS (Moodle u otro) u otro mecanismo
5. Cuando los estudiantes hacen click en el enlace y aceptan la invitación, obtienen su propio clon del repositorio plantilla. Los repositorios tienen nombres consistentes formados por el nombre de la tarea y el nombre de usuario del alumno.
6. Los estudiantes completan el trabajo en el repo creado
  - Este video en YouTube [How to use VS Code to submit an assignment to Github Classroom (initially empty repository)](https://youtu.be/iqW_yzZkU_8) muestra como deben hacer los estudiantes para aceptar, trabajar y entregar una tarea asignada con GHC usando el editor VS Code
7. Los profesores  tienen acceso completo a todos los repositorios y pueden dar retroalimentación al alumno y evaluarle

Vea el vídeo 

<div class="embed-container">
  <iframe src="https://www.youtube.com/embed/QxrA3taZdNM" 
    width="700" 
    height="480" 
    frameborder="0"
    allowfullscreen="true">
  </iframe>
</div>

y este otro que muestra la aceptación y realización de la asignación por parte del estudiante:

{% include youtubePlayer.html id="ObaFRGp_Eko" %}

## El problema de Enlazar las Cuentas GH con las cuentas del LMS

Si bien los repositorios creados al aceptar una invitación de asignación de GHC tienen
un esquema de nombres consistente, **parte del nombre es la cuenta de GH
nombre elegido por el estudiante**. La siguiente figura muestra un ejemplo para una tarea denominada `p5-t3-websockets`: 

<img src ="{{site.baseurl}}/assets/images/github-classroom-naming-scheme.png" width="70%"/>


Mientras que el problema de encontrar el repositorio de un estudiante en particular se hace más fácil debido a la consistencia del esquema, en una clase grande aún puede requerir bastante tiempo. Por ejemplo, en la imagen anterior:

¿Que alumno es `dreamz11`? ¿Cual es su identificador en el LMS?
¿Como se llama el alumno?

El problema de identificación es mas fácil con la tarea `p5-t3-websockets-alu0101037653` ya que el alumno ha hecho coincidir su login GitHub `alu0101037653` con su identificador dentro de nuestra Universidad. Tendré ahora que ver que alumno es `alu0101037653`. 
De hecho una solución parcial al problema es solicitar a los alumnos que tengan una cuenta github cuyo login coincida con su identificador en el LMS. Obviamente no todos los alumnos van a seguir esas instrucciones.

## Primera Solución: GHC Rosters


GHC aborda este problema permitiendo que los profesores suban una [lista o GHC roster](https://docs.github.com/en/education/manage-coursework-with-github-classroom/teach-with-github-classroom/manage-classrooms#about-classroom-rosters)
para cada GHC classroom.

Los profesores pueden cargar la lista de los estudiantes en su curso a
el correspondiente GHC classroom, y posteriormente en las aceptaciones de las subsiguientes
asignaciones los repositorios de los estudiantes son  vinculados
al GHC roster. Esto permite que los repositorios se encuentren usando el
identidad universitaria.

Hay dos maneras para que los profesores creen la lista de
los alumnos en sus cursos.

1. Los profesores pueden importar manualmente una lista cargando un CSV o un archivo de texto que contiene el ID en la institución del estudiante.
2. Pueden importar la lista de un sistema de gestión de aprendizaje (LMS) como Canvas o Moodle. Esto puede hacerse por ejemplo, desde los *settings* del aula GHC:

  <a name="settings"><img src="{{ site.baseurl}}/assets/images/github-classroom-settings.png" width="100%"/></a>

  Véase también este video:
  {% include youtubePlayer.html id="DTzrKduaHj8" %}

Para asociar los alumnos a sus cuentas de GH, los estudiantes deben identificarse en el roster y manualmente
vinculan sus cuentas cuando aceptan por primera vez la asignación de GHC.

Sin embargo, hay varios problemas: 

* La conexión entre el LMS y GHC no vincula automáticamente las cuentas de GH de los estudiantes con la lista de GHC. Se requiere que los estudiantes vinculen manualmente sus cuentas. 
* Si los estudiantes eligen accidental o maliciosamente el nombre de la lista, entonces los instructores tendrían que desvincular las cuentas.
* Otro problema es que solo hay tres opciones para identificar cada estudiante en la lista:

                 ID de usuario, nombres, correos electrónicos.

  En el caso de nuestra universidad el  correo electrónico de la universidad es consistente 
  con los identificadores de los estudiantes en el LMS, pero sabemos de casos en otras instituciones en los que el ID importados del LMS no siempre es equivalente al carnet de estudiante.

  A veces, encontramos  que los estudiantes no pueden encontrar sus correos electrónicos en la lista si la clase es grande. Además, a veces no son solo los estudiantes los que aparecen en la lista sino que pueden aparecer profesores y otro personal vinculado.

  Para manejar el GHC roster es mejor crear la lista manualmente, utilizando una combinación 
  nombre-del-estudiante-identificador-usuario. De hecho no hay necesidad de crear la lista 
  desde cero: Los profesores descargamos el roster del LMSs en CSV y lo procesamos con unas cuantas sustituciones (¡expresiones regulares al rescate!). 


## Segunda Solución: Asignaciones de Grupos 

Una solución equivalente a la anterior es hacer que todas las asignaciones individuales sean asignaciones de un grupo de tamaño uno e instruir al alumno para que cuando cree el grupo individual siga el esquema 
`nombre-apellidos-identificador`. Una vez creado ese conjunto de equipos será utilizado para el resto de tareas individuales del curso. La siguiente imagen muestra cuan sencillo es así obtener las tareas de un alumno si se recuerda el nombre o los apellidos del alumno o se dispone de su identificador:

<img src="{{site.baseurl}}/assets/images/github-classroom-group-assignment-naming-scheme.png" width="70%"/>

Una ventaja de esta solución es que es posible usar la API de GitHub para obtener un JSON con información del team y del alumno.
Este es un ejemplo de solicitud graphql para obtener la información de un equipo:

```graphql
query getInfo($organization: String!) {
  organization(login: $organization) {
    teams(first: 100) {
      totalCount
      edges {
        node {
          name
          members(first: 100) {
            totalCount
            edges {
              memberAccessUrl
              node {
                name
                url
                email
                login
                
              }
            }
          }
          url
        }
      }
    }
  }
}
```

El JSON generado puede ser utilizado desde el generador estático de sites (Jekyll, Hugo, Vuepress, etc) para generar una página web con la información de los equipos y los alumnos. Este es un ejemplo con un fragmento de una macro Jekyll `_includes/teams.html` que podemos usar para generar este tipo de información:

{% raw %}
```html
{% assign teams = site.data.teams.data.organization.teams.edges %}
{% for team in teams -%}
  {%- assign name = team.node.name -%}
  {%- assign names = name | split: "-" -%}
  {%- assign studentName = names[0] | | capitalize }} -%}
  {%- assign url = team.node.url -%}
<h2>{{ studentName }}</h2>

<ul>
  <li> Team:
    <a href="{{url}}" target="_blank">{{ name }}</a>
  </li>
  <li> {{ studentName }} repos: 
  <a href="{{url}}/repositories" target="_blank">Repositories</a>
  </li>
  {% assign memberAccessUrl = team.node.members.edges[0].memberAccessUrl %}
  {%- assign student = team.node.members.edges[0].node -%}
  <li> <a href="{{ memberAccessUrl }}" target="_blank">{{ studentName }} ({{ student.login }})</a>  at the organization {{ site.organization.name }}</li>
  <li> <a href="{{ student.url }}" target="_blank">{{ studentName }} at GitHub</a> is {{ student.login }}</li>
  <li><a href="https://github.com/notifications?query=author%3A{{ student.login }}" target="_blank">Notifications</a></li>
</ul>
{% endfor -%}
```
{% endraw %}


## Tercera solución: Spreadsheet y la extensión gh org-members

Muchos profesores mantenemos una hoja de cálculo paralela a la del LMS en la que llevamos las cuentas 
de como van los alumnos. La experiencia nos muestra que manejar una hoja Excel/Google Spreadshet/Otras propporciona una forma más rápida y fácil de administrar las calificaciones que ingresarlos en el Libro de calificaciones del LMS, especialmente con clases grandes. Muchos LMS como Moodle [permiten importar y exportar
las calificaciones](https://youtu.be/a3scoY_CD4k) usando el formato CSV. 

El flujo de trabajo en este caso es el siguiente:

1. Tenemos una hoja de cálculo con las calificaciones cuyo nombre comienza con el nombre de la organización github `/<org>.*/`. La hoja debe tener una columna llamada `login` con el nombre de inicio de sesión en Github de los miembros de la organización.

2. Instalamos la extensión gh [gh-cli-for-education/gh-org-members](https://github.com/gh-cli-for-education/gh-org-members)
 
    ```
    gh extension install crguezl/gh-org-members
    ```

    Estas son las opciones disponibles:
    
    ```
    ➜  markdown git:(master) ✗ gh org-members -h
    Usage: gh org-members [options] [organization]

    Options:
      -V, --version             output the version number
      -f, --fullname            show name of the user (if available)
      -j, --json                returns the full json object
      -r, --regexp <regexp>     filter <query> results using <regexp>
      -u, --url                 show github user url
      -l, --login               show github user login
      -w, --orgurl              show github user url as a member of the org
      -s, --site                show url of the members github pages web sites
      -c, --csv [field...]      shows the values of the fields of the organization csv
      -p, --pathcsv <csv file>  path to the csv file
      -o --org <org>            default organization
        --default              Set selected "org" as default organization for future uses
      -h, --help                display help for command

      - If the organization is not explicitly specified or there is a default org,
        the selection will be done interactively among the list of your organizations using 'fzf'
      - You can set the default organization through the "--default" option for future uses of this program
      - When in 'fzf', use CTRL-A to select all, tab to select/deselect
      - You can merge the results of the GitHub API info with info from info in a '.csv' file using the "-c" and "-p" options. For instance: "gh org-members -jr sara -c -p ./ULL-MFP-AET-2122.csv"
      - If the option '-c' is used but the '.csv' file is not specified via the '-p' option, it will use the most recent '*.csv' file in your 'Downloads' folder mathching the regular expression pattern '/<org>.*.csv/' where 'org' refers to the specified or default organization
      - When using '-c' it can be followed by any list of field names in the '.csv' file.
      - The '.csv' file has to have a column named 'login' having the Github login of the members
    ```


3. Exportamos nuestra hoja a formato `.csv``


4. La extensión [gh-cli-for-education/gh-org-members](https://github.com/gh-cli-for-education/gh-org-members) permite fusionar los resultados de la información de la API de GitHub con la información de la información en un archivo `.csv` usando las opciones `-c` y `-p`. Por ejemplo: 

    ```
    ✗ gh org-members -jr Pere -c -p ./ULL-MFP-AET-2122.CSV
    ```
    Nos permite obtener un JSON (opción `-j`) sobre los miembros de la oranización `ULL-MFP-AET-2122` para los que alguna de las columnas casa con `Pere` (opción `-r`). La opción `-c` hace que la extensión busque por el archivo mas reciente en la carpeta `Downloads` de su O.S. cuyo nombre case con el patrón `ULL-MFP-AET-2122*.csv` y mezcle los resultados de la API de GH con los del archivo CSV usando la columna `login` como clave primaria de mezcla. La salida contendrá la mezcla de las dos fuentes. Sigue un ejemplo:

    ```json
    [
      {
        "login": "Cami100260076",
        "name": "Camilo Glez. Peresola",
        "url": "https://github.com/Cami100260076",
        "role": "member",
        "site": "https://Cami100260076.github.io",
        "orgurl": "https://github.com/orgs/ULL-MFP-AET-2122/people/Cami100260076",
        "fullname": "Camilo Glez. Peresola",
        "id": "alu0100260076",
        "orden": "8",
        "Marca temporal": "26/10/2021 18:16:30",
        "Nombre 1": "Camilo",
        "Apellidos": "González Peresola",
        "Nombre": "Camilo",
        "Primer Apellido": "González",
        "Segundo Apellido": "Peresola",
        "Grado desde el que accede": "Ingeniería industrial",
        "Experiencia previa en la Enseñanza": "2",
        "markdown": "APTO",
        "profile": "APTO",
        "web site": "APTO",
        "pandoc": "APTO+",
        "TFP DCP": "APTO",
        "Calculada": "8,8",
        "Calificador Propuesta": "9",
        "Calificador propuesta": ""
      }
    ]
    ```

   Estas son algunas de las consideraciones a tener en cuenta cuando se usa esta extensión:

    - Si se usa la opción `-c` pero el archivo `.csv` no se especifica a través de la opción `-p`, se usará el archivo `*.csv` más reciente en la carpeta `Downloads` de su O.S. que coincida con la expresión regular patrón `/<org>.*.csv/` donde `org` se refiere a la organización especificada o predeterminada
    - Cuando se usa `-c`, puede ir seguido de cualquier lista de nombres de campo que ocurra en el archivo `.csv`.
    - El archivo `.csv` debe tener una columna llamada `login` con el nombre de inicio de sesión en Github de los miembros de la organización


## Tareas de Equipo y Branch Protection

En cursos donde los estudiantes trabajan en equipos y todos los miembros del equipo
tiene derechos de administrador en sus repositorios,
es conveniente aconsejar a los estudiantes  que añadan [reglas de protección de las ramas importantes](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests/managing-a-branch-protection-rule) que les blinden 
contra una pérdida de datos debida a un `push --force`. 

Lo habitual en estos casos es que la configuren a 
**require pull request reviews before merging**
en la rama `main`. 


## Descarga de las Asignaciones GHC

El uso de Git, GitHub y GHC abre posibilidades de cómo el proceso de evaluación
puede llevarse a cabo. Es importante que el estudiante mantenga
su repositorio remoto actualizado. Es necesario recordarles a los estudiantes la conveniencia de 
hacer `git push` a menudo.

Hay una serie de opciones para que los profesores evalúen los repositorios.

Siempre que los instructores tengan acceso, es posible
clonar el repositorio de cada estudiante con alguna herramienta como 

1. [`gh org-clone -s iaas -n ULL-ESIT-DMSI-1920`](https://github.com/gh-cli-for-education/gh-org-clone) o bien
2. [`gh submodule-add -C -o ULL-MFP-AET-2122 -s latex-markdown -r 'marrero|maury|coell'`](https://github.com/crguezl/gh-submodule-add)

La ventaja de `gh submodule-add` es que permite facilmente realizar con un sólo comando acciones sobre todos los repos de los alumnos usando `gh submodule foreach` (por ejemplo actualizarlos)

## Calificación Automática con GHC: autograding

GHC ofrece la opción, llamada *autograding*, que permite aplicar pruebas automatizadas a los envíos de los estudiantes. Esto lo hace añadiendo al repo del estudiante [GitHub Actions]({{ site.baseurl}}pages/github-actions) de manera que cada vez que el estudiante ejecuta un `push` se ejecutan las pruebas. 

En estos casos, lo habitual es que el profesor recicle las pruebas que tenga y las añada al template proporcionado y especifique en la asignación el lenguaje de las pruebas y como estas se ejecutarán. La figura muestra un caso para una asignación en la que el alumno desarrolla con node:

![]({{ site.baseurl }}/assets/images/github-classroom-specify-autograding.png)

Esto no solo permite una guía mas cerrada y desacoplada 
con una evaluación “formativa”,
aumentando las posibilidades de que los estudiantes se ajusten a lo solicitado.

Además, los profesores también pueden añadir mediante un script en la fase de evaluación pruebas privadas no publicadas en sus clones/submódulos de los repositorios de estudiantes que darán lugar a la calificación final.

## Referencias

{% include github-education-references.md %}