{% assign temas = site.categories["temas"] | sort %}
<ul>
  {% for tema in temas %}
<li><a href="{{site.baseurl}}{{tema.url}}" title="{{ tema.hover }}">{{ tema.title }}</a></li>
  {% endfor %}
</ul>
