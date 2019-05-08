## Reto: p9-t4-peg-infix2egg

Añada expresiones regulares a su lenguaje infijo

```js
begin
  d :=  /
         (?<year>  \d{4} ) -?  # year
         (?<month> \d{2} ) -?  # month
         (?<day>   \d{2} )     # day
        /x;
  print(d.test("1987-07-14"))  # true
end
```


### Recursos

* [Práctica: Reescribir el Compilador de Infijo a Egg usando PEG.js (p9-t4-peg-infix2egg)](index.html)
* [pegjs-infix-2-egg](https://github.com/ULL-ESIT-PL-1718/pegjs-infix-2-egg)
* [PEGs](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pegjs/PEGS.html) Viejos apuntes del profesor
* [PEG.js](https://pegjs.org/documentation) PEG.js Documentation
* [El lenguaje egg: repo en GitHub](https://github.com/ULL-ESIT-PL-1617/egg)
* [Eloquent JS: Chapter 11. Project: A Programming Language](http://eloquentjavascript.net/11_language.html)
* [Repo interpreter-egg](https://github.com/ULL-ESIT-PL-1617/interpreter-egg)
* [NodeJS Readline gist](https://gist.github.com/crguezl/430642e29a2b9293317320d0d1759387)
* [Apuntes de PL: Análisis Sintáctico Predictivo Recursivo](http://crguezl.github.io/pl-html/node22.html)
* [Mocha](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pruebas/mocha.html)
* [Chai](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pruebas/chai.html)
* [Covering](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pruebas/covering.html)
* [Blanket](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pruebas/blanket.html)


