# Ejercicio: Gramática de la versión Inicial de Egg

En este ejercicio te propongo un proceso inverso.
Partiendo del [código](https://github.com/ULL-ESIT-PL-1617/egg/tree/inicial)
que está en la rama `inicial` de este [repo]([código](https://github.com/ULL-ESIT-PL-1617/egg/),
sabiendo que el algoritmo de análisis es un PDR,
intenta describir formalmente la gramática
que acepta.

```js
function parseExpression(program) {
  program = skipSpace(program);
  var match, expr;

  if (match = /^"([^"]*)"/.exec(program)) {
    expr = {type: "value", value: match[1]};
  } else if (match = /^\d+\b/.exec(program)) {
    expr = {type: "value", value: Number(match[0])};
  } else if (match = /^[^\s(),"]+/.exec(program)) {
    expr = {type: "word", name: match[0]};
  } else {
    throw new SyntaxError(`Unexpect syntax: ${program}`);
  }

  return parseApply(expr, program.slice(match[0].length));
}

function skipSpace(string) {
  return string.slice(/^(\s|#.*)*/.exec(string)[0].length);
}

function parseApply(expr, program) {
  program = skipSpace(program);

  if (program[0] != '(') {
    return {expr: expr, rest: program};
  }

  program = skipSpace(program.slice(1));
  expr = {type: 'apply', operator: expr, args: []};

  while (program[0] != ')') {
    var arg = parseExpression(program);
    expr.args.push(arg.expr);
    program = skipSpace(arg.rest);

    if (program[0] == ',') {
      program = skipSpace(program.slice(1));
    } else if (program[0] != ')') {
      throw new SyntaxError("Expected ',' or ')'");
    }
  }

  return parseApply(expr, program.slice(1));
}
```

* [solucion](solucion-ejercicio-gramar-egg-inicial)
  