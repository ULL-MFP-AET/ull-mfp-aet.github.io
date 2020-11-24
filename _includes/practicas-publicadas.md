{%- for practica in site.practicas reversed %}
  {%- if practica.myurl contains "https:" %} 
*  <a href="{{ practica.myurl }}">{{ practica.title | slice: 0, 2  }}:  {{ practica.name }}</a> en el campus. <a href="practica.url">Descripción</a>
  {%- else %}
*  <a href="{{site.baseurl}}{{ practica.myurl }}">{{ practica.title | slice: 0, 2  }}:  {{ practica.name }}</a>  en el campus. <a href="practica.url">Descripción</a> 
    {%- if practica.reto %}
    - Reto: <a href="{{site.baseurl}}{{practica.reto.url}}">{{practica.reto.title}}</a>
    {%- endif %}
  {%- endif %}
{%- endfor %}

