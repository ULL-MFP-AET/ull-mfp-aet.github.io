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
$$a \times x ^2 = y_j$$

See the [References section in this notes about $$\LaTeX$$]({{site.baseurl}}/references.html#referencias-sobre-latex)