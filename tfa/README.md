# Trabajo Fin de Asignatura PL

## Introducción

* Cualquier propuesta relacionada con lo visto en la asignatura es bienvenida.
* Las ideas que se proponen aquí son las de extender el lenguaje [Egg](https://github.com/ULL-ESIT-PL-1819/egg) o el lenguaje de Infijo 
pero puede proponer un TFA con otro tópico relacionado con PL.
* Especial interés puede ser extender Egg o el lenguaje de Infijo con un DSL con funcionalidades para facilitar la resolución de problemas en un contexto específico que sea del interés del alumno
* En cada caso busque en npm librerías que le den apoyo para que la tarea resulte mas fácil
* Estas extensiones deberían estar en módulos separados que extienden Egg usando el patrón [registry-strategy](https://youtu.be/9nMK2yuln_I).
En la asignación encontrará una asignación para un repo auxiliar para el módulo.
* Si necesitas publicar un módulo npm preferiblemente usa [GitHub registry](https://help.github.com/en/articles/about-github-package-registry) en vez de npm.js y publícalo  como paquete privado. 
*  Todos los ejemplos que se muestran aquí con Egg se pueden hacer con cualquiera de los lenguajes Infijo desarrollados en la asignatura

## Programación asincrona en Egg: Primeras Consideraciones

### Promesas en Egg

A estas alturas la máquina Egg puede manejar promesas por cuanto 
que es posible en Egg llamar a los métodos de los objetos JavaScript
y las promesas no son otra cosa que Objetos JS.

Supongamos que extendemos Egg con un objeto `fetch` que implementa la API fetch de JS:

```js
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
    .catch(->{err,
      print(err.message)
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

Me he encontrado con algunos problemas cuando probé a escribir este programa:

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

El problema es que JS llama a la callback
con un solo argumento `err` cuando se produce un error y con dos 
`(err, data)` cuando la operación tiene éxito.

Esta conducta de JS da lugar a que la versión actual de la máquina virtual Egg proteste por cuanto espera que el número de argumentos coincida con el número de parámetros declarados. Desafortunadamente, cuando hay error JS llama a la Egg-callback con un número de argumentos diferente de aquel con el que fue declarada.

La cosa tiene varias soluciones, pero en este momento he optado por la mas rápida que ha sido que Egg no proteste ante llamadas con número de argumentos menor que los que le fueron declarados.

Otro asunto en este ejemplo es que Egg carece del objeto `null` de JS y 
la convención es que JS llama a la callback con `cb(null, data)` para indicar la ausencia de error. De nuevo hay númerosas formas de abordar este asunto, pero una sencilla es advertir a la máquina virtual Egg de la existencia de `null` para que no proteste:

```
topEnv['null'] = null;
topEnv['true'] = true;
...
```

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

## Strategy Pattern: use 

La idea es introducir una función `use` que es parecida a `require` 
pero con la diferencia de que extiende el lenguaje `Egg-aluXX`
mediante una librería escrita en JavaScript. 

Esto es, alguien del mundo mundial, un programador llamado Y entusiasmado por tu lenguaje `Egg-aluXX` 
extiende el lenguaje `egg-aluXX` con una librería llamada `egg-aluXX-tutu` que publica en [npm](http://npmjs.com).  
Y lo ha hecho añadiendo en `specialForms` y `topEnv` nuevas funcionalidades. Puede hacerlo porque importa tu módulo en el que tu exportas los hashes `specialForms` y `topEnv`.

Una sentencia como `use('tutu')` debe hacer que el intérprete `egg` haga un `require` de `egg-aluXX-tutu` (que se supone ha sido previamente instalada en `node_modules/`) y que las funcionalidades exportadas por `egg-aluXX-tutu` estén disponibles al programa Egg.

Como posibles ejemplos de uso, véanse las siguientes 
secciones 

## GitHub Egg

La idea general es extender el lenguaje [Egg](https://github.com/ULL-ESIT-PL-1819/egg) con funcionalidades para la 
manipulación de GitHub

```js
do {
  use('github'),
  Org("ULL-ESIT-PL-1920").then(
    ->(org, # Object describing the org
    do {
      People(org).then[
        ->(people,  # Result is an array of objects with the people in the org
             print(people)
          )
      ] 
    }
}
```

Para implementar la extensión `github` podríamos hacer uso de alguna librería asíncrona como [octokit/rest.js](https://github.com/octokit/rest.js/), [github-api](https://www.npmjs.com/package/github-api), [octonode](https://github.com/pksunkara/octonode) o similar.

## GitHub Egg con Request Síncronos

Todas las librerías de JavaScript para comunicaciones 
suelen ser asíncronas y esto casa mal con la naturaleza de Egg, hasta ahora bastante síncrona.

Una excepción es `sync-request`:

* [sync-request](https://www.npmjs.com/package/sync-request)

Usando [sync-request](https://www.npmjs.com/package/sync-request) podemos diseñar una sintáxis mas simple:

```ruby
do{
    use("../lib/github"),     # Carga el módulo para trabajar con la Api de GitHub
    # setToken(".eggtoken"),  # Token Obtenido en la web de GitHub https://github.com/settings/tokens
    def(me, whoami()),
    print("Teacher: ",me.name),
    print("Teacher's blog:",me.blog),
    :=(pl, org("ULL-ESIT-PL-1920")),
    # print(pl),
    print("Total number of repos in ULL-ESIT-PL-1920: ",pl.total_private_repos),
    print("Number of collaborators in ULL-ESIT-PL-1920: ",pl.collaborators),
    :=(membersPL, members(pl)),
    print("Total members in PL: ",membersPL.length),
    :=(collaboratorsPL, collaborators(pl)),
    print("Total collaborators in PL: ",collaboratorsPL.length),

    :=(inside,
      membersPL.map{->(cv, i, a,
          array[cv.login, cv.url]
        ) # end function
      } # end map
    ),
    print("First and last Members: ", inside[0], element(inside,-1)),
    def(lastCol, element(collaboratorsPL, -1)),
    print("Last collaborator: ", lastCol.login, lastCol.url)
```

Cuando se ejecuta obtenemos:

```
Teacher:  Casiano Rodriguez-Leon
Teacher's blog: https://crguezl.github.io/quotes-and-thoughts/
Total number of repos in ULL-ESIT-PL-1920:  829
Number of collaborators in ULL-ESIT-PL-1920:  54
Total members in PL:  25
Total collaborators in PL:  29
First and last Members:  [ 'Alien-97', 'https://api.github.com/users/Alien-97' ] [ 'victoriamr210', 'https://api.github.com/users/victoriamr210' ]
Last collaborator:  sermg111 https://api.github.com/users/sermg111
```

que nos informa que el Sábado 16/05/2020 tenemos 54 personas y  820 repos en la organización.

Por supuesto es necesario configurar la extensión con un token.
En esta solución hemos optado por poner el token en un fichero de 
configuración para Egg:

```
[~/.../PLgrado/eloquentjsegg(async)]$ tree ~/.egg/
/Users/casiano/.egg/
└── config.json

0 directories, 1 file
[~/.../PLgrado/eloquentjsegg(async)]$ cat ~/.egg/config.json
{
  "github" : {
    "token": "badbadbadbadbadbadbad..."
  }
}
```

* [sync-request](https://www.npmjs.com/package/sync-request)
* [GitHub: Traversing with Pagination](https://developer.github.com/v3/guides/traversing-with-pagination/)
  
## When All is Async and Egg Awaits for Everything

Una manera de simplificar todo el manejo de la asincronía en Egg
es modificar la forma en la que todo se evalúa: Cambiar todos los métodos
`evaluate` para que sean funciones `async` y se haga un `await` en todas 
las llamadas a las evaluaciones. 

Si consigue hacer esta variante, los programas asíncronos se ven altamente simplificados.

Vea como reescribimos nuestro anterior ejemplo de `fetch`:

```
[~/.../src/egg(async)]$ pwd -P
/Users/casiano/local/src/javascript/PLgrado/eloquentjsegg
[~/.../PLgrado/eloquentjsegg(async)]$ cat examples/fetch.egg
```
```ruby
do{
  :=(res, fetch("https://api.github.com/users/github")),
  :=(json, res.json()),
  print(json)
}
```

Veamos el resultado de una ejecución:

```
[~/.../PLgrado/eloquentjsegg(async)]$ bin/egg.js examples/fetch.egg
```
```js
{
  login: 'github',
  id: 9919,
  node_id: 'MDEyOk9yZ2FuaXphdGlvbjk5MTk=',
  avatar_url: 'https://avatars1.githubusercontent.com/u/9919?v=4',
  gravatar_id: '',
  url: 'https://api.github.com/users/github',
  ...
  created_at: '2008-05-11T04:37:31Z',
  updated_at: '2020-02-07T13:08:07Z'
}
```

Esta extensión es un reto difícil. 
Con esta versión el diseño de DSLs que extiendan Egg mediante llamadas a 
librerías asíncronas (como es el caso de accedera a las APIs de GitHub, YouTube, Google Maps, etc.) quedan simplificadas.

## Añadir Herencia entre objetos a Egg

Podría ser mediante un método `child` como este:

```js
do(
  def(x, object ( 
    "c", 0,
    "gc", ->{element[this, "c"]},
    "sc", ->{value, =(this, "c", value)},
    "inc", ->{=(this, "c", +(element[this, "c"],1))}
  )),
  def(y, child(x)),
  print(y.sc(5)),
  print(y.c)
)
```
La declaración `def(y, child(x))` hace que el objeto `y` herede las propiedades y métodos del objeto `x`

## Añadir Clases al Lenguaje de Infijo

Podría tanto en el lenguaje de infijo como en Egg considerar la posibilidad de introducir clases. Sigue un posible ejemplo:


```pascal
class Math
begin
  constructor(x, y)
  begin
    this.x = x;
    this.y = y;
  end;

  method sum();
  begin
    this.x + this.y;
  end;
end

begin /* main */
  let a = new Math(2,3);
  print(a.sum()); // 5
end;
```

## Valores por defecto de los parámetros de una función

Esta extensión consiste en añadir la posibilidad de que los
últimos parámetros de una función tengan valores por defecto y puedan ser omitidos en la llamada:

```js
do {
  def(f, fun(x, default(y, 3)), default(z, 2),
    do {
      print(x+y+z)
    }
  ),
  f(3),      # 8
  f(3, 5),   # 10
  f(3, 1, 9) # 13
}
```

Puede resultarte útil leer este tutorial  [JavaScript Default Parameters](https://www.javascripttutorial.net/es6/javascript-default-parameters/)
si decides abordar esta extensión.

## Calculo Vectorial, Algoritmos Evolutivos, IA, etc.

Las posibilidades son infinitas, tanto para Egg como para el lenguaje de Infijo. Puede añadir funcionalidades que faciliten la escritura 
en determinados dominios: algoritmos evolutivos, 
redes neuronales, estadística, etc.

Un ejemplo simple es extender el lenguaje [Egg](https://github.com/ULL-ESIT-PL-1819/egg) con funcionalidades para el cálculo vectorial

```js
do {
  use('science'),
  :=(v1, arr(4, 5, 9)),
  :=(v2, arr(3, 2, 7)), 
  :=(s, *(+(v1, v2),v2)),
  print(s)
}
```

## Gestor de Tareas

La idea general es extender el lenguaje [Egg](https://github.com/ULL-ESIT-PL-1819/egg) con funcionalidades para la descripción de tareas. Este código sería el contenido de un fichero `eggfile.egg`:

```js
tasks {
  use('tasks'),
  task(compile: sh("gcc hello.c"), depends: "mylib"),
  task(mylib: sh("gcc -c -o mylib.o mylib.c")),
  task(default: "compile")
}
```

## Command line processing 

La idea general es extender el lenguaje [Egg](https://github.com/ULL-ESIT-PL-1819/egg) con funcionalidades para procesar los argumentos dados en línea de comandos (similar a lo que es [commander](https://www.npmjs.com/package/commander) para Node.js):

Por ejemplo para una ejecución como esta:
```
$ example.egg -vt 1000 one.js two.js
```

Tendríamos que escribir `example-egg` siguiendo un patrón como este:

```js
do {
  use('command-line'),
  :=(optionDefinition, arr [
    map { name: 'verbose', alias: 'v', type: Boolean },
    map { name: 'src', type: String, multiple: true, defaultOption: true },
    map { name: 'timeout', alias: 't', type: Number },
    map { name: 'help', alias: 'h', type: Boolean },
  ]),
  :=(options, parseArgs(optionDefinitions)),
  print(options)
    /* options es un map como este:
        {
          src: [
            'one.js',
            'two.js'
          ],
          verbose: true,
          timeout: 1000
        }
    */
}
```

## Plegado de Constantes

Se trata de añadir al compilador de Egg una fase de optimización que haga plegado de constantes.

Por ejemplo, cuando se le da como entrada un programa como este:

```
[.../TFA-04-16-2020-03-22-00/davafons(casiano)]$ cat examples/optimize.egg
```
```ruby
do {
  :=(x, +(*(2, 3), -(5, 1))) # 2 * 3 + (5 - 1) == 10
}
```
Si se compila con la opción `--optimize` de lugar a un plegado de constantes (o en inglés [constant folding](https://en.wikipedia.org/wiki/Constant_folding))

```
[.../TFA-04-16-2020-03-22-00/davafons(casiano)]$ bin/egg.js --optimize -c examples/optimize.egg
```

El código resultante produce un programa equivalente a `:= (x, 10)`:

```
[.../TFA-04-16-2020-03-22-00/davafons(casiano)]$ cat examples/optimize.egg.evm
```
```js
{
  "type": "apply",
  "operator": {
    "type": "word",
    "name": "do"
  },
  "args": [
    {
      "type": "apply",
      "operator": {
        "type": "word",
        "name": ":="
      },
      "args": [
        {
          "type": "word",
          "name": "x"
        },
        {
          "type": "value",
          "value": 10
        }
      ]
    }
  ]
}
```

* [constant folding](https://en.wikipedia.org/wiki/Constant_folding) en la Wikipedia
* Puede usar [estraverse](https://github.com/estools/estraverse) para recorrer el AST buscando por árboles constantes

## Scope Analysis

Aunque el lenguaje  Egg dispone de ámbitos, los errores de ámbito (variables no declaradas) solo se detectan en tiempo de ejecución:

```ruby
[.../TFA-04-16-2020-03-22-00/davafons(casiano)]$ cat examples/set-error-compile.egg
set(x, 4)
```

Si lo ejecutamos nos da un  run-time error:

```
[.../TFA-04-16-2020-03-22-00/davafons(casiano)]$ bin/egg.js examples/set-error-compile.egg
ReferenceError: Tried setting an undefined variable: x
```

De lo que se trata aquí es de detectar los errores lo mas temprano posible, antes de que se ejecute el programa recorriendo el AST y buscando los nodos de usos de *words* que no han sido definidos en un ámbito superior:

```
[.../TFA-04-16-2020-03-22-00/davafons(casiano)]$ bin/egg.js -c examples/set-error-compile.egg
ReferenceError: Trying to use the undefined symbol x
```

En esta variante de Egg la opción `-c` usada compila el programa pero no lo ejecuta. 

En esta fase de análisis de ámbito también se pueden comprobar algunos otros tipos de errores de uso. Por ejemplo si extendieramos Egg con declaraciones `const` para constantes, 
podemos recorrer el AST comprobando que no se hace ningún intento de modificación (`set`) de esa variable en su ámbito de declaración.

* Vea el Capítulo [Análisis del Contexto]({{site.baseurl}}/tema6-analisis-dependiente-del-contexto/) en estos apuntes

## Syntax Highlighting for VSCode

Proveer Syntax Highlight en Visual Code para Egg. Véase
[Syntax Highlight Guide](https://code.visualstudio.com/api/language-extensions/syntax-highlight-guide)

## Compilador de Egg a JS

Escribir un traductor (no un intérprete) desde Egg a JavaScript.

A continuación un ejemplo borrador (¡sin contrastar!) de como podría ser el esquema de traducción:

### input1.egg

Supongamos la entrada:

```ruby
do(
  def(x, *(4,2)),
  print(+(x,1))
)
```

Daría una salida como esta

### output1.js

```js
let {sf, te} = require('egg-run-time');
// te es el "topenv" previamente poblado con constantes y variables como "true", "false", etc.
let ce = Object.create(te); // current environment

sf["do"](
  sf["def"]("x", sf["*"](4, 2, ce), ce), 
  sf["print"](sf["+"]("x", 1, ce), ce),
  ce
)
```

### Input2.egg

```ruby
do(
  def(f, fun(x, +(x,1))),
  f(4)
)
```

### output2.js

```js
let {sf, te} = require('egg-run-time');
let ce = Object.create(te); // current environment

sf["do"](
  sf["def"]("f", 
      (x, e) => {
        let le = Object.create(e);
        le["x"] = x;
        return sf["+"]("x", 1, le)
    }, ce)
  , ce),
  sf["f"](4, ce)
, ce)
```

## Recursos

* [Book *The Modern Javascript Tutorial*. Chapter Promises, async/await](https://javascript.info/async)
* Vídeo [Cómo funciona Async/Await en menos de 15 minutos](https://youtu.be/u2axmPnxUoo) YouTube Vídeo por Appdelante
