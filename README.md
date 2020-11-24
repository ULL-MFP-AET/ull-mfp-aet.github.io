<!--
## Temas

<ul>
{% for tema in site.temas %}
  <li><a href="{{site.baseurl}}{{tema.url}}" title="{{ tema.hover }}">{{ tema.title }}</a></li>
{% endfor %}
</ul>
-->

## Clases 

{% include clases-impartidas.md %}

## Prácticas

{% include practicas-publicadas.md  %}

## Etiquetas

<ul>
{% for tag in site.tags %}
  <li>{{ tag[0] }}</li>
  <ul>
    {% for post in tag[1] %}
      <li><a href="{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
  </ul>
{% endfor %}
</ul>

