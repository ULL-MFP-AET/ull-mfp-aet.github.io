---
layout: default
title: p04-t0-aprender-jekyll
permalink: /tema0-introduccion/practicas/p04-t0-aprender-jekyll/index.html
myurl: https://campusdoctoradoyposgrado.ull.es/mod/assign/view.php?id=282487&forceview=1
name: Aprender Jekyll
date: 0000/01/06
---

# Aprendiendo Jekyll (p04-t0-aprender-jekyll)

Partiendo del [repl.it](https://repl.it) que creó en la práctica anterior, vamos a profundizar en el generador de web sites y blogs estáticos ([Jekyll](jekyllrb.com)).

Siga estos pasos:


## En Repl.it

* Renombre su repl.it en que trabajó en la práctica anterior [p03-t0-aprender-ide]({{site.baseurl}}//tema0-introduccion/practicas/p03-t0-aprender-ide/) como `p03-t0-aprender-ide`
* Haga un fork de su repl.it en que trabajó en la práctica anterior [p03-t0-aprender-ide]({{site.baseurl}}//tema0-introduccion/practicas/p03-t0-aprender-ide/)

  ![]({{site.baseurl}}/assets/images/replit-fork.png)
* Renómbrelo al nombre de esta práctica `p04-t0-aprender-jekyll`
* A partir de ahora trabajaremos en este replit


## Objetivos

* Modifique el projecto para que sea un web site para la asignatura que piensa desarrollar en su TFM y en sus Prácticas en Centros. En el directorio `_posts` escriba varias lecciones de  prueba. Algo así:

  ```
  ~/.../aet2021/apuntes(master)]$ tree _posts
  _posts
  ├── 2020-11-03-leccion.md
  ├── 2020-11-05-leccion.md
  ├── 2020-11-10-leccion.md
  ├── 2020-11-12-leccion.md
  └── 2020-11-17-leccion.md
  ```
* Recuerde poner el front-matter en sus posts. Especifique al menos el `layout` y el `title`.
  
  ```
    ---
    layout: post
    title:  "Clase del Jueves 12/11/2020"
    ---
  ```
* Defina una [collection](https://jekyllrb.com/docs/collections/) `temas` para los temas que va a impartir y ponga algún contenido
* Defina una [collection](https://jekyllrb.com/docs/collections/) `tareas` para las tareas que va a asignarles a sus alumnos y añádales algún contenido
* Aisle los datos en el directorio `_data` en un fichero JSON o yml de manera que el web site sea fácilmente modificable para adaptarlo a otra asignatura

## An Introduction to Jekyll Collections

{% capture jekyll_collections %}
  {% include jekyll-collections.md %}
{% endcapture %}

<!-- Use a character as º to mark the substitution points, that does no appear in any other part of the document -->
{{ jekyll_collections | replace: 'º#', '###' }}

<!--

* Haga un fork de este replit: [https://repl.it/@crguezl/JekyllBlog#main.sh](https://repl.it/@crguezl/JekyllBlog#main.sh) o bien duplique el de la última práctica
* Aquí tiene un ejemplo de CV usando Jekyll por Biagio Brattoli:
  * [Repo en GitHub](https://github.com/bbrattoli/bbrattoli.github.io)
  * [Despliegue en GitHub Pages](https://bbrattoli.github.io/)
* Aquí tienes otro ejemplo de CV
  * [Repo en GitHub](https://github.com/ddbullfrog/resumecard)
  * [Despliegue](https://ddbullfrog.github.io/resumecard/)
* Usando [git](https://git-scm.com/) clone en el directorio `site` el repo [bbrattoli/bbrattoli.github.io](https://github.com/bbrattoli/bbrattoli.github.io). Puede hacerlo en la terminal:

  ```
    $ rm -fR site
    $ git clone https://github.com/bbrattoli/bbrattoli.github.io.git site
    Cloning into 'site'...
    remote: Enumerating objects: 2119, done.
    remote: Total 2119 (delta 0), reused 0 (delta 0), pack-reused 2119
    Receiving objects: 100% (2119/2119), 4.17 MiB | 10.23 MiB/s, done.
    Resolving deltas: 100% (482/482), done.
  ```

* Lea la documentación en [jekyllrb.com](https://jekyllrb.com) y vaya modificando los ficheros en `_data`, `_config.yml` etc. para personalizarlo como su CV.
-->

## Maths

$$\LaTeX$$ is a free professional typesetting, that it is the standard for scientific  documents.

To use the  $$\LaTeX$$ language in your `posts`, `temas` or `tareas` collections or in any document, you can make use
of [MathJax](https://quuxplusone.github.io/blog/2020/08/19/mathjax-v3-in-jekyll/) and insert in your layout file `_layouts/default.yml` a line like this one:

```html
<!-- Mathjax Support  -->
<!-- MathJax version 3 -->
<script type="text/javascript">
window.MathJax = {
tex: {
    packages: ['base', 'ams']
},
loader: {
    load: ['ui/menu', '[tex]/ams']
}
};
</script>

<script type="text/javascript" id="MathJax-script" async
src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-chtml.js">
</script>
```

Now you can use LaTex formulas everywhere in your website:

```
You can insert some formula $$f(x) = \int_{-\infty}^\infty \hat f(\xi)\,e^{2 \pi i \xi x} \,d\xi$$ in the middle of a sentence.

You can also put large formulas in their own paragraph.

$$f(x) = \int_{-\infty}^\infty \hat f(\xi)\,e^{2 \pi i \xi x} \,d\xi$$

$$mean = \frac{\displaystyle\sum_{i=1}^{n} x_{i}}{n}$$
```

You can insert some formula $$f(x) = \int_{-\infty}^\infty \hat f(\xi)\,e^{2 \pi i \xi x} \,d\xi$$ in the middle of a sentence.

You can also put large formulas in their own paragraph.

$$f(x) = \int_{-\infty}^\infty \hat f(\xi)\,e^{2 \pi i \xi x} \,d\xi$$

$$mean = \frac{\displaystyle\sum_{i=1}^{n} x_{i}}{n}$$

See the [References section in this notes about \LaTeX]({{site.baseurl}}/references.html#referencias-sobre-latex)

## Data. Converting yml to json

* [js-yaml](https://www.npmjs.com/package/js-yaml)
  - `npx js-yaml data.yml > data.json` converts from .yml to .json
{% include jekyll-references.md %}
  
## La Entrega

{% include entrega.md %}

## Referencias

See the section [References]({{site.baseurl}}/references) in this notebook

<!--
* [Repl.it Tutorial MAKE A BLOG USING JEKYLL](https://repl.it/talk/learn/GUIDE-MAKE-A-BLOG-USING-JEKYLL-POG-ALERT-KEK-HAHAYES-ENDORSED/59021)
  * [Repl de ejemplo](https://repl.it/@sourcerose/JekyllBlog#main.sh)
  * [Repo en GitHub](https://github.com/barryclark/jekyll-now.git)
* [Understanding the Repl.it IDE: a practical guide to building your first project with Repl.it](https://www.codewithrepl.it/01-introduction-to-the-repl-it-ide.html)
* [Repl.it Quick Start Guide](https://docs.repl.it/misc/quick-start)
* Documentación en [jekyllrb.com](https://jekyllrb.com)
* Ejemplo de CV de Biagio Brattoli usando Jekyll:
  * [Repo en GitHub](https://github.com/bbrattoli/bbrattoli.github.io)
  * [Despliegue en GitHub Pages](https://bbrattoli.github.io/)
* [Free Jekyll Themes](https://jekyllthemes.io/free)
-->
