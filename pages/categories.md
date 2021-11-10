# Categories 

Ejemplo en Jekyll de una página para visualizar una categoría llamada `clases`:

{% raw %}
```
➜  pl2021apuntes git:(main) ✗ cat  pages/clases.md
```
```html
---
layout: single
title: Clases (Grupos 1 y PA101)
permalink: /clases
toc: true
---

 <ol>
  {%- assign previousMonth = "0" %}
  {%- for post in site.categories["clases"]  %}
      {%- assign currentMonth = post.date | date: "%B" %}
      {%- if currentMonth != previousMonth %}
</ol>
### Classes during the month of {{ currentMonth }}

<ol reversed>
      {%- endif %}
<li> <a href="{{site.baseurl}}{{ post.url }}">{{ post.title }}</a></li>
  <ul>
    {%- if post.summary %}<li>{{ post.summary | markdownify }}</li>{%- endif -%}
    {%- if post.video %}<li>
      {% if post.video.first%}
        {% for video in post.video %}
            <a href="https://youtu.be/{{video}}">Vídeo {{ forloop.index }}</a>
            {% unless forloop.last%},{% endunless %}
        {% endfor %}

      {% else %}
           <a href="https://youtu.be/{{post.video}}">Vídeo</a>
      {% endif %}
    </li>
    {%- endif %}
  </ul>
      {%- assign previousMonth = currentMonth %}
  {%- endfor %}
```
{% endraw %}

Una  página que pertenezca a la categoría `clases`  (por ejemplo un fichero que está en el directorio `clases/_posts` podría tener un frontmatter/preámbulo parecido a este:

{% raw %}
```
---
title: "Martes  27/04/2021"
published: true
video: "i6cFRJs4ql8"
summary:  "Reviewing the ':' lexical operator. Objects in Egg. The DOT as another lexical operator"
---
```
{% endraw %}

y la correspondiente página `/clases` se ve así:


[![]({{site.baseurl}}/assets/images/jekyll-category-clases.png)](https://ull-esit-gradoii-pl.github.io/clases)


## Referencias

{% include jekyll-references.md %}
