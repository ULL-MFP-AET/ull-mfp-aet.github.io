::: {.post_body}
Creating and publishing a node.js module
========================================

Creating a node module and publishing it to npm is a fairly
straightforward process. Haven't done it yet? Not sure what I'm talking
about? Here's a quick tutorial to speed you along.

What is npm?
------------

npm is an online registry for open-source node.js projects, modules,
resources, etc. You can find it at <http://npmjs.org>.

npm is also the official package manager for node.js, and provides a
command line interface (CLI) for interacting with the registry. This
utility comes bundled with node.js and is installed automatically. For
API documentation, visit <https://npmjs.org/doc/> or just type `npm` in
your terminal.

For you ruby devs, npm is akin to [rubygems](http://rubygems.org/).

Don't have node.js installed?
-----------------------------

You'll of course need to install node.js and npm in order to follow
along. Try one of the following install options or just read along.

-   Homebrew users can simply run `brew install node`
-   Download a binary from <http://nodejs.org/>
-   Use [Node Version Manager (NVM)](https://github.com/creationix/nvm)
    -- *recommended*

Configure npm
-------------

Let's get started by configuring npm a little bit. Go ahead and enter
these commands in a terminal, using your own information. This way, when
we run some npm commands later, it will already know who we are and will
be able to autocomplete some information for us.

    npm set init.author.name "Brent Ertz"

    npm set init.author.email "brent.ertz@gmail.com"

    npm set init.author.url "http://brentertz.com"

      

This next command will prompt you for an email and password, create or
verify a user in the npm registry, and save the credentials to the
`~/.npmrc` file.

    npm adduser

      

Create a node module
--------------------

A Node/npm module is just an ordinary JavaScript file with the addition
that it must follow the [CommonJS module
spec](http://www.commonjs.org/specs/modules/1.0/). Luckily, this is
really not as complex as it sounds. Node modules run in their own scope
so that they do not conflict with other modules. Node relatedly provides
access to some [globals](http://nodejs.org/api/globals.html) to help
facilitate module interoperability. The primary 2 items that we are
concerned with here are `require` and `exports`. You `require` other
modules that you wish to use in your code and your module `exports`
anything that should be exposed publicly. For example:

    var other = require('other_module');
    module.exports = function() {
        console.log(other.doSomething());
    }
      

For our demo, we'll create an npm module consisting of a couple utility
methods for escaping and unescaping HTML entities -- commonly needed
utils to prevent
[XSS](http://en.wikipedia.org/wiki/Cross-site_scripting) attacks when
rendering user generated content. I'll call this project, 'Scapegoat',
because I like the sound of it and also because a quick search of the
npm registry reveals that the name has not yet been taken. *Note that if
you are coding along with me, and plan to publish your module to npm,
you'll need to give your module a unique name.*

To get started, I created a [new repository on my Github
account](https://github.com/brentertz/scapegoat) and then cloned it
locally.

    git clone git@github.com:brentertz/scapegoat.git
    cd scapegoat
      

Executing the following command will ask you a bunch of questions, and
then write out a `package.json` file. It is this file that effectively
turns your code into a package.

    npm init

      

Have a look to see what the file contains; it is pretty human-readable.
Further details and explanation of the contents of the package.json file
can be found at <https://npmjs.org/doc/json.html>. Our initial version
looks like the following, but we'll be updating this further as we go
along.

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
      

Now we can actually get on to the business of writing code. Create an
`index.js` file to hold the primary module code. It'll look something
like the following. *Note the use of `module.exports`, which we
discussed previously, and is needed to make code available for use by
other modules. Further, as our module is not reliant on any other
modules, we did not need to `require` anything.*

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
      

Next, we'll surely want to write some tests. *Perhaps it would have been
preferable to write them first.* Regardless, I prefer to use the
[Mocha](http://visionmedia.github.io/mocha/) and
[Chai](http://chaijs.com/) frameworks, but you can use whatever you
like. These can be installed and persisted to the `package.json` file
with the following commands. *Note that they are added to the
'devDependencies' section, as they are only required during development
and not at runtime.*

    npm install mocha --save-dev

    npm install chai --save-dev

      

The above commands will also create a `node_modules` folder in your
project directory containing those dependencies. Following best
practices, we'll want to keep the `node_modules` folder out of the git
repository. We can do that by adding a `.gitignore` file to our project
root, with the following contents.

    node_modules

      

Continuing on, let's create a `test` directory to hold our tests. As our
primary module file is called `index.js`, within the `test` directory I
will create a file by the same name -- a simple convention. Mocha will
by default run all tests in this directory. Our test should look
something like the following. *Note that I am using the `should` syntax
provided by the Chai framework. Also note the use of `require` to pull
in our module code into the test.*

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
      

But how do we actually run the tests? Following the Mocha docs and to
keep things simple, we'll add a `Makefile` to the root of the project
with an associated `test` target. Note that most projects seem to be
using Grunt rather than Make these days. Regardless, our file should
contain the following. *Note that the indentation after the test target
must be a tab and not spaces.*

    test:
        ./node_modules/.bin/mocha --reporter spec

     .PHONY: test
      

After doing so, we can then execute the tests by entering following
command.

    make test

      

To improve upon this, we can now tell npm how to run our tests by simply
adjusting the `scripts:test` section of our `package.json` file.

    "scripts": {

      "test": "make test"

    },

      

After doing so, we can then run the following command to run our tests.

    npm test

      

The output should look something like the following.

    npm test

    > scapegoat@0.0.0 test /Users/brent/Development/scapegoat
    > make test

    ./node_modules/.bin/mocha --reporter spec


      #escape
        ✓ converts & into &amp;
        ✓ converts " into &quot;
        ✓ converts ' into &#39;
        ✓ converts < into &lt;
        ✓ converts > into &gt;

      #unescape
        ✓ converts &amp; into &
        ✓ converts &quot; into "
        ✓ converts &#39; into '
        ✓ converts &lt; into <
        ✓ converts &gt; into >


      10 passing (7ms)
      

For fun, try changing the Mocha `reporter` setting in your `Makefile`
from `spec` to `nyan`. Then rerun your tests.

    npm test

    > scapegoat@0.1.0 test /Users/brent/Development/scapegoat
    > make test

    ./node_modules/.bin/mocha --reporter nyan
     10  -_-_-_-_-_-_,------,
     0   -_-_-_-_-_-_|   /_/
     0   -_-_-_-_-_-^|__( ^ .^)
         -_-_-_-_-_-  ""  ""

      10 passing (12ms)
      

Okay great, our tests are passing. Let's add a few items that will help
to round out our project.

It is always a good idea to include some documentation with your
project, so I'll add a `README.md`, using markdown syntax. Using
markdown is a good idea because it will be nicely displayed on both
Github and npm.

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
      

As you may have noticed in the readme above, I referenced the version
0.1.0 in the release history. We'll need to update that in our
`package.json`. If you are not familiar with [semantic versioning aka
SemVer](http://semver.org/), please add it to your reading list.

    "version": "0.1.0",

      

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
      

Great, the module is complete. Prior to publishing to npm, let's first
ensure that any changes have been committed to git and that everything
has been pushed up to Github. It is also a good idea to create a version
tag as well. Here's how to do just that.

    git tag 0.1.0
    git push origin master --tags
      

Publishing to npm?
------------------

Note that for whatever reason if you decide not to publish your module
on npm, the npm package format provides value in itself in both
portability and ease of installation. For example, you can install
packages directly from Github, and even specify a tag, sha, or branch if
you want.

    npm install git://github.com/brentertz/scapegoat.git
    npm install git://github.com/brentertz/scapegoat.git#0.1.0
      

Before publishing, be sure to test that your package installs and works
correctly. This does not mean running the tests as we did above, but
rather attempting an actual install.

-   Verify that the package installs properly. From your package root
    directory, enter the following to install your package globally.

<!-- -->

      npm install . -g
      

-   Check to see if it exists.

<!-- -->

      npm ls -g
      

-   To go one step further, switch to another directory, open the
    node-repl, `require` your module and try it out.

<!-- -->

      node
      > var escape = require('scapegoat').escape;
      [Function]
      > escape('<h1>Hello World!</h1>');
      '&lt;h1&gt;Hello World!&lt;/h1&gt;'
      >
      

Hopefully everything worked as expected and you can now move on to the
publishing step. All of the meta information is contained in the
`package.json` file. And remember from earlier that we have already
registered on npm, with the `npm adduser` command. With that, the actual
publishing part is really easy.

    npm publish
      

Afterwards, you'll be able to install your package directly by name
rather than having to point at the Github url.

    npm install scapegoat
      

Lastly, go find your module on the <http://npmjs.org> website and share
it with friends. Here's [npm's Scapegoat
page](https://npmjs.org/package/scapegoat).

What should you publish?
------------------------

As shown in our demo, your contribution does not have to be crazy
complex or particularly ground-breaking. If you have a bit of code that
you find useful across multiple projects or believe that others might
find useful as well, consider publishing it on npm. Others may feel the
same.

Be sure to check out what is already available too. Chances are that you
may either find what you need already exists, find a project to
contribute to, or at least find some inspiration.

More information
----------------

-   [npm developer guide](https://npmjs.org/doc/developers.html)
-   [Scapegoat on Github](https://github.com/brentertz/scapegoat)
-   [Scapegoat on npm](https://npmjs.org/package/scapegoat)
:::
