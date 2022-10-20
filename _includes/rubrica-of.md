  {% assign ghce-page = site.pages | where: "permalink", include.link | first -%}
  {%- for sec in ghce-page.rubrica -%}
  * {{ sec }}
  {% endfor %}