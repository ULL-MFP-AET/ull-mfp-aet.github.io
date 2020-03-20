## Ejercicios de Expresiones Regulares {#section:ejercicioslastindex}

### Ejercicios de EloquentJS

1. Haga los ejercicios de expresiones regulares en 
[Eloquent JavaScript](http://eloquentjavascript.net/09_regexp.html#h_TcUD2vzyMe)

### Ejercicios de Cursos Anteriores

1. Haga los ejercicios de expresiones regulares en los apuntes de otros años
[http://crguezl.github.io/pl-html/node7.html](http://crguezl.github.io/pl-html/node7.html)

### Cadenas

1.  Escriba una expresión regular que reconozca las cadenas de doble
    comillas. Debe permitir la presencia de comillas y caracteres
    escapados.

### Números
1.  Escriba una expresión regular que reconozca los números en punto flotante (por ejemplo `-2.3e-1`, `-3e2`, `23`, `3.2`)
2.  El siguiente ejemplo comprueba la validez de números de teléfono:

```
        [~/local/src/javascript/PLgrado/regexp]$ pwd -P
        /Users/casiano/local/src/javascript/PLgrado/regexp
        [~/local/src/javascript/PLgrado/regexp]$ cat phone.html
```

```html
        <!DOCTYPE html>
        <html>  
          <head>  
            <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
            <meta http-equiv="Content-Script-Type" content="text/javascript">  
            <script type="text/javascript">  
              var re = /\(?\d{3}\)?([-\/\.])\d{3}\1\d{4}/;  
              function testInfo(phoneInput){  
                var OK = re.exec(phoneInput.value);  
                if (!OK)  
                  window.alert(RegExp.input + " isn't a phone number with area code!");  
                else
                  window.alert("Thanks, your phone number is " + OK[0]);  
              }  
            </script>  
          </head>  
          <body>  
            <p>Enter your phone number (with area code) and then click "Check".
                <br>The expected format is like ###-###-####.</p>
            <form action="#">  
              <input id="phone"><button onclick="testInfo(document.getElementById('phone'));">Check</button>
            </form>  
          </body>  
        </html>
```

### Paréntesis 

1. Paréntesis en la cadena de reemplazo

```js
        > str = "John Smith"
        'John Smith'
        > newstr = str.replace(re, "$2, $1")
        'Smith, John'
```

11.  ¿Que casa con cada paréntesis en esta regexp para los  pares nombre-valor?

```js
            > x = "h     = 4"
            > r = /([^=]*)(\s*)=(\s*)(.*)/
            > r.exec(x)
            >
```

### lastIndex

2.  El método `exec`.

  If your regular expression uses the `g` flag, you can use the `exec`
  method multiple times to find successive matches in the same string.
  When you do so, the search starts at the substring of str specified
  by the regular expression’s `lastIndex` property.
  
  ```js
        > re = /d(b+)(d)/ig
        /d(b+)(d)/gi
        > z = "dBdxdbbdzdbd"
        'dBdxdbbdzdbd'
        > result = re.exec(z)
        [ 'dBd', 'B', 'd', index: 0, input: 'dBdxdbbdzdbd' ]
        > re.lastIndex
        3
        > result = re.exec(z)
        [ 'dbbd', 'bb', 'd', index: 4, input: 'dBdxdbbdzdbd' ]
        > re.lastIndex
        8
        > result = re.exec(z)
        [ 'dbd', 'b', 'd', index: 9, input: 'dBdxdbbdzdbd' ]
        > re.lastIndex
        12
        > z.length
        12
        > result = re.exec(z)
        null
  ```

