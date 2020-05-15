# Trabajo Fin de Asignatura PL

## Introducción

* Cualquier propuesta relacionada con lo visto en la asignatura es bienvenida.
* Las ideas que se proponen aquí son las de extender el lenguaje [Egg](https://github.com/ULL-ESIT-PL-1819/egg)
pero puede proponer un TFA con otro tópico relacionado con PL.
  * Especial interés puede ser en extender Egg  con un DSL con funcionalidades para 
  facilitar la resolución de problemas en un contexto específico que sea del interés del alumno
  * En cada caso busque en npm librerías que le den apoyo para que la tarea resulte mas fácil
  * Estas extensiones debería estar en módulos separados que extienden Egg usando el patrón [registry-strategy](https://youtu.be/9nMK2yuln_I)
*  Todo lo que se dice aquí sobre Egg se puede hacer con cualquiera de los lenguajes Infijo desarrollados en la asignatura
* Si necesitas publicar un módulo npm usa [GitHub registry](https://help.github.com/en/articles/about-github-package-registry) en vez de npm.js y publícalo  como paquete privado. 


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

## Extensión de Egg con `use`

La idea es introducir una función `use` que es parecida a `require` 
pero con la diferencia de que extiende el lenguaje `Egg-aluXX`
mediante una librería escrita en JavaScript. 

Esto es, alguien del mundo mundial, un programador llamado Y entusiasmado por tu lenguaje `Egg-aluXX` 
extiende el lenguaje `egg-aluXX` con una librería llamada `egg-aluXX-tutu` que publica en [npm](http://npmjs.com).  
Y lo ha hecho añadiendo en `specialForms` y `topEnv` nuevas funcionalidades. Puede hacerlo porque importa tu módulo en el que tu exportas los hashes `specialForms` y `topEnv`.

Una sentencia como `use('tutu')` debe hacer que el intérprete `egg` haga un `require` de `egg-aluXX-tutu` (que se supone ha sido previamente instalada en `node_modules/`) y que las funcionalidades exportadas por `egg-aluXX-tutu` estén disponibles al programa Egg.

Como posibles ejemplos de uso, véanse las siguientes 
secciones 

## Asincronía en Egg: Una librería para la API de GitHub

La idea general es extender el lenguaje [Egg](https://github.com/ULL-ESIT-PL-1819/egg) con funcionalidades para la 
manipulación de GitHub

```js
do {
  use('github'),
  Org("ULL-ESIT-PL-1819").then(
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

Un problema con el que se encontrará a la hora de extender Egg es la asincronía de la mayor parte de las librerías JavaScript
que va a usar, que casan mal con la naturaleza síncrona de Egg.

Por ejemplo, para implementar la extensión `github` deberá de hacer uso de una librería asíncrona
como [octokit.js](https://www.npmjs.com/package/octokit) o similar.


## Ejemplo: Egg para Calculo Científico

La idea general es extender el lenguaje [Egg](https://github.com/ULL-ESIT-PL-1819/egg) con funcionalidades para el cálculo científico

```js
do {
  use('science'),
  :=(v1, arr(4, 5, 9)),
  :=(v2, arr(3, 2, 7)), 
  :=(s, +(v1, v2)),
  print(s)
}
```

## Ejemplo: Egg para Describir Tareas

La idea general es extender el lenguaje [Egg](https://github.com/ULL-ESIT-PL-1819/egg) con funcionalidades para la descripción de tareas. Este código sería el contenido de un fichero `eggfile.egg`:

```js
tasks {
  use('tasks'),
  task(compile: sh("gcc hello.c"), depends: "mylib"),
  task(mylib: sh("gcc -c -o mylib.o mylib.c")),
  task(default: "compile")
}
```

## Ejemplo: Command line processing 

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

## Entrega

Añada como submódulos del repo de entrega todos los repos adicionales que haya tenido que crear 
para la realización de esta tarea

## Recursos

* [Book *The Modern Javascript Tutorial*. Chapter Promises, async/await](https://javascript.info/async)
* Vídeo [Cómo funciona Async/Await en menos de 15 minutos](https://youtu.be/u2axmPnxUoo) YouTube Vídeo por Appdelante

## Table of Contents

- [Trabajo Fin de Asignatura PL](#trabajo-fin-de-asignatura-pl)
  - [Introducción](#introducci%c3%b3n)
  - [Añadir Herencia entre objetos a Egg](#a%c3%b1adir-herencia-entre-objetos-a-egg)
  - [Añadir Clases al Lenguaje de Infijo](#a%c3%b1adir-clases-al-lenguaje-de-infijo)
  - [Extensión de Egg con `use`](#extensi%c3%b3n-de-egg-con-use)
  - [Asincronía en Egg: Una librería para la API de GitHub](#asincron%c3%ada-en-egg-una-librer%c3%ada-para-la-api-de-github)
  - [Ejemplo: Egg para Calculo Científico](#ejemplo-egg-para-calculo-cient%c3%adfico)
  - [Ejemplo: Egg para Describir Tareas](#ejemplo-egg-para-describir-tareas)
  - [Ejemplo: Command line processing](#ejemplo-command-line-processing)
  - [Entrega](#entrega)
  - [Recursos](#recursos)
  - [Table of Contents](#table-of-contents)

