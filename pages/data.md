----
----

# Data

Véase el tutorial [Tabulate CSV Data](https://jekyllrb.com/tutorials/csv-to-table/)

### Inspeccionando site.data 


{% raw %}
```liquid
{% assign row = site.data.calificaciones[0] %}
{% for p in row %}
  {{ p | inspect }}
{% endfor %}
```
{% endraw %}


### Creando una Tabla en HTML

* [tablerow](https://liquidjs.com/tags/tablerow.html)


{% raw %}
```html
<table>
  {% for row in site.data.calificaciones %}
    {% if forloop.first %}
    <tr>
      {% for p in row %}
        <th>{{ p[0] }}</th>
      {% endfor %}
    </tr>
    {% endif %}

    {% tablerow p in row %}
      {{ p[1] }}
    {% endtablerow %}
    
  {% endfor %}
</table>
```
{% endraw %}

Véase <https://github.com/ULL-MFP-AET-2122/static-generator-casiano-rodriguez-alumnoudv5>