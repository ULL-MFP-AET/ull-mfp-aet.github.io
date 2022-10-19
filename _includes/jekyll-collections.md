Jekyll Collections is the way Jekyll extends the functionality Jekyll provides for Posts to other user defined collections of documents (like lessons or task assignments in a web site course or departments or people in a school web site).

<!-- Use a character as º to mark the substitution points, that does no appear in any other part of the document -->
º# Posts is A Hard-Coded Collection

In addition to any collections you create yourself, the `posts` collection is hard-coded into Jekyll. It exists whether you have a `_posts` directory or not. 

This is something to note when iterating through `site.collections` as you may need to filter it out.

You can see your collections with a code like this one:

```html
{% raw %}
<div style="border-style: solid; border-radius: 25px;">
<ol>
{%- for col in site.collections %}
<li> Colección: {{ col.label }} </li>
  <ol>
  {%-  assign firstdocs = col.docs | slice: 0,3 %}
  {%- for elem in firstdocs %}
    <li> <b>path:</b> {{ elem.path }} <b>url:</b> {{ elem.url }} </li>
  {%- endfor %}
  </ol>
{%- endfor %}
</ol>
</div>
{% endraw %}
```

when runned in this site produces:

<div style="border-style: solid; border-radius: 25px;">
<ol>
{%- for col in site.collections %}
<li> Colección: {{ col.label }} </li>
  <ol>
  {%-  assign firstdocs = col.docs | slice: 0,3 %}
  {%- for elem in firstdocs %}
    <li> <b>path:</b> {{ elem.path }} <b>url:</b> {{ elem.url }} </li>
  {%- endfor %}
  </ol>
{%- endfor %}
</ol>
</div>




º# Creating a Collection

* To use a Collection you first need to define it in your `_config.yml`. For example here’s a collection called `tareas`:

```yml
  collections:
    - tareas
```
* Create a corresponding folder (e.g. `<source>/_tareas`) and add there the collection documents. Something like this:

  ```
  [~/.../sytws2021/apuntes(curso2021)]$ tree _tareas
  _tareas
  ├── pb-gh-campus-expert.md
  ├── iaas.md
  ├── ...
  └── tfa-user-experience.md

  0 directories, 17 files
```

º# Adding Documents to a Collection

* Here is an example of how you would add a new *tarea* to the collection `tareas` set above. You add a file to the `_tareas` folder. Something like  `./_tareas/10p10-t3-jekyll-search.md`. Follows an example of content:

  ```
    ---
    name: jekyll-search
    visible: true
    date: 2020-11-30
    my_order: 4
    ---

    # Task to Add Search to Your Jekyll Web Site

    Blah, blah, blah ... description of the task the student must do
  ```

º# Controlling the Output

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

º## Collections and Time

Except for documents in hard-coded default collection `posts`, all documents in collections you create, are accessible via Liquid irrespective of their assigned date, if any, and therefore renderable.

Documents are attempted to be written to disk only if the concerned collection metadata has `output: true`. Additionally, future-dated documents are only written if `site.future` _is also true_. Therefore, you can hide a document by setting the date to a future date.

More fine-grained control over documents being written to disk can be exercised by setting `published: false` (_`true` by default_) in the document's front matter.

º# Making a Page to Show the Links to the Collection Documents

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
  * The `markdownify` filter converts a Markdown-formatted string into HTML. The name sounds wrong to me: It will be better to call it *htmlify*

º# Sorting Collections

* By default, two documents in a collection are sorted by their `date` attribute when both of them have the `date` key in their *front matter*. 
* A date is specified in the format `YYYY-MM-DD HH:MM:SS +/-TTTT`; hours, minutes, seconds, and timezone offset are optional.
* Documents can be sorted based on a front matter key by setting a `sort_by` metadata to the front matter key string. 
  * For example, to sort the collection `tareas` based on key `my_order`, the configuration would be:

    ```yml
    collections:
      tareas:
        sort_by: my_order
    ```


º# Collection Attributes 

See [Liquid Attributes section in the Jekyll tutorial about Collections](https://jekyllrb.com/docs/collections/#liquid-attributes)

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



º# Documents Attributes

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
