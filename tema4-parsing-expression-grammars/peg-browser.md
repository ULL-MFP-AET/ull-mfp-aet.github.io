# PegJS en los Browser


Podemos cargar PEG.js usando un cdn como `unpkg.com` y usarlo en nuestros scripts:

[https://unpkg.com/pegjs@0.10.0/lib/peg.js](https://unpkg.com/pegjs@0.10.0/lib/peg.js)


o bien  podemos producir un parser para la web utilizando las opciones del ejecutable `pegjs`:

```
[~/.../pegjs/examples(master)]$ pegjs --help
Usage: pegjs [options] [--] [<input_file>]

Options:
   ...
  -e, --export-var <variable>        name of a global variable into which the
                                     parser object is assigned to when no module
                                     loader is detected
  --format <format>                  format of the generated parser: amd,
                                     commonjs, globals, umd (default: commonjs)
  ...
```

De esta forma le indicamos que el parser se guarde en la variable `calculator`:

```
[~/.../pegjs/examples(master)]$ pegjs -e calculator --format globals arithmetics.pegjs
```

```
[~/.../pegjs/examples(master)]$ tail -5 arithmetics.js
  root.calculator = {
    SyntaxError: peg$SyntaxError,
    parse:       peg$parse
  };
})(this);
```

Ahora, desde el JavaScript que llama al parser accedemos al objeto
mediante la variable `calculator`:

```js
[~/srcPLgrado/pegjs/examples(master)]$ cat calc.js 
$(document).ready(function() {
  $('#eval').click(function() {
    try {
      var result = calculator.parse($('#input').val());
      $('#output').html(result);
    } catch (e) {
      $('#output').html('<div class="error"><pre>\n' + String(e) + '\n</pre></div>');
    }
  });

  $("#examples").change(function(ev) {
    var f = ev.target.files[0]; 
    var r = new FileReader();
    r.onload = function(e) { 
      var contents = e.target.result;
      
      input.innerHTML = contents;
    }
    r.readAsText(f);
  });

});
```

El PEG describe una calculadora:

```
[~/srcPLgrado/pegjs/examples(master)]$ cat calculator.html 
```
```html
    <!DOCTYPE HTML>
    <html lang="en">
      <head>
        <meta charset="utf-8">
        <title>pegjs</title>
        <link rel="stylesheet" href="global.css" type="text/css" media="screen" charset="utf-8" />
      </head>
      <body>
        <h1>pegjs</h1>
        <div id="content">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
          <script src="arithmetics.js"></script>
          <script src="calc.js"></script>

          <p>
          Load an example:
          <input type="file" id="examples" />
          </p>

          <p>
          <table>
            <tr>
              <td>
                <textarea id="input" autofocus cols = "40" rows = "4">2+3*4</textarea> 
              </td>
              <td class="output">
                <pre>
                  <span id="output"></span> <!-- Output goes here! --> 
                </pre>
              </td>
              <td><button id="eval" type="button">eval</button></td>
            </tr>
          </table>
          </p>
        </div>
      </body>
    </html>
```

<img src="pegjs.png"/>

## Referencias

-   ~/srcPLgrado/pegjs/examples(master)]$ pwd -P
        /Users/casiano/local/src/javascript/PLgrado/pegjs/examples

-   [~/srcPLgrado/pegjs/examples(master)]$ git remote -v
        dmajda  https://github.com/dmajda/pegjs.git (fetch)
        dmajda  https://github.com/dmajda/pegjs.git (push)
        origin  git@github.com:crguezl/pegjs.git (fetch)
        origin  git@github.com:crguezl/pegjs.git (push)
