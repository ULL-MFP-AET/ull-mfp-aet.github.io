{% for practica in site.practicas reversed %}
*  <a href="{{site.baseurl}}{{ practica.myurl }}">{{ practica.title | slice: 0, 2  }}: Práctica {{ practica.name }}</a>
{%- endfor %}

