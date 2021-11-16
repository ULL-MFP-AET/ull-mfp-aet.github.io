# Data

Véase el tutorial [Tabulate CSV Data](https://jekyllrb.com/tutorials/csv-to-table/)

Puede descargarse el fichero <https://github.com/ULL-MFP-AET-2122/static-generator-casiano-rodriguez-alumnoudv5/blob/84ed8b73ea8c3848dc7e0cffaf866f9cbff96e7c/_data/calificaciones.csv> en el directorio `_data` de <https://github.com/ULL-MFP-AET-2122/static-generator-casiano-rodriguez-alumnoudv5/tree/ensayo-2021-11-10> de la rama `ensayo-2021-11-10`

### Inspeccionando site.data 


{% raw %}
```liquid
{% assign row = site.data.calificaciones[0] %}
{% for p in row %}
  {{ p | inspect }}
{% endfor %}
```
{% endraw %}


![]({{site.baseurl}}/assets/images/jekyll-inspect-filter.png)

### Creando una Tabla en HTML


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

* [tablerow iteration](https://shopify.dev/api/liquid/tags/iteration-tags#tablerow)
* [tablerow object](https://liquidjs.com/tags/tablerow.html)

Véase <https://github.com/ULL-MFP-AET-2122/static-generator-casiano-rodriguez-alumnoudv5>