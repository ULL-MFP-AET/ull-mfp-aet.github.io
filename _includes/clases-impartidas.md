  {%- assign previousMonth = "0" %}
  {%- for post in site.categories["leccion"] %}
     {%- assign currentMonth = post.date | date: "%B" %}
      {%- if currentMonth != previousMonth %}
### Classes during the month of {{ currentMonth }}
      {%- endif %}
* [{{ post.title }}]({{site.baseurl}}{{ post.url }})  [📝]({{site.organization.master}}/{{post.path}})
  {%- if post.video %} 
  * [Vídeo]({{post.video}}) 
  {%- endif %}
      {%- assign previousMonth = currentMonth %}
  {%- endfor %}
