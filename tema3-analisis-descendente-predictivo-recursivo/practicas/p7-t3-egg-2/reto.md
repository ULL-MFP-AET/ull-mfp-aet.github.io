# set con expresiones en la parte izquierda

```ruby
do {
  def (x, array[array[1,2],array[3,4]]),
  set(x[0], 9), # [9, [3,4]]
  
  def(y, map{x:4, y: [0,7]}),
  set(y["y"][1], 9), # map{x:4, y: [0,9]}

  def(z, object({c:4, g: fun(a, set(this.c, a))}))
}
```

¿Que deberìamos hacer?

¿Tener un leftEvaluate por cada clase de AST?