# Creating and publishing a node.js module en GitHub y en NPM

Creating a node module and publishing it to npm is a fairly
straightforward process. Haven't done it yet? Not sure what I'm talking
about? Here's a quick tutorial to speed you along.

## What is npm?

npm is an online registry for open-source node.js projects, modules,
resources, etc. You can find it at <http://npmjs.org>.

npm is also the official package manager for node.js, and provides a
command line interface (CLI) for interacting with the registry. This
utility comes bundled with node.js and is installed automatically. For
API documentation, visit <https://npmjs.org/doc/> or just type `npm` in
your terminal.

For you ruby devs, npm is akin to [rubygems](http://rubygems.org/).

## Don't have node.js installed?

You'll of course need to install node.js and npm in order to follow
along. Try one of the following install options or just read along.

-   Homebrew users can simply run `brew install node`
-   Download a binary from <http://nodejs.org/>
-   Use [Node Version Manager (NVM)](https://github.com/creationix/nvm)
    -- *recommended*


## Configure npm

Let's get started by configuring npm a little bit. Go ahead and enter
these commands in a terminal, using your own information. This way, when
we run some npm commands later, it will already know who we are and will
be able to autocomplete some information for us.

```
npm set init.author.name "Casiano Rodriguez-Leon"
npm set init.author.email "whatever@gmail.com"
npm set init.author.url "https://github.com/crguezl"
```

This next command will prompt you for an email and password, create or
verify a user in the npm registry, and save the credentials to the
`~/.npmrc` file.

    npm adduser

## What are scopes? 

Scopes are like namespaces for npm packages. Each npm user has their own scope.

```
@username/project-name
```

This means that you don’t have to worry about someone else taking your package name. Only you can add packages in your scope.

Scoped modules also make it possible to put your private code on npm when you sign up for [private modules](https://www.npmjs.com/features). 
With private modules, you have control over who can see and collaborate on any of the modules in your scope (but you have to paid for it. Public scoped packages are free).

To create a scoped package, all you need to do is add your scope to the front of the name property in `package.json` and run `npm` with the access option:

```
npm publish --access=public
```

## What is Github Registry?

GitHub Package Registry is a software package hosting service, similar to npmjs.org, rubygems.org, or hub.docker.com, that allows you to host your packages and code in one place. You can host software packages privately or publicly and use them as dependencies in your projects.

### Setting a Token

You need an access token to publish, install, and delete packages in GitHub Packages. You can use a personal access token to authenticate with your username directly to GitHub Packages or the GitHub API. You can use a `GITHUB_TOKEN` to authenticate using a GitHub Actions workflow.

When you create a personal access token, you can assign the token different scopes depending on your needs. For more information, see "[Creating a personal access token for the command line](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line)" and "[Available scopes](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/#available-scopes)" in the GitHub Developer documentation.


Go to your GitHub user's settings, from there navigate to *Developer Settings*,
then to *Personal access tokens*

[https://github.com/settings/tokens](https://github.com/settings/tokens)

Select *Generate new token* and give the token the appropriate permits:

<table>
<thead>
<tr>
<th>Scope</th>
<th>Description</th>
<th>Repository permissions</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>read:packages</code></td>
<td>Download and install packages from GitHub Packages</td>
<td>read</td>
</tr>
<tr>
<td><code>write:packages</code></td>
<td>Upload and publish packages to GitHub Packages</td>
<td>write</td>
</tr>
<tr>
<td><code>delete:packages</code></td>
<td>Delete specified versions of private packages from GitHub Packages</td>
<td>admin</td>
</tr>
<tr>
<td><code>repo</code></td>
<td>Install, upload, and delete certain packages in private repositories (along with <code>read:packages</code>, <code>write:packages</code>, or <code>delete:packages</code>)</td>
<td>read, write, or admin</td>
</tr>
</tbody>
</table>

Once you get the token run `npm login` against the GitHub Registry:

```
$ npm login --registry=https://npm.pkg.github.com
> Username: USERNAME
> Password: TOKEN
> Email: PUBLIC-EMAIL-ADDRESS
```

Write/paste the token in the password field:

```
$ npm login --registry=https://npm.pkg.github.com
Username: crguezl
Password:
Email: (this IS public) crguezl@ull.edu.es
Logged in as crguezl on https://npm.pkg.github.com/.
```
      
 * [Veáse la sección *GitHub Package Registry* de estos apuntes](github-registry)

## Create a node module

A Node/npm module is just an ordinary JavaScript file with the addition
that it must follow the 
[CommonJS module spec](http://www.commonjs.org/specs/modules/1.0/). 

Node modules run in their own scope
so that they do not conflict with other modules. 

Node relatedly provides
access to some [globals](http://nodejs.org/api/globals.html) to help
facilitate module interoperability. 

The primary two items that we are
concerned with here are `require` and `exports`. 

You `require` other
modules that you wish to use in your code and your module `exports`
anything that should be exposed publicly. 

For example:

```js
    var other = require('other_module');
    module.exports = function() {
        console.log(other.doSomething());
    }
```

For our demo, we'll create an npm module consisting of a couple utility
methods for escaping and unescaping HTML entities -- commonly needed
utils to prevent cross site scripting
([XSS](http://en.wikipedia.org/wiki/Cross-site_scripting)) 
attacks when
rendering user generated content. 

We'll call this project, 'Scapegoat',
because a quick search of the
npm registry reveals that the name has not yet been taken. 

*Note that if
you are coding along with me, and plan to publish your module to npm,
without scope, you'll need to give your module a unique name.*

To get started, We create a new repository on our Github
account (or on a organization) and then cloned it
locally.

    git clone git@github.com:brentertz/scapegoat.git
    cd scapegoat
      

### package.json

Executing the following command will create a `package.json` file:

    npm init -f

Have a look to see what the file contains; it is pretty human-readable.
Further details and explanation of the contents of the `package.json` file
can be found at <https://npmjs.org/doc/json.html>. 

Our initial version
looks like the following, but we'll be updating this further as we go
along.

```js
    {
      "name": "scapegoat",
      "version": "0.0.0",
      "description": "A small library providing utility methods to escape and unescape HTML entities",
      "main": "index.js",
      "scripts": {
        "test": "echo "Error: no test specified" && exit 1"
      },
      "repository": {
        "type": "git",
        "url": "git://github.com/brentertz/scapegoat.git"
      },
      "keywords": [
        "escape",
        "unescape",
        "html"
      ],
      "author": "Brent Ertz <brent.ertz@gmail.com> (http://brentertz.com/)",
      "license": "BSD-2-Clause",
      "bugs": {
        "url": "https://github.com/brentertz/scapegoat/issues"
      }
    }
```      

### index.js: Write the code

Now we can actually get on to the business of writing code. Create an
`index.js` file to hold the primary module code. It'll look something
like the following. 

*Note the use of `module.exports`, which we
discussed previously, and is needed to make code available for use by
other modules. Further, as our module is not reliant on any other
modules, we did not need to `require` anything.*

```js
/**
 * Escape special characters in the given string of html.
 *
 * @param  {String} html
 * @return {String}
 */
module.exports = {
  escape: function(html) {
    return String(html)
      .replace(/&/g, '&amp;')
      .replace(/"/g, '&quot;')
      .replace(/'/g, '&#39;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;');
  },

  /**
   * Unescape special characters in the given string of html.
   *
   * @param  {String} html
   * @return {String}
   */
  unescape: function(html) {
    return String(html)
      .replace(/&amp;/g, '&')
      .replace(/&quot;/g, '"')
      .replace(/&#39;/g, ''')
      .replace(/&lt;/g, '<')
      .replace(/&gt;/g, '>');
  }
};
```

### Testing with Mocha and Chai

Next, we'll surely want to write some tests. *Perhaps it would have been
preferable to write them first.* Regardless, I prefer to use the
[Mocha](https://mochajs.org/) and
[Chai](http://chaijs.com/) frameworks, but you can use whatever you
like. 

These can be installed and persisted to the `package.json` file
with the following commands. *Note that they are added to the
'devDependencies' section, as they are only required during development
and not at runtime.*

    npm install mocha --save-dev

    npm install chai --save-dev

### .gitignore

The above commands will also create a `node_modules` folder in your
project directory containing those dependencies. Following best
practices, we'll want to keep the `node_modules` folder out of the git
repository. 

We can do that by adding a `.gitignore` file to our project
root, with the following contents.

    node_modules

It also created `package-lock.json` containing a detailed description of all the dependences. We add this file to the control version:

    git add package-lock.json

### Writing the tests

Continuing on, let's create a `test` directory to hold our tests.

 As our
primary module file is called `index.js`, within the `test` directory I
will create a file by the same name -- a simple convention. 

Mocha will
by default run all tests in this directory. Our test should look
something like the following. 

*Note that I am using the `should` syntax
provided by the Chai framework. Also note the use of `require` to pull
in our module code into the test.*

```js
    var should = require('chai').should(),
        scapegoat = require('../index'),
        escape = scapegoat.escape,
        unescape = scapegoat.unescape;

    describe('#escape', function() {
      it('converts & into &amp;', function() {
        escape('&').should.equal('&amp;');
      });

      it('converts " into &quot;', function() {
        escape('"').should.equal('&quot;');
      });

      it('converts ' into &#39;', function() {
        escape(''').should.equal('&#39;');
      });

      it('converts < into &lt;', function() {
        escape('<').should.equal('&lt;');
      });

      it('converts > into &gt;', function() {
        escape('>').should.equal('&gt;');
      });
    });

    describe('#unescape', function() {
      it('converts &amp; into &', function() {
        unescape('&amp;').should.equal('&');
      });

      it('converts &quot; into "', function() {
        unescape('&quot;').should.equal('"');
      });

      it('converts &#39; into '', function() {
        unescape('&#39;').should.equal(''');
      });

      it('converts &lt; into <', function() {
        unescape('&lt;').should.equal('<');
      });

      it('converts &gt; into >', function() {
        unescape('&gt;').should.equal('>');
      });
    });
```      

### Running the tests

But how do we actually run the tests?

```
$ cat package.json 
```

```js
{
  "name": "@ull-esit-dsi-1617/scapegoat",
  "version": "1.2.5",
  "description": "A small library providing utility methods to escape and unescape HTML entities",
  "main": "index.js",
  "scripts": {
    "test": "mocha --reporter spec",
    "doc": "documentation build index.js -f html -o docs",
    "serve-doc": "http-server docs/ -o",
    "push": "npm run doc; git add docs; git ci -am no-message; git push"
  },
  "repository": {
    "type": "git",
    "url": "https://github.com/ULL-ESIT-DSI-1617/scapegoat.git"
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
    "chai": "*",
    "documentation": "*"
  },
  "dependencies": {
  }
}
```      

After doing so, we can then execute the tests by entering following
command.

```
[~/.../create-a-npm-module/scapegoat(master)]$ npm test

> @ull-esit-dsi-1617/scapegoat@1.2.5 test /Users/casiano/local/src/javascript/evalua-module/create-a-npm-module/scapegoat
> mocha --reporter spec

  #escape
    ✓ converts & into &amp;
    ✓ converts " into &quot;
    ✓ converts ' into &#39;
    ✓ converts < into &lt;
    ✓ converts > into &gt;
    ✓ returns empty string if called with falsey value

  #unescape
    ✓ converts &amp; into &
    ✓ converts &quot; into "
    ✓ converts &#39; into '
    ✓ converts &lt; into <
    ✓ converts &gt; into >
    ✓ does not double unescape values
    ✓ returns empty string if called with falsey value


  13 passing (17ms)
```

### Continuous Integration (CI) with GitHub Actions

```
$ mkdir -p .github/workflows
$ touch .github/workflows/nodejs.yml
```

We fill the contents of `nodejs.yml` with the description of our workflow:

```
$ cat .github/workflows/nodejs.yml
```
```yml
# This workflow will do a clean install of node dependencies, build the source code and run tests across different versions of node
# For more information see: https://help.github.com/actions/language-and-framework-guides/using-nodejs-with-github-actions

name: Node.js CI

on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

jobs:
  build:

    runs-on: ubuntu-latest

    strategy:
      matrix:
        node-version: [12.x]

    steps:
    - uses: actions/checkout@v2
    - name: Use Node.js ${{ matrix.node-version }}
      uses: actions/setup-node@v1
      with:
        node-version: ${{ matrix.node-version }}
    - run: npm ci
    - run: npm run build --if-present
    - run: npm test
      env:
        CI: true
```


```
$ git add .github/workflows/nodejs.yml
$ git ci -am .github/workflows/nodejs.yml
```

 Now when we do a push:

```
$ git push
Counting objects: 6, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (6/6), 837 bytes | 279.00 KiB/s, done.
Total 6 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:ULL-ESIT-PL-1920/lexer-generator.git
   dc093a1..0747861  master -> master
```

The action is triggered. Let us go and click on the actions tab in our repo:

![]({{site.baseurl}}/assets/images/github-actions-1-click.png)

![]({{site.baseurl}}/assets/images/github-actions-2-processing.png)

![]({{site.baseurl}}/assets/images/github-actions-3-completed.png)

![]({{site.baseurl}}/assets/images/github-actions-4-complete-job.png)

![]({{site.baseurl}}/assets/images/github-actions-5-completed.png)

### Documentation and README.md

Okay great, our tests are passing and we have CI. 

Let's add a few items that will help
to round out our project.

It is always a good idea to include some documentation with your
project, so we'll add a `README.md`, using markdown syntax. Using
markdown is a good idea because it will be nicely displayed on both
Github and npm.

```
  Scapegoat
  =========

  A small library providing utility methods to `escape` and `unescape` HTML entities

  ## Installation

    npm install scapegoat --save

  ## Usage

    var scapegoat = require('scapegoat')
        escape = scapegoat.escape,
        unescape = scapegoat.unescape;

    var html = '<h1>Hello World</h1>',
        escaped = escape(html),
        unescaped = unescape(escaped);

    console.log('html', html, 'escaped', escaped, 'unescaped', unescaped);

  ## Tests

    npm test

  ## Contributing

  In lieu of a formal styleguide, take care to maintain the existing coding style.
  Add unit tests for any new or changed functionality. Lint and test your code.

  ## Release History

  * 0.1.0 Initial release
```      

### Semantic Versioning

As you may have noticed in the readme above, I referenced the version
0.1.0 in the release history. We'll need to update that in our
`package.json`. If you are not familiar with [semantic versioning aka
SemVer](http://semver.org/), please add it to your reading list.

    "version": "0.1.0",

### License

Further, it is generally a good idea to specify a license with your
project. I'll choose an MIT license, add a LICENSE-MIT file to the
project root, and update the `package.json` respectively. Note that you
can obtain the actual content for your chosen license type at
<http://opensource.org/licenses/alphabetical>. The updated section of
the package.json now looks like the following.

    "licenses": [
      {
        "type": "MIT",
        "url": "https://github.com/brentertz/scapegoat/blob/master/LICENSE-MIT"
      }
    ],
      


## Publishing

### git tag

Great, the module is complete. Prior to publishing to npm, let's first
ensure that any changes have been committed to git and that everything
has been pushed up to Github. It is also a good idea to **create a version
tag** as well. Here's how to do just that.

    git tag 0.1.0
    git push origin master --tags
      

### GitHub can be used to install npm packages

Note that for whatever reason if you decide not to publish your module
on npm, the npm package format provides value in itself in both
portability and ease of installation. For example, you can install
packages directly from Github, and even specify a tag, sha, or branch if
you want.

    npm install git://github.com/brentertz/scapegoat.git
    npm install git://github.com/brentertz/scapegoat.git#0.1.0


### Test the Installation Process

Before publishing, be sure to test that your package installs and works
correctly. This does not mean running the tests as we did above, but
rather attempting an actual install.

#### Test Installation from the Working Directory

-   Verify that the package installs properly. From your package root
    directory, enter the following to install your package globally.

```
      npm install . -g
```

-   Check to see if it exists.

```
      npm ls -g
```

#### Test Installation from Another Directory

-   To go one step further, switch to another directory, open the
    node-repl, `require` your module and try it out.

```js
      node
      > var escape = require('scapegoat').escape;
      [Function]
      > escape('<h1>Hello World!</h1>');
      '&lt;h1&gt;Hello World!&lt;/h1&gt;'
      >
```

#### Symlink Your Package with npm link

Run `npm link` in the package directory:

```
[~/.../github-actions-learning/lexer-generator(master)]$ npm link
audited 1310372 packages in 8.916s

26 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities

/Users/casiano/.nvm/versions/node/v12.10.0/lib/node_modules/@ULL-ESIT-PL-1920/lexer-generator -> /Users/casiano/local/src/github-actions-learning/lexer-generator
```

This will create a symlink in the global `node_modules` folder that links to the package where the `npm link` command was executed:

```
[~/.../github-actions-learning/lexer-generator(master)]$ npm list -g | head -n 1
/Users/casiano/.nvm/versions/node/v12.10.0/lib
[~/.../github-actions-learning/lexer-generator(master)]$ ls -l ~/.nvm/versions/node/v12.10.0/lib/node_modules/\@ULL-ESIT-PL-1920/lexer-generator
lrwxr-xr-x  1 casiano  staff  64 22 mar 22:21 /Users/casiano/.nvm/versions/node/v12.10.0/lib/node_modules/@ULL-ESIT-PL-1920/lexer-generator -> /Users/casiano/local/src/github-actions-learning/lexer-generator
```

Next, in the other location where we want to test our package, 
we run the command 

```
[~/.../test-lexer-generator]$ npm link \@ULL-ESIT-PL-1920/lexer-generator
/Users/casiano/local/src/github-actions-learning/test-lexer-generator/node_modules/@ULL-ESIT-PL-1920/lexer-generator -> /Users/casiano/.nvm/versions/node/v12.10.0/lib/node_modules/@ULL-ESIT-PL-1920/lexer-generator -> /Users/casiano/local/src/github-actions-learning/lexer-generator 
[~/.../test-lexer-generator]$ ls -l node_modules/\@ULL-ESIT-PL-1920/lexer-generator
lrwxr-xr-x  1 casiano  staff  96 22 mar 22:33 node_modules/@ULL-ESIT-PL-1920/lexer-generator -> ../../../../../../.nvm/versions/node/v12.10.0/lib/node_modules/@ULL-ESIT-PL-1920/lexer-generator
```

and you should be able to import or require the package as if it was an installed dependency.

Note that the name of the package is taken from `package.json`, not from the directory name.

Now we have created a `test-lexer-generator` directory to test our `test-generator`package.

```
[~/.../test-lexer-generator]$ ls -l
total 16
drwxr-xr-x  3 casiano  staff   96 22 mar 22:33 node_modules
-rw-r--r--  1 casiano  staff  320 22 mar 22:32 package.json
-rw-r--r--  1 casiano  staff  776 22 mar 22:39 sticky.js
```

It contains a simple program `sticky.js` that loads and tests our
package. Here are the first 5 lines:

```
[~/.../test-lexer-generator]$ head -n 5 sticky.js
// main

const buildLexer =require('@ULL-ESIT-PL-1920/lexer-generator');

const SPACE = /(?<SPACE>\s+)/;
```

Observe that no path is specified in the `require`. Just like if it were in production mode.

Now we can run the program:

```
[~/.../test-lexer-generator]$ node sticky.js
const varName = "value"
[
  { type: 'RESERVEDWORD', value: 'const' },
  { type: 'ID', value: 'varName' },
  { type: 'OP', value: '=' },
  { type: 'STRING', value: '"value"' }
]
...
```

We can unlink at any time by running the following command in the package directory:

```
[~/.../github-actions-learning/lexer-generator(master)]$ npm unlink
```

### Publish it!

Hopefully everything worked as expected and you can now move on to the
publishing step. All of the meta information is contained in the
`package.json` file. And remember from earlier that we have already
registered on npm, with the `npm adduser` command. With that, the actual
publishing part is really easy.

    npm publish
      

When you publish to npm a public package using a scope, the first time you have to add the option
`--access public`:

```
[/tmp/scapegoat(master)]$ npm publish --access public
+ @ull-esit-dsi-1617/scapegoat@1.0.2
```	

Afterwards, you'll be able to install your package directly by name
rather than having to point at the Github url.

    npm install scapegoat

## Scopes and Registries

The syntax of `npm publish` is:

```
 npm publish [<tarball>|<folder>] [--tag <tag>] [--access <public|restricted>] [--otp otpcode]
 [--dry-run]
```

Publishes  a  package to the registry so that it can be installed by name. 

All files in the package directory are included if no  local  `.gitignore`  or  `.npmignore`  file exists.  

If  both  files  exist  and  a  file  is  ignored  by `.gitignore` but not by
`.npmignore` then it will be included. 

**By default npm will publish to the public registry**.

This can be overridden **by specifying  a  different  default registry**
or using a [npm scope in the name]({{site.baseurl}}/tema1-introduccion-a-javascript/nodejspackages.html##scoped-packages).

You can associate a scope with a registry at login, e.g.

```
  npm login --registry=https://npm.pkg.github.com --scope=@myco
```

Scopes have a **many-to-one** relationship with registries: 

*One registry can host multiple scopes, but a scope only ever points to one registry*.

**You can also associate a scope with a registry using npm config**:

```
  npm config set @ULL-ESIT-PL-1920:registry https://npm.pkg.github.com
```

In this example we associate the scope `@ULL-ESIT-PL-1920` with the GitHub registry
`https://npm.pkg.github.com`. 

Once a scope is associated with a registry, any `npm install` 
for a package with  that
scope  will request packages from that registry instead. 

Therefore any package with name `@ULL-ESIT-PL-1920/some-name` will be 
published at `https://npm.pkg.github.com`.

Lte us repeat it: Any `npm publish` for a package name that contains the scope 
will be published to that registry instead.

In the following example, the name of the package is `@ULL-ESIT-PL-1920/lexer-generator`:

```
$ cat package.json
```
```js
{
  "name": "@ULL-ESIT-PL-1920/lexer-generator",     👈
  "version": "1.0.0",
  "description": "A lab for PL: Building a lexer generator",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/ULL-ESIT-PL-1920/lexer-generator.git"
  },
  "keywords": ["ULL", "compilers", "lexical analysis", "regexp"],
  "author": "Casiano Rodriguez-Leon <crguezl@ull.edu.es> (https://github.com/crguezl)",
  "license": "ISC",
  "bugs": {
    "url": "https://github.com/ULL-ESIT-PL-1920/lexer-generator/issues"
  },
  "homepage": "https://github.com/ULL-ESIT-PL-1920/lexer-generator#readme"
}
```

When  we run `npm publish` inside the package folder we get:

```
$ npm publish
npm notice
npm notice 📦  @ULL-ESIT-PL-1920/lexer-generator@1.0.0
npm notice === Tarball Contents ===
npm notice 1.1kB index.js
npm notice 760B  sticky.js
npm notice 687B  package.json
npm notice === Tarball Details ===
npm notice name:          @ULL-ESIT-PL-1920/lexer-generator
npm notice version:       1.0.0
npm notice package size:  1.3 kB
npm notice unpacked size: 2.5 kB
npm notice shasum:        bc57a2710303351aba750589af2409e4f46b0148
npm notice integrity:     sha512-neejvnZNk7ont[...]NgAI30R9/KmPQ==
npm notice total files:   3
npm notice
+ @ULL-ESIT-PL-1920/lexer-generator@1.0.0
```

And now, since our repo is private, we have got a private module that we
can install and test assuming we have the permits!

```
[~/.../github-actions-learning/test-lexer-generator]$ npm i \@ULL-ESIT-PL-1920/lexer-generator   👈 Escape the @ to avoid shell interpretation
npm WARN test-lexer-generator@1.0.0 No description
npm WARN test-lexer-generator@1.0.0 No repository field.

+ @ULL-ESIT-PL-1920/lexer-generator@1.0.0
updated 1 package and audited 1 package in 1.683s
found 0 vulnerabilities
[~/.../github-actions-learning/test-lexer-generator]$ tree
.
├── node_modules
│   └── @ULL-ESIT-PL-1920
│       └── lexer-generator
│           ├── index.js
│           ├── package.json
│           └── sticky.js
├── package-lock.json
└── package.json
```

And now we can use the module:

```
[~/.../github-actions-learning/test-lexer-generator]$ node
Welcome to Node.js v12.10.0.
Type ".help" for more information.
> bL = require('@ULL-ESIT-PL-1920/lexer-generator')
[Function: buildLexer]
> const SPACE = /(?<SPACE>\s+)/;
> const RESERVEDWORD = /(?<RESERVEDWORD>\b(const|let)\b)/;
> const ID = /(?<ID>\b([a-z_]\w*))\b/;
> const STRING = /(?<STRING>"([^\\"]|\\.")*")/;
> const OP = /(?<OP>[+*\/=-])/;
> const myTokens = [
...   ['SPACE', SPACE], ['RESERVEDWORD', RESERVEDWORD], ['ID', ID],
...   ['STRING', STRING], ['OP', OP]
... ];
> lexer = bL(myTokens)
> lexer('let x = a + \nb')
[
  { type: 'RESERVEDWORD', value: 'let' },
  { type: 'ID', value: 'x' },
  { type: 'OP', value: '=' },
  { type: 'ID', value: 'a' },
  { type: 'OP', value: '+' },
  { type: 'ID', value: 'b' }
]
>
```

### Other ways to set the Scope

Alternatively, You can set up the scope
mapping for your project using 

1. Either a local `.npmrc` file in the project or 
2. Using the `publishConfig` option in the `package.json`. 

Here is a fragment of  a `package.json` using `publishConfig`:

  ```js
    "private": true,
    "publishConfig": {
      "registry":"http://my-internal-registry.local"
    } 
  ```


### Find your Module 

#### At npm

If you publish it on the npm website, go find your module on the <http://npmjs.org> website and share it with your friends.

#### At GitHub

If you use GitHub Registry go to the github repo page:

![](view-package-on-github.png)

and click on the package icon. You'll get s.t. like this:

![](view-package-lexer-generator.png)

#### Viewing an organization's packages

You can see all the packages installed in an organization and search for a specific package installed in an organization's repositories.

1. In the top right corner of GitHub, click your profile photo, then click Your profile.
2. On the left side of your profile page, under "Organizations", click the icon for your organization.
3. Under your organization name, click the Packages icon. 

   ![](organization-packages.png)

4. Click the name of the package that you want to view.


#### Viewing your packages

You can see all the packages you've installed and search for a specific package you've installed across all organizations and repositories.

1. In the top right corner of GitHub, click your profile photo, then click Your profile.
2. On the top of the profile page, in the main navigation, click Packages.
3. Click the name of the package that you want to view.

## Publishing Again!

The command `npm version` can be followed by one of the semantic versionin words 
like `npm version minor -m "Upgrade to %s for reasons"`:

```
[~/.../github-actions-learning/lexer-generator(master)]$ npm version patch
v1.0.1
```

This will update the `version` field in `package.json`:

```
[~/.../github-actions-learning/lexer-generator(master)]$ jq .version package.json
"1.0.1"
```

Then again, make a tag:

```
[~/.../github-actions-learning/lexer-generator(master)]$ git tag 1.0.1
```

commit, push and publish it:

```
[~/.../github-actions-learning/lexer-generator(master)]$ npm publish
npm notice
npm notice 📦  @ULL-ESIT-PL-1920/lexer-generator@1.0.1
...
+ @ULL-ESIT-PL-1920/lexer-generator@1.0.1
```

## Test in Production Mode

### Separated Test Repo

Once more we have to test the publication, now in Production mode (In this section I am using a different example from the previous one, but the ideas apply).
To make it automatic, we create a separated project:

```
[~/.../src/github-actions-learning]$ ls -l
drwxr-xr-x  16 casiano  staff  512 27 mar 11:47 lexer-generator
[~/.../src/github-actions-learning]$ mkdir test-lexer-generator
```

and move to it:

```
[~/.../src/github-actions-learning]$ cd test-lexer-generator/
[~/.../github-actions-learning/test-lexer-generator(master)]$ cat package.json
```

The idea is to set things in a way the by simply running s.t. like
`npm test` we can check that our npm module works in production.

For that we can create a `package.json` similar to this one:

```js
{
  "name": "test-lexer-generator",
  "version": "1.0.0",
  "description": "test @ULL-ESIT-PL-1920/lexer-generator in production mode",
  "main": "index.js",
  "scripts": {
    "test": "jest",
    "cit": "npm run clean; npm i --no-save && jest", 👈
    "clean": "rm -fR node_modules package-lock.json"
  },
  "keywords": ["PL"],
  "author": "Casiano Rodriguez-Leon <casiano.rodriguez.leon@gmail.com> (https://github.com/crguezl)",
  "license": "ISC",
  "dependencies": {
    "@ULL-ESIT-PL-1920/lexer-generator": "latest",
    "jest": "^25.2.3"
  }
}
```

Install the dependencies (our module and the test framework we are using):

```
[~/.../github-actions-learning/test-lexer-generator(master)]$ npm install
```

Now we have to write our tests. We recycle the tests of our module
by copying them to our project root directory:

```
[~/.../github-actions-learning/test-lexer-generator(master)]$ cp node_modules/\@ULL-ESIT-PL-1920/lexer-generator/test.js .
```

Of course, this file `test.js` loads the module using  a *psth thst is relative*:

```
[~/.../github-actions-learning/test-lexer-generator(master)]$ head -n 7 test.js | cat -n
     1	// If you want debugging output run it this way:
     2	// DEBUG=1 npm test
     3	const debug = process.env["DEBUG"];
     4	const { inspect } = require('util');
     5	const ins = (x) => { if (debug) console.log(inspect(x, {depth: null})) };
     6
     7	const buildLexer =require('./index'); 👈
```

We edit the file `test.js` and change  line 7 from the relative 
path to a "production" `require`:

```
[~/.../github-actions-learning/test-lexer-generator(master)]$ sed -ne '7,7p' test.js
const buildLexer =require('@ULL-ESIT-PL-1920/lexer-generator');
```

And now we 

1. Clean the directory
2. Install the dependencies
3. Run the tests

```
[~/.../github-actions-learning/test-lexer-generator(master)]$ npm run cit

> test-lexer-generator@1.0.0 cit /Users/casiano/local/src/github-actions-learning/test-lexer-generator
> npm run clean; npm i --no-save && jest

> rm -fR node_modules package-lock.json 👈

added 476 packages from 287 contributors and audited 1095502 packages in 20.627s 👈

 PASS  ./test.js
  ✓ const varName = "value" (7ms)
  ✓ let x = a +
β (1ms)
  ✓  // Entrada con errores
let x = 42*c

Test Suites: 1 passed, 1 total
Tests:       3 passed, 3 total
Snapshots:   0 total
Time:        2.494s
Ran all test suites.  👈
```

From now on, each time we publish a new version of the module
we have to change to this directory and run `npm run cit`

## References

### npm packages

* [npm developer guide](https://npmjs.org/doc/developers.html)
* [Working with package.json](https://docs.npmjs.com/getting-started/using-a-package.json) 
* [How to create Node.js Modules](https://docs.npmjs.com/getting-started/creating-node-modules)
* [How to install an npm package from GitHub directly?](https://stackoverflow.com/questions/17509669/how-to-install-an-npm-package-from-github-directly) in StackOverflow
* [Package.json documentation en npm site](https://docs.npmjs.com/files/package.json)
* [A Simple Guide to Publishing an npm Package](https://medium.com/@TeeFouad/a-simple-guide-to-publishing-an-npm-package-506dd7f3c47a) by Mostafa Fouad

)
### GitHub packages

* [About GitHub Packages](https://help.github.com/en/packages/publishing-and-managing-packages/about-github-packages)
* [Configuring npm for use with GitHub Packages](https://help.github.com/en/packages/using-github-packages-with-your-projects-ecosystem/configuring-npm-for-use-with-github-packages)
* [Authenticating with the GITHUB_TOKEN](https://help.github.com/en/actions/configuring-and-managing-workflows/authenticating-with-the-github_token)
* [Automatically Publish to npm using GitHub Actions](https://sergiodxa.com/articles/github-actions-npm-publish/)

### Scoped Packages

* [Working with scoped packages](https://docs.npmjs.com/getting-started/scoped-packages)
* [npm-scope manual: Scoped packages](https://docs.npmjs.com/misc/scope#publishing-public-scoped-packages-to-the-public-npm-registry)
* [Working with npm private modules. YouTube Video](https://youtu.be/O6JoXGnHK_Y)

### Semantic versioning and npm

* [Semantic versioning and npm](https://docs.npmjs.com/getting-started/semantic-versioning)
* [Semantic Versioning: Why You Should Be Using it](https://www.sitepoint.com/semantic-versioning-why-you-should-using/) SitePoint
* [YouTube Video: Semantic versioning and npm](https://youtu.be/kK4Meix58R4)
* [El comando npm version](https://docs.npmjs.com/cli/version)

### Old References

-   [Scapegoat on Github](https://github.com/brentertz/scapegoat)
-   [Scapegoat on npm](https://npmjs.org/package/scapegoat)
