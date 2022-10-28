
<ol reverse>
{%- for practica in site.tareas -%}
<li> 
  <a href="{{ practica.url }}">Descripción de la Práctica {{ practica.title }}</a>
  <ul>
    {% if practica.key %}<li>Repos en GH: {% include link-repo-labs.md lab=practica.key %}</li>
    <li><a href="{{ site.baseurl }}/assets/tareas/{{ practica.key }}/activity.html" target="_blank">Grafos de Actividad de los Alumnos para {{ practica.key }}</a></li>
    {% endif %}
    <li><a href="{{practica.permalink}}#rúbrica">Rúbrica</a> </li>
  </ul>
</li>
{%- endfor -%}
</ol>

