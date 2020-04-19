# Posibles Organizaciones del Proyecto

La jerarquía de ficheros presentada es orientativa.
Resultar conveniente aislar en clases y en módulos 
el analizador léxico, el sintáctico, el runner, etc.

Este es un ejemplo de como organizar su jerarquía de ficheros de una forma escalable:

```
[.../TFA-04-16-2020-03-22-00/davafons(master)]$ tree -I 'node_modules|docs'
.
├── LICENSE
├── README.md   // Documentación del paquete y del proyecto
├── bin
│   └── egg.js  // usando opciones en línea de comandos: -c compilar, -i interpretar, etc
├── esdoc.json  // documentación: vea https://esdoc.org/
├── docs
│   └── ...     // Documentación generada. Configurar GitHub Pages 
├── examples    // Ejemplos: son reutilizados en las pruebas
│   ├── array-index.egg
|   ├── ... 
│   ├── trycatch.egg.evm
│   ├── two.egg
│   └── two.egg.evm
├── index.js // Entry point: exporta todo lo que necesita el ejecutable
├── lib
│   ├── interp
│   │   ├── arithm.js      // Extensiones aritméticas: ++, --, +=, ...
│   │   ├── ast.js         // Las clases del AST: Value, Word, Apply, Regex, ...
│   │   ├── eggvm.js       // Clase con los runners: runFromFile, runFromEVM, run, ...
│   │   ├── environment.js // main del environment. Exporta  SpecialForms y TopEnv. Usa registry
│   │   ├── exceptions.js  // Extiende Egg con try, throw, ...
│   │   ├── index.js       // main: exporta todas las clases del intérprete: Eggvm, Value, Word, Apply, Regex, TopEnv, SpecialForms, ...
│   │   ├── monkey-patching.js // Manipulacion de las clases de JS (Object, Array, etc.)
│   │   ├── registry.js   // Exporta los mapas para exensión SpecialForms,  TopEnv, ...  
│   │   └── require.js    // Soporte para módulos en Egg
│   ├── parser
│   │   ├── index.js      // main de Parser: exporta todas las clases públicas: Eggvm,
  Value, Word, Apply, Regex, TopEnv, SpecialForms ...
│   │   ├── json2AST.js   //  Desde el JSON construimos el AST con clases
│   │   ├── lexer.js      // Exporta Clase Analizador Léxico. Usa tokenRe
│   │   ├── optimizer.js  // Optimizaciones (constant folding)
│   │   ├── parse.js      // Análisis Sintáctico
│   │   ├── semantic.js   // Análisis Semántico
│   │   └── tokenRegex.js //Exporta la clase para los objetos Token 
│   ├── repl              // soporte para Repeat Evaluate Print Loop
│   │   ├── colors.js     // Colorines usando ansi-colors 
│   │   ├── extensions.js // Extensiones: help() info() clear() ...
│   │   └── repl.js       // El bucle
│   └── utils.js // Helpers comunes
├── package-lock.json  // bajo control de versiones
├── package.json // configurado para publicar como módulo en GitHub registry
└── test
    ├── examples-test.js // Ejemplos contra salida
    ├── ...   
    └── tokenRegex-test.js 
```

Es conveniente tener algunos scripts preparados en el `package.json` 
como:

```
.../TFA-04-16-2020-03-22-00/davafons(master)]$ npm run
Lifecycle scripts included in eggtended-js:
  test
    nyc mocha

available via `npm run-script`:
  coverage
    nyc report --reporter=text-lcov | coveralls
  docs
    esdoc -c esdoc.json
```

- `coverage`: tests y cubrimiento usando [Istanbul command line interface](https://github.com/istanbuljs/nyc)
- `docs`: [esdoc usage](https://esdoc.org/manual/usage.html)
