{%- for practica in site.practicas reversed %}
  {%- if practica.myurl contains "https:" %} 
*  <a href="{{ practica.myurl }}">{{ practica.title | slice: 0, 2  }}:  {{ practica.name }}</a> 
  {%- else %}
*  <a href="{{site.baseurl}}{{ practica.myurl }}">{{ practica.title | slice: 0, 2  }}:  {{ practica.name }}</a> 
    {%- if practica.reto %}
    - <a href="{{site.baseurl}}{{practica.reto.url}}">{{practica.reto.title}}</a>
    {%- endif %}
  {%- endif %}
{%- endfor %}

