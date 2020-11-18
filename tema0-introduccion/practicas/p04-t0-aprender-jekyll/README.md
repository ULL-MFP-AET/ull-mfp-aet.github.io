---
layout: default
title: p04-t0-aprender-jekyll
permalink: /tema0-introduccion/practicas/p04-t0-aprender-jekyll/index.html
previous: 
  url: 
next:
  url: 
---

# Aprendiendo Jekyll (p04-t0-aprender-jekyll)

Partiendo del [repl.it](https://repl.it) que creó en la práctica anterior, vamos a profundizar en el generador de web sites y blogs estáticos ([Jekyll](jekyllrb.com)).

Siga estos pasos:


## Control de Versiones

* En su repl.it en que trabajó en la práctica anterior [p03-t0-aprender-ide]({{site.baseurl}}//tema0-introduccion/practicas/p03-t0-aprender-ide/), haga una rama `p03-t0-aprender-ide`   y empújela a GitHUb. Vuélvase a la rama `master` y siga trabajando en ella durante toda esta práctica

## Objetivos

* Modifique el projecto para que sea un web site para la asignatura que piensa desarrollar en su TFM y en sus Prácticas en Centros. En el directorio `_posts` escriba varias lecciones de  prueba. Algo así:

  ```
  ~/.../aet2021/apuntes(master)]$ tree _posts
  _posts
  ├── 2020-11-03-leccion.md
  ├── 2020-11-05-leccion.md
  ├── 2020-11-10-leccion.md
  ├── 2020-11-12-leccion.md
  └── 2020-11-17-leccion.md
  ```
* Recuerde poner el front-matter en sus posts. Especifique al menos el layout y el title.
  
  ```
    ---
    layout: post
    title:  "Clase del Jueves 12/11/2020"
    ---
  ```
* Defina una [collection](https://jekyllrb.com/docs/collections/) `temas` para los temas que va a impartir y ponga algún contenido
* Defina una [collection](https://jekyllrb.com/docs/collections/) `tareas` para las tareas que va a asignarles a sus alumnos y añádales algún contenido
* Aisle los datos en el directorio `_data` en un fichero JSON o yml de manera que el web site sea fácilmente modificable para adaptarlo a otra asignatura

## Jekyll Collections

### Creating a Collection

* To use a Collection you first need to define it in your `_config.yml`. For example here’s a collection called `tareas`:

```yml
  collections:
    - tareas
```
* Create a corresponding folder (e.g. `<source>/_tareas`) and add there the collection documents. Something like this:

  ```
  [~/.../sytws2021/apuntes(curso2021)]$ tree _tareas
  _tareas
  ├── 01p01-t0-pb-gh-campus-expert.md
  ├── 01p01-t1-iaas.md
  ├── ...
  └── 12p12-tfa-user-experience.md

  0 directories, 17 files
```

### Adding Documents to a Collection

* Here is an example of how you would add a new *tarea* to the collection `tareas` set above. You add a file to the `_tareas` folder. Something like  `./_tareas/10p10-t3-jekyll-search.md`. Follows an example of content:

  ```
    ---
    name: p10-t3-jekyll-search
    visible: true
    date: 2020-11-30
    my_order: 4
    ---

    # Task to Add Search to Your Jekyll Web Site

    Blah, blah, blah ... description of the task the student must do
  ```

### Controlling the Output

* Regardless of whether front matter exists or not, Jekyll will write to the destination directory (e.g. `_site`) only if `output: true` has been set in the *collection’s metadata*

  ```yml
  collections:
    tareas:
      output: true
    temas:
      output: true
  ```
* Front matter is processed if the front matter exists, and everything after the front matter is pushed into the document’s `content` attribute
* If no front matter is provided, Jekyll will consider it to be *a static file* and the contents will not undergo further processing. A markdown file with no front matter **will not** be transformed onto a HTML file 
* If front matter is provided, Jekyll will process the file contents into the expected output. I.e. the markdown will be converted to HTML
* Therefore, *be sure you add front matter to the documents in both collections* `tareas` and `temas`

### Making a Page to Show the Links to the Collection Documents

* Now you can iterate over `site.tareas` on another page, let's say file `tareas.md` and output a link to each `tarea`. 
 
  ```
  {% raw %}
  {%- for practica in site.tareas %}
    {%- if practica.visible %}
  {{ practica.name | slice: 0, 2  }}.  <a href="{{ practica.url }}">Práctica {{ practica.name }}</a>
    {%- endif %}
  {%- endfor %}
  {% endraw %}
  ```
  We can link to the generated page using the `practica.url` attribute
* Similar to posts, the body of the document can be accessed using the `content` variable. Here is another example:

  ```
  {% raw %}
  {% for task in site.tareas %}
    <h2>{{ task.name }} - {{ task.date }}</h2>
    <p>{{ task.content | markdownify }}</p>
  {% endfor %}
  {% endraw %}
  ```
  * The `markdownify` filter converts a Markdown-formatted string into HTML.

### Sorting Collections

* By default, two documents in a collection are sorted by their `date` attribute when both of them have the `date` key in their *front matter*. 
* A date is specified in the format `YYYY-MM-DD HH:MM:SS +/-TTTT`; hours, minutes, seconds, and timezone offset are optional.
* Documents can be sorted based on a front matter key by setting a `sort_by` metadata to the front matter key string. 
  * For example, to sort the collection `tareas` based on key `my_order`, the configuration would be:

    ```yml
    collections:
      tareas:
        sort_by: my_order
    ```


### Collection Attributes and Collection Documents Attributes

See [Liquid Attributes section in the Jekyll tutorial about Collections](https://jekyllrb.com/docs/collections/#liquid-attributes)

#### Collections Attributes

<!--  See the md source at https://raw.githubusercontent.com/jekyll/jekyll/d596ceb5c2a19abb5a95e5be05f777ae91d7886c/docs/_docs/collections.md -->
Collections are also available under `site.collections`, with the metadata
you specified in your `_config.yml` (if present) and the following information:

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Variable</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>label</code></p>
      </td>
      <td>
        <p>
          The name of your collection, e.g. <code>my_collection</code>.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>docs</code></p>
      </td>
      <td>
        <p>
          An array of <a href="#documents">documents</a>.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>files</code></p>
      </td>
      <td>
        <p>
          An array of static files in the collection.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>relative_directory</code></p>
      </td>
      <td>
        <p>
          The path to the collection's source directory, relative to the site
          source.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>directory</code></p>
      </td>
      <td>
        <p>
          The full path to the collections's source directory.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>output</code></p>
      </td>
      <td>
        <p>
          Whether the collection's documents will be output as individual
          files.
        </p>
      </td>
    </tr>
  </tbody>
</table>
</div>

<div class="note info">
  <h5>A Hard-Coded Collection</h5>
  <p>In addition to any collections you create yourself, the
  <code>posts</code> collection is hard-coded into Jekyll. It exists whether
  you have a <code>_posts</code> directory or not. This is something to note
  when iterating through <code>site.collections</code> as you may need to
  filter it out.</p>
  <p>You may wish to use filters to find your collection:
  <code>{% raw %}{{ site.collections | where: "label", "myCollection" | first }}{% endraw %}</code></p>
</div>

<div class="note info">
  <h5>Collections and Time</h5>
  <p>Except for documents in hard-coded default collection <code>posts</code>, all documents in collections
    you create, are accessible via Liquid irrespective of their assigned date, if any, and therefore renderable.
  </p>
  <p>Documents are attempted to be written to disk only if the concerned collection
    metadata has <code>output: true</code>. Additionally, future-dated documents are only written if
    <code>site.future</code> <em>is also true</em>.
  </p>
  <p>More fine-grained control over documents being written to disk can be exercised by setting
    <code>published: false</code> (<em><code>true</code> by default</em>) in the document's front matter.
  </p>
</div>

#### Documents Attributes

In addition to any front matter provided in the document's corresponding
file, each document has the following attributes:

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Variable</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>content</code></p>
      </td>
      <td>
        <p>
          The (unrendered) content of the document. If no front matter is
          provided, Jekyll will not generate the file in your collection. If
          front matter is used, then this is all the contents of the file
          after the terminating
          `---` of the front matter.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>output</code></p>
      </td>
      <td>
        <p>
          The rendered output of the document, based on the
          <code>content</code>.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>path</code></p>
      </td>
      <td>
        <p>
          The full path to the document's source file.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>relative_path</code></p>
      </td>
      <td>
        <p>
          The path to the document's source file relative to the site source.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>url</code></p>
      </td>
      <td>
        <p>
          The URL of the rendered collection. The file is only written to the destination when the collection to which it belongs has <code>output: true</code> in the site's configuration.
          </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>collection</code></p>
      </td>
      <td>
        <p>
          The name of the document's collection.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>date</code></p>
      </td>
      <td>
        <p>
          The date of the document's collection.
        </p>
      </td>
    </tr>
  </tbody>
</table>
</div>


<!--
* Haga un fork de este replit: [https://repl.it/@crguezl/JekyllBlog#main.sh](https://repl.it/@crguezl/JekyllBlog#main.sh) o bien duplique el de la última práctica
* Aquí tiene un ejemplo de CV usando Jekyll por Biagio Brattoli:
  * [Repo en GitHub](https://github.com/bbrattoli/bbrattoli.github.io)
  * [Despliegue en GitHub Pages](https://bbrattoli.github.io/)
* Aquí tienes otro ejemplo de CV
  * [Repo en GitHub](https://github.com/ddbullfrog/resumecard)
  * [Despliegue](https://ddbullfrog.github.io/resumecard/)
* Usando [git](https://git-scm.com/) clone en el directorio `site` el repo [bbrattoli/bbrattoli.github.io](https://github.com/bbrattoli/bbrattoli.github.io). Puede hacerlo en la terminal:

  ```
    $ rm -fR site
    $ git clone https://github.com/bbrattoli/bbrattoli.github.io.git site
    Cloning into 'site'...
    remote: Enumerating objects: 2119, done.
    remote: Total 2119 (delta 0), reused 0 (delta 0), pack-reused 2119
    Receiving objects: 100% (2119/2119), 4.17 MiB | 10.23 MiB/s, done.
    Resolving deltas: 100% (482/482), done.
  ```

* Lea la documentación en [jekyllrb.com](https://jekyllrb.com) y vaya modificando los ficheros en `_data`, `_config.yml` etc. para personalizarlo como su CV.
-->
## La Entrega

* En el repo de entrega asegúrese de añadir un enlace al replit creado.
* Comparta su replit con el profesor
* Añada al repo de entrega todos los ficheros del directorio que contienen los ficheros generados para el web site (directorio `_site`). 
* Active GitHub Pages del Repo
* Ponga el enlace en la sección de descripción del repo
  
## Referencias

{% include jekyll-references.md %}

<!--
* [Repl.it Tutorial MAKE A BLOG USING JEKYLL](https://repl.it/talk/learn/GUIDE-MAKE-A-BLOG-USING-JEKYLL-POG-ALERT-KEK-HAHAYES-ENDORSED/59021)
  * [Repl de ejemplo](https://repl.it/@sourcerose/JekyllBlog#main.sh)
  * [Repo en GitHub](https://github.com/barryclark/jekyll-now.git)
* [Understanding the Repl.it IDE: a practical guide to building your first project with Repl.it](https://www.codewithrepl.it/01-introduction-to-the-repl-it-ide.html)
* [Repl.it Quick Start Guide](https://docs.repl.it/misc/quick-start)
* Documentación en [jekyllrb.com](https://jekyllrb.com)
* Ejemplo de CV de Biagio Brattoli usando Jekyll:
  * [Repo en GitHub](https://github.com/bbrattoli/bbrattoli.github.io)
  * [Despliegue en GitHub Pages](https://bbrattoli.github.io/)
* [Free Jekyll Themes](https://jekyllthemes.io/free)
-->