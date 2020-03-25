## Reto: Ficheros INI

The **[INI](https://en.wikipedia.org/wiki/INI_file)** file format is an informal standard for configuration files.
INI files are simple text files with a basic structure composed of lists
of sections, and each section is a list of property-value pairs. The
exact rules for this format are as follows:

-   Blank lines and lines starting with semicolons are ignored.

-   Lines wrapped in `[` and `]` start a new section.

-   Lines containing an alphanumeric identifier followed by an `=`
    character add a setting to the current section.

-   Anything else is invalid.

That completely describes the language. Here is an example:

  ```ini
      ; comments are preceded by a semicolon
      ; global section
      searchengine=https://duckduckgo.com/?q=$1
      spitefulness=9.7

      ; each section but the global starts with [identifier]
      [gandalf]
      fullname=Mithrandir
      type=grey wizard
      website=http://tolkiengateway.net/wiki/Gandalf

      [gollum]
      fullname=Sméagol
      type=hobbit
      website=https://lotr.fandom.com/wiki/Gollum
  ```

### Requirements

* Our task is to write and **publish** a npm module (in your user scope) 
providing a function `parseINI` to convert a INI string into a JavaScript object reflecting the
configuration file. For example:

  ```js
      const parseINI = require('@aluXXXX/parse-ini');
      console.log(parseINI(`
      name=Torres Quevedo
      [address]
      invention=The chess player`));
      // → {name: "Torres Quevedo", address: {invention: "The chess player"}}
  ```

* Write several unit tests using [mocha](https://mochajs.org/#getting-started).
  Here you have an initial template using [should](https://www.npmjs.com/package/should)

  ```js
  var should = require("should");
  var parser = require('../lib/parse-ini.js');

  describe("parseINI", function() {
    it("should parse a INI input", function() {
      let expected = {name: "Torres Quevedo", address: {invention: "The chess player"}};
      let  result = parseINI(`
      name=Torres Quevedo
      [address]
      invention=The chess player`));
      expected.should.eql(result);
    })
    it("should have an error if not valid", function() {
      (function(){parseINI('chazam')}).should.throw(/Error/);
    })
  })
  ```
* Añada a su `README-md` de esta práctica los enlaces al repo del reto y al módulo en npm

