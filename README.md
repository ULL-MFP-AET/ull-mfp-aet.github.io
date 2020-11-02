## Temas

<ul>
{% for tema in site.temas %}
  <li><a href="{{site.baseurl}}{{tema.url}}" title="{{ tema.hover }}">{{ tema.title }}</a></li>
{% endfor %}
</ul>


## Clases 

{% include clases-impartidas.md %}

## Prácticas

{% include practicas-publicadas.md  %}

