# Egg Initial Syntax

```
expression: (STRING | NUMBER | WORD) apply 

apply: /* vacio */
     | '(' (expression ',')* expression? ')' apply
```

# Token definitions

```
WHITES = /^(\s|#.*)*/
STRING = /^"([^"]*)"/
NUMBER = /^\d+\b/
WORD   = /^[^\s(),"]+/
```
