
<ol>
{%- for practica in site.tareas -%}
<li> 
  <a href="{{ practica.url }}">Descripción de la Práctica {{ practica.title }}</a>
</li>
{%- endfor -%}
</ol>


