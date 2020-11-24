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

{% for tag in site.tags %}
  <h3>{{ tag[0] }}</h3>
  <ul>
    {% for post in tag[1] %}
      <li><a href="{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
  </ul>
{% endfor %}


