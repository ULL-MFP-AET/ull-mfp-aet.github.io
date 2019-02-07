# Práctica p0-t0-esprima-logging

En clase hemos visto el programa `logging.js` que cuando se ejecuta modifica el código de entrada 
produciendo como salida un código que inserta  mensajes de `console.log` a la entrada de cada 
función:

```js
~/campus-virtual/1819/pl1819/introduccion/tema0-introduccion-a-pl/practicas/code(master)]$ node logging.js
input:

function foo(a, b) {
  var x = 'blah';
  var y = (function () {
    return 3;
  })();
}
foo(1, 'wut', 3);

---
output:
function foo(a, b) {
    console.log('Entering foo()');
    var x = 'blah';
    var y = function () {
        console.log('Entering <anonymous function>()');
        return 3;
    }();
}
foo(1, 'wut', 3);
---
```

Este es el código de `logging.js`: 

```js
let escodegen = require('escodegen');
let esprima = require('espree');
let estraverse = require('estraverse');

function addLogging(code) {
    let ast = esprima.parse(code);
    estraverse.traverse(ast, {
        enter: function(node, parent) {
            if (node.type === 'FunctionDeclaration' ||
                node.type === 'FunctionExpression') {
                addBeforeCode(node);
            }
        }
    });
    return escodegen.generate(ast);
}

function addBeforeCode(node) {
    let name = node.id ? node.id.name : '<anonymous function>';
    let beforeCode = `console.log('Entering ${name}()');`;
    let beforeNodes = esprima.parse(beforeCode).body; // Is an Array of ASTs
    node.body.body = beforeNodes.concat(node.body.body);
}

const input = `
function foo(a, b) {
  var x = 'blah';
  var y = (function () {
    return 3;
  })();
}
foo(1, 'wut', 3);
`;

const output = addLogging(input);

console.log(`input:\n${input}\n---`);
console.log(`output:\n${output}\n---`);
```

Se pide:

1. [Acepte la asignación Classroom de esta tarea](https://classroom.github.com/a/GL7rmVu0)
2. Rellene su entrada en este formulario poniendo su código de github junto a su alu: [formulario a rellenar](https://docs.google.com/forms/d/e/1FAIpQLScBpTDWAqjH6jLstskrwJA1e9kTxWs86lPDVjXm0SsZ-SSiiA/viewform?usp=sf_link)
3. Acepte la invitación para pasar de *outside collaborator* a ser miembro de la organización [ULL-ESIT-PL-1819](https://github.com/ULL-ESIT-PL-1819)
3. Ejecute paso a paso el código de `logging.js` usando el debugger de chrome, intentando comprender el funcionamiento de la transformación realizada. Haga un resumen de lo que ha aprendido en el fichero Markdown: `README.md`
4. Modifique el programa para que los `console.log` insertados informen de los valores de los parámetros pasados a la función como ocurre en el siguiente ejemplo:

```js
[~/local/src/javascript/learning/esprima-pegjs-jsconfeu-talk(private)]$ node logging.js
input:

function foo(a, b) {
  var x = 'blah';
  var y = (function (z) {
    return z+3;
  })(2);
}
foo(1, 'wut', 3);

---
output:
function foo(a, b) {
    console.log('Entering foo(' + a, b + ')');
    var x = 'blah';
    var y = function (z) {
        console.log('Entering <anonymous function>(' + z + ')');
        return z + 3;
    }(2);
}
foo(1, 'wut', 3);
---
```
Cuando se ejecuta la salida se obtiene:
```
[~/campus-virtual/1819/pl1819/introduccion/tema0-introduccion-a-pl/practicas/code(private)]$ node logging.js | sed -ne '/output:/,/---/p' | sed -e '/---/d' | sed -e '/output:/d' > out.js
[~/campus-virtual/1819/pl1819/introduccion/tema0-introduccion-a-pl/practicas/code(private)]$ node out.js 
Entering foo(1 wut)
Entering <anonymous function>(2)
foo(1, 'wut', 3);
```