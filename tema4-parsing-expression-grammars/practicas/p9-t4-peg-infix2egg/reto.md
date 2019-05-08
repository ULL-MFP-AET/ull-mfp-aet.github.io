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

* Volver a la [Práctica: Reescribir el Compilador de Infijo a Egg usando PEG.js (p9-t4-peg-infix2egg)](index.html)

