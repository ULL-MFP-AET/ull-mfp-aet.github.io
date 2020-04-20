# Expresiones en el operator

Práctica sin definir. Idea a desarrollar.

## Gramática

``
expression: (STRING | NUMBER | opexpression apply 

apply: /* vacio */
     | '(' (expression ',')* expression? ')' apply

oppexpression: WORD | '(' expression ')'
``` 

## Ejemplos

do {
  def(g, fun{x, +[x,1]}),
  def(h, fun{z, *[z,3]}),
  print((*(h,g))(9)) # 30 si *(h,g) se define como g(h(x))
}