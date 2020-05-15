
## Consideraciones sobre la programación asincrona en Egg

### Promesas en Egg

A estas alturas la máquina Egg puede manejar promesas por cuanto 
que es posible en Egg lamar a los métodos de los objetos JavaScript.

Supongamos que extendemos Egg con un objeto `fetch` que impelemnta la API fetch de JS:

```
topEnv['fetch'] = require('node-fetch');
```

Inmediatamente podemos escribir programas Egg como este:

```
[~/.../egg/crguezl-egg(private2019)]$ cat examples/fetch.egg
```
```js
do{
  fetch("https://api.github.com/users/github")
    .then(->{res, res.json()})
    .then(->{json,
      print(json)
    })
}
```

Al ejecutarlo obtenemos:

```js
[~/.../egg/crguezl-egg(private2019)]$ bin/egg.js examples/fetch.egg
{
  login: 'github',
  id: 9919,
  node_id: 'MDEyOk9yZ2FuaXphdGlvbjk5MTk=',
  ...
  created_at: '2008-05-11T04:37:31Z',
  updated_at: '2020-02-07T13:08:07Z'
}
```

### Callbacks en Egg

Veamos un ejemplo de asíncronía en Egg con callbacks.
Extendamos Egg con un objeto que provee acceso al sistema de
archivos:

```
topEnv['fs'] = require('fs');
```

Entonces pobamos a escribir un programa como este:

```js
[~/.../egg/crguezl-egg(private2019)]$ cat examples/fs.egg
do {
  fs.readFile("examples/no-existe.egg", "utf8",
    fun{err, data,
      if[==(err, null), print(data), print(err)]
    }),
  fs.readFile("examples/fs.egg", "utf8",
    fun{err, data,
      if[==(err, null), print(data), print(err)]
    })
}
```
El problema que me he encontrado es que JS llama a la callback
con un solo argumento `err` cuando se produce un error y con dos 
`(err, data)` cuando la operación tiene éxito.

Esta conducta de JS da lugar a que la máquina virtual Egg proteste por cuanto cuando hay error JS llama a la Egg-callback con un número de argumentos diferente de aquel con el que fue declarada.

La cosa tiene varias soluciones, pero en este momento he optado por la mas rápida que ha sido que Egg no proteste ante llamadas con número de argumentos menor que los que le fueron declarados.

Sigue un ejemplo de ejecución:

```js
[~/.../egg/crguezl-egg(private2019)]$ bin/egg.js examples/fs.egg
[Error: ENOENT: no such file or directory, open 'examples/no-existe.egg'] {
  errno: -2,
  code: 'ENOENT',
  syscall: 'open',
  path: 'examples/no-existe.egg'
}
do {
  fs.readFile("examples/no-existe.egg", "utf8",
    fun{err, data,
      if[==(err, null), print(data), print(err)]
    }),
  fs.readFile("examples/fs.egg", "utf8",
    fun{err, data,
      if[==(err, null), print(data), print(err)]
    })
}
```