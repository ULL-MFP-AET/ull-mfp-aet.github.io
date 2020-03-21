## Módulos en NPM

* [Creación de Paquetes NPM](nodejspackages.html)
* [Creating and Publishing a Node.js Module](creating-and-publishing-npm-module) 

## About GitHub Package Registry

* [Veáse la sección *GitHub Package Registry* de estos apuntes](github-registry)

## Best Practices

* [Best practice: Specify global dependencies in your gulpfile](https://stackoverflow.com/questions/14657170/installing-global-npm-dependencies-via-package-json)
* [Node.js — How to test your new NPM module without publishing it every 5 minutes](https://medium.com/@the1mills/how-to-test-your-npm-module-without-publishing-it-every-5-minutes-1c4cb4b369be)
* [Best practice: Better local require() paths for Node.js](https://gist.github.com/branneman/8048520): 
   - When the directory structure of your Node.js **application** (not library!) has some depth, you end up with a lot of annoying relative paths in your require calls like:
    ```
     var Article = require('../../../models/article');
    ```
   Those suck for maintenance and they're ugly.

## ECMA6 Modules

* [ECMA6 Modules](ecma6-modules)