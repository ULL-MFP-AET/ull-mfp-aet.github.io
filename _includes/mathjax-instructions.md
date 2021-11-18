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

We can leave it in one of the layouts and it will work.

However, the minimal mistakes template we are using is a bit picky about best practices.
Let us follow the recommendations:

```diff
➜  static-generator-casiano-rodriguez-alumnoudv5 git:(ensayo-2021-11-11) git diff master  _config.yml 
diff --git a/_config.yml b/_config.yml
index 227de30..115b9c5 100644
--- a/_config.yml
+++ b/_config.yml
@@ -149,6 +149,9 @@ footer:
       icon: "fab fa-fw fa-instagram"
       # url:
 
+footer_scripts:
+  - /assets/js/mathjax-configure.js
+  - "https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-chtml.js"
```

`➜  static-generator-casiano-rodriguez-alumnoudv5 git:(ensayo-2021-11-11) cat assets/js/mathjax-configure.js `

```js
window.MathJax = {
tex: {
    packages: ['base', 'ams']
},
loader: {
    load: ['ui/menu', '[tex]/ams']
}
};

<script type="text/javascript" id="MathJax-script" async
src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-chtml.js">
</script>
```


Now you can use LaTex formulas everywhere in your website:

`➜  static-generator-casiano-rodriguez-alumnoudv5 git:(ensayo-2021-11-11) git diff master  profesion/_posts/2021-11-11-matematicas.md`


```diff
diff --git a/profesion/_posts/2021-11-11-matematicas.md b/profesion/_posts/2021-11-11-matematicas.md
new file mode 100644
index 0000000..1c2ef8a
--- /dev/null
+++ b/profesion/_posts/2021-11-11-matematicas.md
@@ -0,0 +1,11 @@
+
+---
+---
+
+You can insert some formula $$f(x) = \int_{-\infty}^\infty \hat f(\xi)\,e^{2 \pi i \xi x} \,d\xi$$ in the middle of a sentence.
+
+You can also put large formulas in their own paragraph.
+
+$$f(x) = \int_{-\infty}^\infty \hat f(\xi)\,e^{2 \pi i \xi x} \,d\xi$$
+
+$$mean = \frac{\displaystyle\sum_{i=1}^{n} x_{i}}{n}$$
\ No newline at end of file
```

You can insert some formula $$f(x) = \int_{-\infty}^\infty \hat f(\xi)\,e^{2 \pi i \xi x} \,d\xi$$ in the middle of a sentence.

You can also put large formulas in their own paragraph.

$$a \times x ^2 = y_j$$

$$f(x) = \int_{-\infty}^\infty \hat f(\xi)\,e^{2 \pi i \xi x} \,d\xi$$

$$mean = \frac{\displaystyle\sum_{i=1}^{n} x_{i}}{n}$$

See the [References section in this notes about $$\LaTeX$$]({{site.baseurl}}/references.html#referencias-sobre-latex)

Véase También: 

* [Adding MathJax to a GitHub Pages Jekyll Blog](http://sgeos.github.io/github/jekyll/2016/08/21/adding_mathjax_to_a_jekyll_github_pages_blog.html)
* [El código en estos apuntes que activa MathJax](https://github.com/ULL-MFP-AET-2122/ull-mfp-aet-2122.github.io/blob/main/_layouts/default.html#L21-L35)
* El repo <https://github.com/crguezl/template-latex-markdown> 
