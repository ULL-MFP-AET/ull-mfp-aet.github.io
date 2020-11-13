<!-- Example data like: https://gist.github.com/ThoMo/fb3cb24dc8d14a53af97 -->

# Glossary

{% assign gs = site.data.glossary | sort:[0] %}
{% for kv in gs %}
### {{ kv[0] }} 

{{ kv[1] | markdownify }} 

{% endfor %}
