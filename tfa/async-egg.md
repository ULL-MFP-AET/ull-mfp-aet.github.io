
## Consideraciones sobre la programación asincrona en Egg

### Promesas en EGg

Ejemplo de manejo de la programación asíncrona en Egg.

```
topEnv['fetch'] = require('node-fetch');
```

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

```
topEnv['fs'] = require('fs');
```

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

To make this example to work I
Removed the fact that the number of parameters must be equal to the number of arguments in a call.

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