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

