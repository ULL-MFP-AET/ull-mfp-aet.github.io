
Despúes de conseguido el requisito anterior nos encontramos con un problema:

1. `bin/eggc prog.egg` produce como salida un JSON `prog.egg.evm` conteniendo la estructura del árbol descrita en JSON
2. Cuando ejecutamos `bin/eggvm prog.egg.evm` falla porque la estructura del JSON es plana y ahora `evaluate` es un método
definido en las clases de nodos `VALUE`, `WORD`y `APPLY`

Escriba una función `json2AST` que convierta la estructura de datos plana en un AST en los que cada nodo pertenece a la clase correspondiente 
Modifique la función `runFromEVM` que ejecuta el código de la máquina virtual para que siga funcionando. 


