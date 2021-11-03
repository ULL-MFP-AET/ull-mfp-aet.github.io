---
layout: default
title: LaTeX y Markdown
permalink: tareas/latex-y-markdown
name: LaTeX y Markdown
date: 0000/01/05
---


En esta tarea aprenderemos las bases para generar un pdf conteniendo un documento científico técnico usando  markdown y latex. $$\LaTeX$$ is a free professional typesetting, that it is the standard for scientific  documents.


## Using $$\LaTeX$$  in your Web Site

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

## $$\LaTeX$$ para generar un pdf


1. Abra una cuenta en overleaf
2. Pruebe a usar los contenidos de este repo en overleaf
3. Abra este repo en GitPod
4. Empiece a extender lo que hemos aprendido para ir diseñando el documento par a la memoria de TFM

{% include latex-references.md %}



