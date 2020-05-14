## Reto: p10-t5-jison-infix2egg

Añada objetos y el punto/dot `.` a su lenguaje de infijo. Algo similar 
a esto:

```pascal
begin
  let a = {
    c:1,
    gc: function() { this.c },
    sc: function(val) { c = val },
    inc: function() { this.c = this.c+1 }
  };
  print(a.c); # 1
  a.sc(4);
  print(a.c); # 4
  a.inc(); 
  print(a.c)  # 5
end
```

Debería ser posible combinar tanto en el lado izquierdo de una asignación como en el derecho los operadores punto y de indexación.
Esto es, poder escribir expresiones como:

`a[x+y].c[4].d = b[i][j].z`

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



