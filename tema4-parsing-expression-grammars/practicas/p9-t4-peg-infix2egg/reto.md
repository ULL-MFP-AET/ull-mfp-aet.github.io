## Reto: p9-t4-peg-infix2egg

Añada objetos y la notación `.` a su lenguaje de infijo. Algo similar 
a esto:

```js
begin
  let x = { 
    c:   0,
    gc:  function() { c },
    sc:  function(value) { c = value},
    inc: function{ c =  c+1 }
  };
  print(x.c);     // 0
  print(x.gc());  // 0
  print(x.sc(5)); // 5
  print(x.gc())   // 5
end

```

### Recursos

#### PEGs

* [Un ejemplo breve de como hacer esta práctica: pegjs-infix-2-egg](https://github.com/ULL-ESIT-PL-1718/pegjs-infix-2-egg)
* [PEGs](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pegjs/PEGS.html) Viejos apuntes del profesor
* [PEG.js](https://pegjs.org/documentation) PEG.js Documentation

#### Egg

* [El lenguaje egg: repo en GitHub](https://github.com/ULL-ESIT-PL-1617/egg)
* [Eloquent JS: Chapter 11. Project: A Programming Language](http://eloquentjavascript.net/11_language.html)
* [Repo interpreter-egg](https://github.com/ULL-ESIT-PL-1617/interpreter-egg)
* [NodeJS Readline gist](https://gist.github.com/crguezl/430642e29a2b9293317320d0d1759387)

### PDR

* [Apuntes de PL: Análisis Sintáctico Predictivo Recursivo](http://crguezl.github.io/pl-html/node22.html)

#### Testing

* [Mocha](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pruebas/mocha.html)
* [Chai](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pruebas/chai.html)
* [Covering](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pruebas/covering.html)
* [Blanket](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/pruebas/blanket.html)

#### Jison

* [Jison Documentation](http://zaa.ch/jison/docs/)
* [Folder jison/examples from the Jison distribution](https://github.com/zaach/jison/tree/master/examples)
* [Repo ULL-ESIT-PL-1718/jison-aSb](https://github.com/ULL-ESIT-PL-1718/jison-aSb)
* [Repo ULL-ESIT-PL-1718/ull-etsii-grado-pl-jisoncalc](https://github.com/ULL-ESIT-PL-1718/ull-etsii-grado-pl-jisoncalc)

