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

Este es el repo <https://github.com/crguezl/template-latex-markdown> usado como plantilla para esta tarea.

Véase También: 

* [Adding MathJax to a GitHub Pages Jekyll Blog](http://sgeos.github.io/github/jekyll/2016/08/21/adding_mathjax_to_a_jekyll_github_pages_blog.html)
* [El código en estos apuntes que activa MathJax](https://github.com/ULL-MFP-AET-2122/ull-mfp-aet-2122.github.io/blob/main/_layouts/default.html#L21-L35)
