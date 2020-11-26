---
layout: default
---

# Clases

{% include clases-impartidas.md %}

# Prueba de Listar Categorías

<ul>
{% for category in site.categories %}
  {% capture category_name %}{{ category | first }}{% endcapture %}
  <li><a name="{{ category_name }}">{{ category_name }}</a>
    <ul>
    {% for post in site.categories[category_name] %}
      <li><a href="{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
    </ul>
  </li> 
{% endfor %}
</ul>

