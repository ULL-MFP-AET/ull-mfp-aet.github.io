<!--
## Temas

<ul>
{% for tema in site.temas %}
  <li><a href="{{site.baseurl}}{{tema.url}}" title="{{ tema.hover }}">{{ tema.title }}</a></li>
{% endfor %}
</ul>
-->

## Clases 

* [Guia Docente y Primeros Pasos en esta parte]({{ site.bseurl }}/tema0-introduccion/guia-docente.html)

{% include clases-impartidas.md %}

## Prácticas

{% include practicas-publicadas.md  %}

