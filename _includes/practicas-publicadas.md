
{%- for practica in site.tareas reversed %}
  {%- if practica.myurl contains "https:" %} 
*  <a href="{{ site.baseurl}}/{{ practica.url }}">{{ practica.title }}:  {{ practica.name }}</a> 
  {%- else %}
*  <a href="{{site.baseurl}}/{{ practica.url }}">{{ practica.title }}:  {{ practica.name }}</a> 
    {%- if practica.reto %}
    - Reto: <a href="{{site.baseurl}}/{{practica.reto.url}}">{{practica.reto.title}}</a>
    {%- endif %}
  {%- endif %}
{%- endfor %}

