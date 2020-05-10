# Un Lenguaje Dependiente del Contexto

El lenguaje $$\{ a^n b^n c^n / n \in \mathcal{N} \}$$ no puede ser
expresado mediante una gramática independiente del contexto.

    [~/srcPLgrado/pegjs/examples(master)]$ cat anbncn.pegjs 
    /*
      The following parsing expression grammar describes the classic 
      non-context-free language : 
                   { a^nb^nc^n / n >= 1 }
    */

    S = &(A 'c') 'a'+ B:B !.  { return B; }
    A = 'a' A:A? 'b' { if (A) { return A+1; } else return 1; }
    B = 'b' B:B? 'c' { if (B) { return B+1; } else return 1; }

Veamos un ejemplo de uso:

```js
    [~/srcPLgrado/pegjs/examples(master)]$ cat use_anbncn.js 
    #!/usr/bin/env node
    var PEG = require("./anbncn.js");

    if (process.argv.length > 2) {
      try {
        var r = PEG.parse(process.argv[2]);
        console.log("ok "+JSON.stringify(r));
      }
      catch (e) {
        console.log("Grr...."+e);
      }
      process.exit(0);
    }
    var inputs = ["aabbcc", 
                  "aabbc",     // error
                  "aaabbbccc",
                  "aaaabbbccc"  // not accepted
                 ];

    for(var i = 0; i < inputs.length; i++) {
      var input = inputs[i];
      try {
        var r = PEG.parse(input);
        console.log("ok "+JSON.stringify(r));
      }
      catch (e) {
        console.log("Grr...."+e);
      }
    }
```

Ejecución:

    [~/srcPLgrado/pegjs/examples(master)]$ node use_anbncn.js
    ok 2
    Grr....SyntaxError: Expected "c" but end of input found.
    ok 3
    Grr....SyntaxError: Expected undefined but "a" found.

