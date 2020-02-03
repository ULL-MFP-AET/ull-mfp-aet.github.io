{% for practica in site.practicas reversed %}
{% if practica.myurl contains "https:" %}
*  <a href="{{ practica.myurl }}">{{ practica.title | slice: 0, 2  }}:  {{ practica.name }}</a> IF
{% else %}
*  <a href="{{site.baseurl}}{{ practica.myurl }}">{{ practica.title | slice: 0, 2  }}:  {{ practica.name }}</a> ELSE
{%- endfor %}

