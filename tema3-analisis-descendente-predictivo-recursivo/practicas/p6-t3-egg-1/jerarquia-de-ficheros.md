# Posibles Organizaciones del Proyecto

Este es un ejemplo de como organizar su jerarquía de ficheros:

```
[~/ull-pl1718-campus-virtual/tema3-analisis-sintactico/src/egg/crguezl-egg(private)]$ tree -I 'node_modules|examples|egg-*'
  .
  ├── README.md
  ├── bin
  │   ├── egg.js
  │   ├── eggc.js
  │   └── evm.js
  ├── gulpfile.js
  ├── lib
  │   ├── ast.js            # Clases para los nodos del AST
  │   ├── eggvm.js
  │   ├── environment.js    # specialForms and topEnv initialization
  │   ├── parse.js
  │   └── registry.js       # specialForms and topEnv maps
  ├── package-lock.json
  ├── package.json
  └── test
      └── test.js

  3 directories, 14 files
```

La función `evaluate` con el `switch` que estaba en `lib/eggvm.js` desaparece en esta versión

La jerarquía de ficheros presentada es orientativa.
Puede resultar conveniente aislar también en clases y en módulos 
el analizador léxico, el sintáctico y el runner.

```
[.../TFA-04-16-2020-03-22-00/davafons(master)]$ tree -I 'node_modules|docs'
.
├── LICENSE
├── README.md
├── bin
│   └── egg.js  // usando opciones en línea de comandos: -c compilar, -i interpretar, etc
├── esdoc.json  // documentación: vea https://esdoc.org/
├── examples    // Ejemplos: son reutilizados en las pruebas
│   ├── array-index.egg
|   ├── ... 
│   ├── trycatch.egg.evm
│   ├── two.egg
│   └── two.egg.evm
├── index.js
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
├── package-lock.json
├── package.json
└── test
    ├── examples-test.js // Ejemplos contra salida
    ├── lexer-test.js    
    └── tokenRegex-test.js 
```
