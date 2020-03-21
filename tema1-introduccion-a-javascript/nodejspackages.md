# CommonJS Modules. Importación y Exportación

* [NODE.JS module patterns using simple examples](https://darrenderidder.github.io/talks/ModulePatterns). Trasparencias. Muestra ejemplos/patrones de exportación-importación (Reveal Slides)
* [Authoring CommonJS modules](http://know.cujojs.com/tutorials/modules/authoring-cjs-modules)  (CommonJS modules were conceived during the early days of server-side JavaScript environments such as node.js and Narwhal. As a result, CommonJS modules are optimized for these environments, not browser environments)

# El comando npm

* [A Beginner’s Guide to npm — the Node Package Manager](https://www.sitepoint.com/beginners-guide-node-package-manager/)
* [npm](npm.html)
* [10 Tips and Tricks That Will Make You an npm Ninja](https://www.sitepoint.com/10-npm-tips-and-tricks/)

# Ejercicio: Darse de alta en NPM

Para comenzar, crearemos una cuenta de usuario en el repositorio de NPM mediante la cual publicar nuestros propios paquetes:

1. Abrir el navegador.
2. Ir a [https://npmjs.org](https://npmjs.org)
3. Hacer clic en el enlace [sign up](https://www.npmjs.com/login)
4. Rellenar el formulario de alta:
  - ![Formulario para crear la cuenta en npmjs.org](crearcuentanpm.png)
5. Aceptar los términos de licencia.
6. Hacer clic en el botón Create an Account para crear la cuenta.
7. Una vez creada la cuenta, hay que abrir sesión con el servidor NPM para poder publicar paquetes en él. Abrir una consola.
8. Conectar al repositorio: 
   1. `$ npm login`
   2. Rellene los datos que le solicita.
   3. Consultar la cuenta con la que tenemos abierta la sesión:
   ```
    $ npm whoami
   ```

**Otra forma de darse de alta desde línea de comandos:**

* Ejecuta en la terminal estos comandos:

	```bash
			npm set init.author.name "Casiano Rodriguez-Leon"
			npm set init.author.email "whatever@gmail.com"
			npm set init.author.url "https://github.com/crguezl"
	```
* El siguiente comando nos perdirá un email y una  password, creando o verificando 
un usuario en el [npm registry](https://docs.npmjs.com/misc/registry), y 
guardará el token en el fichero 
`~/.npmrc`:

	```bash
			npm adduser
	```

# Creación de Paquetes y Módulos en NodeJS

* [Creating and Publishing a Node.js Module](https://quickleft.com/blog/creating-and-publishing-a-node-js-module/) por Brent Ertz
* El paquete de ejemplo usado en este tutorial [@ull-esit-dsi-1617/scapegoat](https://www.npmjs.com/package/@ull-esit-dsi-1617/scapegoat) en npm
* El paquete de ejemplo usado en este tutorial [@ull-esit-dsi-1617/scapegoat](https://github.com/ULL-ESIT-DSI-1617/scapegoat) en GitHub


# Instalación desde GitHub

You can install packages directly from Github, and even specify a tag, sha, or branch if you want.

```
npm install https://github.com/ULL-ESIT-DSI-1617/scapegoat.git
npm install https://github.com/ULL-ESIT-DSI-1617/scapegoat.git#branch
```

must be https or git+ssh. 

See [How to install an npm package from GitHub directly?](https://stackoverflow.com/questions/17509669/how-to-install-an-npm-package-from-github-directly) in StackOverflow

# Publicación con ámbito en una organización:

```
[/tmp/scapegoat(master)]$ npm publish --access public
+ @ull-esit-dsi-1617/scapegoat@1.0.2
```	

## Scoped Packages

> There are only two hard things in Computer Science: cache invalidation and naming things.

> —Phil Karlton

 Naming things is hard. It’s even harder when there are tens of thousands of other people who want to use the same names that you do. With hundred of thousands of modules on npm, it has been getting hard to find a name that isn’t taken.

Naming things just got a little bit easier for npm users with the introduction of scopes. 

What are scopes?: Scopes are like namespaces for npm packages. Each npm user has their own scope.

```
@username/project-name
```
This means that you don’t have to worry about someone else taking your package name. Only you can add packages in your scope.

Scoped modules also make it possible to put your private code on npm when you sign up for [private modules](https://www.npmjs.com/features). With private modules, you have control over who can see and collaborate on any of the modules in your scope.


Public scoped packages are free. To create a scoped package, all you need to do is add your scope to the front of the name property in `package.json` and run `npm` with the access option:

```
npm publish --access=public
```

* [Working with scoped packages](https://docs.npmjs.com/getting-started/scoped-packages)
* [npm-scope manual: Scoped packages](https://docs.npmjs.com/misc/scope#publishing-public-scoped-packages-to-the-public-npm-registry)
* [Working with npm private modules. YouTube Video](https://youtu.be/O6JoXGnHK_Y)


# Package.json

* [Package.json documentation en npm site](https://docs.npmjs.com/files/package.json)

## Ejemplo de package.json

```
	[~/javascript/evalua-module/scapegoat(master)]$ pwd -P
	/Users/casiano/local/src/javascript/evalua-module/scapegoat
	[~/javascript/evalua-module/scapegoat(master)]$ tree -I 'node_modules|docs'
	.
	├── LICENSE-MIT
	├── README.md
	├── index.js
	├── package.json
	└── test
			└── index.js

	1 directory, 5 files
	[~/javascript/evalua-module/scapegoat(master)]$ cat package.json
```
```js 
	{
		"name": "@ull-esit-dsi-1617/scapegoat",
		"version": "1.0.4",
		"description": "A small library providing utility methods to escape and unescape HTML entities",
		"main": "index.js",
		"scripts": {
			"test": "./node_modules/.bin/mocha --reporter spec",
			"doc": "documentation build index.js -f html -o docs"
		},
		"repository": {
			"type": "git",
			"url": "git@github.com:ULL-ESIT-DSI-1617/scapegoat.git"
		},
		"keywords": [
			"escape",
			"unescape",
			"html"
		],
		"author": "Casiano Rodriguez <casiano.rodriguez.leon@gmail.com>",
		"licenses": [
			{
				"type": "MIT",
				"url": "https://github.com/ULL-ESIT-DSI-1617/scapegoat/blob/master/LICENSE-MIT"
			}
		],
		"bugs": {
			"url": "https://github.com/ULL-ESIT-DSI-1617/scapegoat/issues"
		},
		"devDependencies": {
			"mocha": "*",
			"chai": "*"
		}
	}
```

# Semantic versioning and npm

* [Semantic versioning and npm](https://docs.npmjs.com/getting-started/semantic-versioning)
* [Semantic Versioning: Why You Should Be Using it](https://www.sitepoint.com/semantic-versioning-why-you-should-using/) SitePoint
* [YouTube Video: Semantic versioning and npm](https://youtu.be/kK4Meix58R4)
* [El comando npm version](https://docs.npmjs.com/cli/version)


# NPM: Herramientas de ayuda: release-it

* [release-it: Interactive release tool for Git repositories](https://github.com/webpro/release-it)
* [release-it: GitHub Page](https://webpro.github.io/release-it/)

Release a new patch (increments from e.g. `1.0.4` to `1.0.5`):

```bash
release-it
```

Release a patch, minor, major, or specific version:

```bash
release-it minor
release-it 0.8.3
```

You can also do a "dry run", which won't write/touch anything, but does output the commands it would execute, and show the interactivity:

```bash
release-it --dry-run
```

## References: Tutorials

* [Your first Node.js package  por Elijah Insua](https://nodesource.com/blog/your-first-nodejs-package/)

## NPM: Video Tutoriales

* [Creating NodeJS modules](https://youtu.be/3I78ELjTzlQ)
* [Publishing npm Packages](https://youtu.be/BkotrAFtBM0)
* [Node js Tutorial: How to create NPM package?](https://youtu.be/sELoj6e1ffM)

## Links to NPM docs: Getting Started 

1.  [What is npm?](https://docs.npmjs.com/getting-started/what-is-npm)
2.  [Installing Node.js and updating npm](https://docs.npmjs.com/getting-started/installing-node)
3.  [Fixing npm permissions](https://docs.npmjs.com/getting-started/fixing-npm-permissions)
4.  [Installing npm packages locally](https://docs.npmjs.com/getting-started/installing-npm-packages-locally)
5.  [Using a package.json](https://docs.npmjs.com/getting-started/using-a-package.json)
6.  [Updating local packages](https://docs.npmjs.com/getting-started/updating-local-packages)
7.  [Uninstalling local packages](https://docs.npmjs.com/getting-started/uninstalling-local-packages)
8.  [Installing npm packages globally](https://docs.npmjs.com/getting-started/installing-npm-packages-globally)
9.  [Updating global packages](https://docs.npmjs.com/getting-started/updating-global-packages)
[Uninstalling global packages](https://docs.npmjs.com/getting-started/uninstalling-global-packages)11.  [Creating Node.js modules](https://docs.npmjs.com/getting-started/getting-started/creating-node-modules)
12.  [Publishing npm packages](https://docs.npmjs.com/getting-started/publishing-npm-packages)
13.  [Semantic versioning and npm](https://docs.npmjs.com/getting-started/semantic-versioning)
14.  [Working with scoped packages](https://docs.npmjs.com/getting-started/scoped-packages)
15.  [Using tags](https://docs.npmjs.com/getting-started/using-tags)

<!-- * [Publishing npm packages tutorial](https://docs.npmjs.com/getting-started/publishing-npm-packages) * [npm documentation: Creating Node.js modules](https://docs.npmjs.com/getting-started/creating-node-modules) -->

# npm Organizations /npm Organizaciones

*   [Introduction](https://www.npmjs.com/docs/orgs/./)
*   [Getting Started](https://www.npmjs.com/docs/orgs/getting-started.html)
*   [Roles and Privileges](https://www.npmjs.com/docs/orgs/roles-and-privileges.html)
*   [Managing Members](https://www.npmjs.com/docs/orgs/managing-members.html)
*   [The Developers Team](https://www.npmjs.com/docs/orgs/the-developers-team.html)
*   [Managing Teams](https://www.npmjs.com/docs/orgs/managing-teams.html)
*   [Publishing an Org Scoped Package](https://www.npmjs.com/docs/orgs/publishing-an-org-scoped-package.html)
*   [Configuring npm for your Org](https://www.npmjs.com/docs/orgs/configuring-npm-for-your-org.html)
*   [Managing Package Access](https://www.npmjs.com/docs/orgs/managing-package-access.html)
*   [Migrating a User Account](https://www.npmjs.com/docs/orgs/migrating-a-user-account.html)
*   [Managing Billing](https://www.npmjs.com/docs/orgs/managing-billing.html)
*   [Upgrading and Downgrading](https://www.npmjs.com/docs/orgs/upgrading-and-downgrading.html)
*   [Renaming and/or Deleting an Org](https://www.npmjs.com/docs/orgs/renaming-and-or-deleting-an-org.html)

Members of an Organization are immediately added to a Developers team that automatically has Read/Write access to all packages published under an Organization scope

* [Publishing an Org Scoped Package](https://www.npmjs.com/docs/orgs/publishing-an-org-scoped-package.html)
  - To create a new scoped package for your Organization scope, create a directory with the name of the package you would like to create. Navigate into that directory and use this command:

                    npm init --scope=<org_scope>

  - By default all scoped packages are published privately. To publish a scoped package publicly, pass the access flag with the value public:

                    npm publish --access public

* [The developers team](https://www.npmjs.com/docs/orgs/the-developers-team.html)
  - The Developers Team is a special Team that is automatically created when you create an Organization. 
  - Members are automatically added to the Developers team:
    - The user who created the Organization is added to this team automatically.
    - Any member added to the Organization is also added to this team automatically.
    - If an Owner adds a new Member to an Organization and does not want that Member to be on the Developers team, an Owner can remove them. ([Learn more about managing teams](https://www.npmjs.com/docs/orgs/managing-teams.html)).
* [npm-team: Manage organization teams and team memberships](https://docs.npmjs.com/cli/team)
* [npm-access: Set access level on published packages](https://docs.npmjs.com/cli/access)

# Yarn

* [yarn](https://code.facebook.com/posts/1840075619545360)

# Creación de Paquetes en el Navegador/Cliente


* [webpack](http://webpack.github.io/docs/motivation.html)
  - [Webpack Tutorial - Replace Gulp/Grunt plugins with a single tool. LearnCode.academy](https://youtu.be/9kJVYpOqcVU) YouTube
* [bower](https://bower.io/)
* [browserify](http://browserify.org/)

# [Documentation](documentation)