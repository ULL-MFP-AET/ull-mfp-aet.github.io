# Tema 2: Expresiones Regulares y Análisis Léxico


## Expresiones Regulares

### El Constructor

* [EJS: Creating a regular expression](https://eloquentjavascript.net/09_regexp.html#h_5w4yGFJRYl)


The `RegExp` constructor creates a regular expression object for matching text with a pattern.

Literal and constructor notations are possible:

```js
/pattern/flags; 
new RegExp(pattern [, flags]);
```

* The literal notation provides compilation of the regular expression
when the expression is evaluated. 
* Use literal notation when the regular
expression will remain constant. 
* For example, if you use literal notation
to construct a regular expression used in a loop, the regular expression
won't be recompiled on each iteration.
* The constructor of the regular expression object, for example,
`new RegExp("ab+c")`, provides runtime compilation of the regular
expression. 
* Use the constructor function when you know the regular
expression pattern will be changing, or you don't know the pattern and
are getting it from another source, such as user input.
* When using the constructor function, the normal string escape rules
(preceding special characters with `\` when included in a string) are
necessary. For example, the following are equivalent:

```js
var re = /\w+/;
var re = new RegExp("\\w+");
```

#### Ejercicio

- Ejercicio: [Usar new Regexp("string") versus slash literal](https://youtu.be/ASQ35gSjmeI). Similitudes y diferencias. Vídeo del profesor
- [![](http://i3.ytimg.com/vi/ASQ35gSjmeI/hqdefault.jpg)](https://youtu.be/ASQ35gSjmeI)
- Explique la diferencia observada entre las dos formas de construir una RegExp

### Test

* [EJS: Testing for matches](https://eloquentjavascript.net/09_regexp.html#h_vPyyYjMEtz)

### exec

*  RegExp.prototype.[exec](https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/RegExp/exec)

The `exec()` method executes a search for a match in a specified string. Returns a result array, or `null`.

If you are executing a match simply to find `true` or `false`, 
use the `RegExp.prototype.test()` method or the `String.prototype.search()` method.




### match
*  String.prototype.[match](https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String/match)
*  
String.prototype.[replace](https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String/replace)

## El operador OR: Circuito Corto

1.  ¿Cual es la salida? ¿Porqué?

```js
        > "bb".match(/b|bb/)

        > "bb".match(/bb|b/)
```


### Parenthesis

* [EJS: Matches and groups](https://eloquentjavascript.net/09_regexp.html#h_CV5XL/TADP)


¿Que casa con cada paréntesis en esta regexp para los  pares nombre-valor?

```js
            > x = "h     = 4"
            > r = /([^=]*)(\s*)=(\s*)(.*)/
            > r.exec(x)
            >
```


```js
console.log(/bad(ly)?/.exec("bad"));
// → ["bad", undefined]
console.log(/(\d)+/.exec("123"));
// → ["123", "3"]
```

### The Date Class

* [EJS: The Date Class](https://eloquentjavascript.net/09_regexp.html#h_8U7L7LCU27)

```js
function getDate(string) {
  let [_, month, day, year] =
    /(\d{1,2})-(\d{1,2})-(\d{4})/.exec(string);
  return new Date(year, month - 1, day);
}
console.log(getDate("1-30-2003"));
// → Thu Jan 30 2003 00:00:00 GMT+0100 (CET)
```

### Word and string boundaries

* [EJS: Word and string boundaries](https://eloquentjavascript.net/09_regexp.html#h_26ixny78VY)

```js
> /\d+/.exec('b45a')
[ '45', index: 1, input: 'b45a' ]
> /^\d+$/.exec('b45a')
null
```

```js
console.log(/cat/.test("concatenate"));
// → true
console.log(/\bcat\b/.test("concatenate"));
// → false
```

### Backreferences in pattern: \N and \k&lt;name&gt; {#backreferences}

We can use the contents of capturing groups `(...)` not only in the result or in the replacement string, but also in the pattern itself.

#### By Number

A backreference `\n` inside a regexp, where `_n_` is a positive integer. A back reference to the last substring matching the `n` parenthetical in the regular expression (counting left parentheses).

For example, `/apple(,)\sorange\1/` matches `'apple, orange,'` in `"apple, orange, cherry, peach."` 

See also section [Backreferences in pattern: \N and \k&lt;name&gt;](https://javascript.info/regexp-backreferences) of the book *The Modern JavaScript Tutorial*

```js
> chuchu = /^(a+)-\1$/
/^(a+)-\1$/
> chuchu.exec("aa-aa")
[ 'aa-aa', 'aa', index: 0, input: 'aa-aa' ]
> chuchu.exec("aa-a")
null
> chuchu.exec("a-a")
[ 'a-a', 'a', index: 0, input: 'a-a' ]
> chuchu.exec("a-ab")
null
```

#### Forward References

Forward references can also be used, but be sure the referenced parenthesis
has matched when is going to be used. This usually means that the forward reference
is inside some repetition group. For example, this regexp matches with `train` only if 
it is prefixed by at least one `choo`:

```js
[~/.../github-actions/225-github-actions-demo(master)]$ node
Welcome to Node.js v13.5.0.
Type ".help" for more information.
> regex = /(\2train|(choo))+/
/(\2train|(choo))+/
> regex.exec('choochootrain')
[
  'choochootrain',
  'train',
  undefined,
  index: 0,
  input: 'choochootrain',
  groups: undefined
]
```

It works also in other languages as Ruby and Perl:

```ruby
$ irb
irb(main):052:0> regex = /(\2train|(choo))+/
=> /(\2train|(choo))+/
irb(main):053:0> 'choochootrain' =~ regex
=> 0
irb(main):054:0> $&
=> "choochootrain"
irb(main):055:0> $1
=> "chootrain"
irb(main):056:0> $2
=> "choo"
```

#### By Name

To reference a named group we can use <code class="pattern">\k&lt;name&gt;</code>

```js
[~/javascript-learning/xregexpexample(gh-pages)]$ nvm use v13
Now using node v13.5.0 (npm v6.13.4)
> regexp = /(?<quote>['"])([^'"]*)\k<quote>/;
/(?<quote>['"])([^'"]*)\k<quote>/
> `He said: "She is the one!".`.match(regexp)
[
  '"She is the one!"',
  '"',
  'She is the one!',
  index: 9,
  input: 'He said: "She is the one!".',
  groups: [Object: null prototype] { quote: '"' }
]
```

Be sure to use a modern version of JS:

```js
[~/javascript-learning/xregexpexample(gh-pages)]$ node --version
v8.1.2
> regexp = /(?<quote>['"])([^'"]*)\k<quote>/;
SyntaxError: Invalid regular expression: /(?<quote>['"])(.*?)\k<quote>/: Invalid group
```

### Backtracking en Expresiones Regulares

- [EJS: Backtracking](https://eloquentjavascript.net/09_regexp.html#h_NFMtGK0tD3)

¿Con que cadenas casa la expresión regular `/^(11+)\1+$/`?

```js
        > '1111'.match(/^(11+)\1+$/) # 4 unos
        [ '1111',
          '11',
          index: 0,
          input: '1111' ]
        > '111'.match(/^(11+)\1+$/) # 3 unos
        null
        > '11111'.match(/^(11+)\1+$/) # 5 unos
        null
        > '111111'.match(/^(11+)\1+$/) # 6 unos
        [ '111111',
          '111',
          index: 0,
          input: '111111' ]
        > '11111111'.match(/^(11+)\1+$/) # 8 unos
        [ '11111111',
          '1111',
          index: 0,
          input: '11111111' ]
        > '1111111'.match(/^(11+)\1+$/)
        null
        > 
```

### Diophantic Equations

A Diophantine equation is an indeterminate polynomial equation that allows the variables to be integers only.

On September 2009 [I](https://www.perlmonks.org/?node_id=626604) wrote a small piece in [Perl Monks](https://www.perlmonks.org) titled:

* [The Oldest Plays the Piano](https://www.perlmonks.org/?node_id=796576)

that illustrates (in Perl) how to solve a set of diophantine equations
using Perl Extended Regular Expressions. 

#### Exercise

Write a program that using a regular expression computes a integer solution
to the diophantine equation $$4x+5y=77$$

Generalize the former solution and write a function:

```js
           diophantine(a, b, c)
```

that returns an array `[x, y]` containing a
solution to the diophantine equation
$$a \times x + b \times y = c$$
or `null` if there is no such solution

Since to solve this problem you have to dynamically create the regexp, review section [Dynamically creating RegExp objects](https://eloquentjavascript.net/09_regexp.html#h_Rhu25fogrG) of the Eloquent JS book.

### replace

The `replace()` method of the String objects returns a new string with some or all matches of
a pattern replaced by a replacement.  
The pattern can be a string or a `RegExp`, 
and the replacement can be a string or a function to be called
for each match.

```js
> re = /apples/gi
/apples/gi
> str = "Apples are round, and apples are juicy."
'Apples are round, and apples are juicy.'
> newstr = str.replace(re, "oranges")
'oranges are round, and oranges are juicy.'
```

We can refer to matched groups in the replacement string:

```js
console.log(
  "Liskov, Barbara\nMcCarthy, John\nWadler, Philip"
    .replace(/(\w+), (\w+)/g, "$2 $1"));
// → Barbara Liskov
//   John McCarthy
//   Philip Wadler
```
The `$1` and `$2` in the replacement string refer to the parenthesized groups in the pattern.

### Using a function to compute the replacement string

The replacement string can be a function to be invoked to create the
new substring (to put in place of the substring received):

```js
let s = "the cia and fbi";
console.log(s.replace(/\b(fbi|cia)\b/g,
            str => str.toUpperCase()));
// → the CIA and FBI
```

The arguments supplied to this function 

```js
(match, p1, p2, ..., pn, offset, string) => { ... }
```

are:

| **Possible name** | **Supplied value** |
| ----------------- | ------------------ |
|match              | The matched substring. (Corresponds to `$&`.)|
|`p1`, `p2`, ...    | The nth parenthesized submatch string, provided the first argument to replace was a RegExp object. (Corresponds to `$1`, `$2`, etc.) For example, if `/(\a+)(\b+)/`, was given, `p1` is the match for `\a+`, and `p2` for `\b+`.|
|`offset`             | The `offset` of the matched substring within the total string being examined  (For example, if the total string was `"abcd"`, and the                  matched substring was `"bc"`, then this argument will be `1` |
|string             |The total string being examined |

####  Ejemplo: Fahrenheit a Celsius

El siguiente ejemplo reemplaza los grados Fahrenheit con su equivalente en grados Celsius. 
Los grados Fahrenheit deberían ser un número acabado en `F`. 
La función devuelve el número Celsius acabado en `C`. 
Por ejemplo, si el número de entrada es `212F`, la función devuelve `100C`. Si el número es `0F`, la función devuelve `-17.77777777777778C`.

Véase solución en [codepen](https://codepen.io/crguezl/pen/xYevMY).

```
[~/javascript/learning]$ pwd -P
/Users/casiano/local/src/javascript/learning
[~/javascript/learning]$ cat f2c.js 
```

```javascript
#!/usr/bin/env node
function f2c(x)
{
  function convert(str, p1, offset, s)
  {
    return ((parseFloat(p1)-32) * 5/9) + "C";
  }
  var s = String(x);
  var test = /(\d+(?:\.\d*)?)F\b/g;
  return s.replace(test, convert);
}

var arg = process.argv[2] || "32F";
console.log(f2c(arg));
```
Ejecución:

```
[~/javascript/learning]$ ./f2c.js 100F
37.77777777777778C
[~/javascript/learning]$ ./f2c.js 
0C
```

<!--

* [Eloquent JavaScript (3d Edition): Regular Expressions](http://eloquentjavascript.net/3rd_edition/09_regexp.html)
  - Ejercicio: [Usar new Regexp("string") versus slash literal](https://youtu.be/ASQ35gSjmeI). Similitudes y diferencias. Vídeo del profesor
  - [![](http://i3.ytimg.com/vi/ASQ35gSjmeI/hqdefault.jpg)](https://youtu.be/ASQ35gSjmeI)
  - Explique la diferencia observada entre las dos formas de construir una RegExp

-->

### Greed and Lazy Operators

#### Exercise:

Write a function that removes all comments from a piece of JavaScript code. 

* [EJS: Greed and Lazy Operators](https://eloquentjavascript.net/09_regexp.
html#h_kiECehz+i+)

#### Exercise:

We have a text and need to replace all double quotes `"..."` with single quotes: '...'. (We are not considering escaped double quotes)

```js
let regexp = /".+"/g;
let str = 'a "witch" and her "broom" is one';
```

See [Greedy and lazy quantifiers](https://javascript.info/regexp-greedy-and-lazy) at the Modern JavaScript book



### Positive Lookahead

A positive lookahead has the syntax `X(?=Y)`: 

The regular expression engine finds `X` 
and then matches only if there’s `Y` immediately after it and the search continues
**inmediately after the `X`**.

For more information, see section [Lookahead and lookbehind](https://javascript.info/regexp-lookahead-lookbehind) of the Modern JavaScript Tutorial.

Example:

```js
        > x = "hello"
        'hello'
        > r = /l(?=o)/
        /l(?=o)/
        > z = r.exec(x)
        [ 'l', index: 3, input: 'hello' ]
```

**Exercise:** What is the output?

```js
> str = "1 turkey costs 30 €"
'1 turkey costs 30 €'
> str.match(/\d+(?=\s)(?=.*30)/)
```

### Negative Lookahead

A negative lookahead has the syntax `X(!=Y)`: 

The regular expression engine finds `X` 
and then matches only if there’s no `Y` immediately after the `X` and if so, 
the search continues
**inmediately after the `X`**.

**Exercise:** What is the output? Whose of these twos is matched?

```js
> reg = /\d+(?!€)(?!\$)/
/\d+(?!€)(?!\$)/
> s = '2€ is more than 2$ and 2+2 is 4'
'2€ is more than 2$ and 2+2 is 4'
> reg.exec(s)
```

### Positive Lookbehind 

Positive lookbehind has the syntax `(?<=Y)X`, 
it matches `X`, but only if there’s `Y` before it.

```js
> str = "1 turkey costs $30"
'1 turkey costs $30'
> str.match(/(?<=\$)\d+/)
[ '30', index: 16, input: '1 turkey costs $30', groups: undefined ]
```

### Negative Lookbehind

Negative lookbehind has the syntax `(?<!Y)X`, it matches `X`, 
but only if there’s no `Y` before it.

```js
> str = 'I bought 2Kg of rice by 3€ at the Orotavas\' country market'
"I bought 2Kg of rice by 3€ at the Orotavas' country market"
> str.match(/(?<!t )\d+/)
[
  '3',
  index: 24,
  input: "I bought 2Kg of rice by 3€ at the Orotavas' country market",
  groups: undefined
]
```

### Ejercicio: Poner Blanco después de Coma

Busque una solución al siguiente ejercicio (véase ’Regex to add space after punctuation sign’ en [PerlMonks](http://www.perlmonks.org/?node_id=319742)).
Se quiere poner un espacio en blanco después de la aparición de cada coma:

```js
        > x = "a,b,c,1,2,d, e,f"
        'a,b,c,1,2,d, e,f'
        > x.replace(/,/g,", ")
        'a, b, c, 1, 2, d,  e, f'
```

pero se quiere que 

1. la sustitución no tenga lugar si la coma esta incrustada entre dos dígitos. 
2. Además se pide que si hay ya un espacio después de la coma, no se duplique.

-  La siguiente solución logra el segundo objetivo, pero estropea los números:

```js
        > x = "a,b,c,1,2,d, e,f"
        'a,b,c,1,2,d, e,f'
        > x.replace(/,(\S)/g,", $1")
        'a, b, c, 1, 2, d, e, f'
```

-  Esta otra funciona bien con los números pero no con los espacios ya existentes:
  
```js
      > x = "a,b,c,1,2,d, e,f"
      'a,b,c,1,2,d, e,f'
      > x.replace(/,(\D)/g,", $1")
      'a, b, c,1,2, d,  e, f'
```

-  Explique cuando casa esta expresión regular:

```js
      > r = /(\d[,.]\d)|(,(?=\S))/g
      /(\d[,.]\d)|(,(?=\S))/g
```

- Aproveche que el método `replace` puede recibir como segundo
 argumento una función (vea
 [replace](https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global~O~bjects/String/replace)):

```js
      > z = "a,b,1,2,d, 3,4,e"
      'a,b,1,2,d, 3,4,e'
      > r = /(\d[,.]\d)|(,(?=\S))/g
      /(\d[,.]\d)|(,(?=\S))/g
      > f = function(match, p1, p2, offset, string) { return (p1 || p2 + " "); }
      [Function]
      > z.replace(r, f)
      'a, b, 1,2, d, 3,4, e'
```
      
Véase en [codepen](https://codepen.io/crguezl/pen/mXYbVZ)

### search

*  String.prototype.[search](https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String/search)

`str.search(regexp)`

If successful, `search` returns the index of the regular expression inside
the string. Otherwise, it returns `-1`.

When you want to know whether a pattern is found in a string use `search`
(similar to the regular expression `test` method); for more information
(but slower execution) use `match` (similar to the regular expression
`exec` method).


### lastIndex

* [EJS: The lastIndex property](https://eloquentjavascript.net/09_regexp.html#h_duFTd2hqd0)

Regular expression objects have properties. 

One such property is `source`, which contains the string that expression was created from. 

Another property is `lastIndex`, which controls, in some limited circumstances, where the next match will start.

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

```js
let input = "A string with 3 numbers in it... 42 and 88.";
let number = /\b\d+\b/g;
let match;
while (match = number.exec(input)) {
  console.log("Found", match[0], "at", match.index);
}
// → Found 3 at 14
//   Found 42 at 33
//   Found 88 at 40
```

### Parsing Ficheros **ini**

- [Parsing an INI file](https://eloquentjavascript.net/09_regexp.html#ini) Eloquent JavaScript

#### Otra Solución al Parsing de los Ficheros **ini**

- [Parsing de ficheros ini](http://crguezl.github.io/pl-grado-ini-files/): despliegue
- [Repo con el código del parsing de ficheros ini](https://github.com/crguezl/pl-grado-ini-files)


### Sticky flag "y", searching at position

Regular expressions can have options, which are written after the closing slash. 

- The `g` option makes the expression _global_, which, among other things, causes the `replace` method to replace all instances instead of just the first. 
- The `y` option makes it sticky, which means that it will not search ahead and skip part of the string when looking for a match. 
  
The difference between the global and the sticky options is that, when sticky is enabled, the match will succeed only if it starts directly at `lastIndex`, whereas with global, it will search ahead for a position where a match can start.

```js
let global = /abc/g;
console.log(global.exec("xyz abc"));
// → ["abc"]
let sticky = /abc/y;
console.log(sticky.exec("xyz abc"));
// → null
```

```js
let str = 'let varName = "value"';

let regexp = /\w+/y;

regexp.lastIndex = 3;
console.log( regexp.exec(str) ); // null (there's a space at position 3, not a word)

regexp.lastIndex = 4;
console.log( regexp.exec(str) ); // varName (word at position 4)
```

Véase también:

* [Sticky flag "y", searching at position](https://javascript.info/regexp-sticky)

### Analizadores Léxicos usando la Sticky flag

Si combinamos la flag sticky con el uso de paréntesis con nombre 
podemos construir un analizador léxico.

Para ello usaremos el hecho de que podemos acceder al paréntesis que casa
via el nombre:

```js
> RE = /(?<NUM>\d+)|(?<ID>[a-z]+)|(?<OP>[-+*=])/y;
/(?<NUM>\d+)|(?<ID>[a-z]+)|(?<OP>[-+*=])/y
> input = 'x=2+b'
'x=2+b'
> while (m = RE.exec(input)) { console.log(m.groups) }
[Object: null prototype] { NUM: undefined, ID: 'x', OP: undefined }
[Object: null prototype] { NUM: undefined, ID: undefined, OP: '=' }
[Object: null prototype] { NUM: '2', ID: undefined, OP: undefined }
[Object: null prototype] { NUM: undefined, ID: undefined, OP: '+' }
[Object: null prototype] { NUM: undefined, ID: 'b', OP: undefined }
```

Puesto que la expresión regular es un OR excluyente, sólo una de las subexpresiones
casa y el resto está `undefined`. 
Para detectar el token debemos recorrer el objeto buscando la clave cuyo valor no 
está `undefined`:

```js
> RE = /(?<NUM>\d+)|(?<ID>[a-z]+)|(?<OP>[-+*=])/y;
/(?<NUM>\d+)|(?<ID>[a-z]+)|(?<OP>[-+*=])/y
> input = 'x=2+b'
'x=2+b'
> names = ['NUM', 'ID', 'OP']
[ 'NUM', 'ID', 'OP' ]
> while (m = RE.exec(input)) { 
  console.log(names.find(n => m.groups[n] !== undefined)) }
ID
OP
NUM
OP
ID
```

El siguiente ejemplo ilustra la técnica:

```
[~/.../practicas/p2-t2-lexer(master)]$ cat sticky.js
```

```js
const str = 'const varName = "value"';
console.log(str);

const SPACE = /(?<SPACE>\s+)/;
const RESERVEDWORD = /(?<RESERVEDWORD>\b(const|let)\b)/;
const ID = /(?<ID>([a-z_]\w+))/;
const STRING = /(?<STRING>"([^\\"]|\\.")*")/;
const OP = /(?<OP>[+*\/-=])/;

const tokens = [
  ['SPACE', SPACE], ['RESERVEDWORD', RESERVEDWORD], ['ID', ID],
  ['STRING', STRING], ['OP', OP]
];

const tokenNames = tokens.map(t => t[0]);
const tokenRegs  = tokens.map(t => t[1]);

const buildOrRegexp = (regexps) => {
  const sources = regexps.map(r => r.source);
  const union = sources.join('|');
  // console.log(union);
  return new RegExp(union, 'y');
};

const regexp = buildOrRegexp(tokenRegs);

const getToken = (m) => tokenNames.find(tn => typeof m[tn] !== 'undefined');

let match;
while (match = regexp.exec(str)) {
  //console.log(match.groups);
  let t = getToken(match.groups);
  console.log(`Found token '${t}' with value '${match.groups[t]}'`);
}
```

See also:

* [Example: using sticky matching for tokenizing](http://2ality.com/2015/07/regexp-es6.html#example-using-sticky-matching-for-tokenizing) inside 
the chapter [New regular expression features in ECMAScript 6](http://2ality.com/2015/07/regexp-es6.html#example-using-sticky-matching-for-tokenizing)

### Ejercicios

* [Ejercicios de Expresiones Regulares en los apuntes](regexpejercicios.html)
* [Ejercicio: Palabras repetidas](https://youtu.be/GfLkvLM7pA8) Vídeo del profesor
   * [Repo en GitHub](https://github.com/ULL-ESIT-PL/repeated-words-regexp)
   * [![](http://i3.ytimg.com/vi/GfLkvLM7pA8/hqdefault.jpg)](https://youtu.be/GfLkvLM7pA8)
* [Ejercicio: Buscar las secuencias que empiezan por 12 en posiciones múltiplos de 6](https://youtu.be/A5JoNlTawFA) Vídeo del profesor
  * [![](http://i3.ytimg.com/vi/A5JoNlTawFA/hqdefault.jpg)](https://youtu.be/A5JoNlTawFA)
* Tarea. Haga los ejercicios en [https://regexone.com/](https://regexone.com/)
* Tarea. Haga los ejercicios en [https://www.w3resource.com/javascript-exercises/javascript-regexp-exercises.php](https://www.w3resource.com/javascript-exercises/javascript-regexp-exercises.php)

### Práctica p3-t2-regexp

Resuelva los ejercicios de Expresiones Regulares propuestos por el profesor

* [Práctica de Expresiones Regulares (p3-t2-regexp)](practicas/p3-t2-regexp/reto)


## Unicode y  Extensiones

### String Representation

The way JavaScript models Strings is based on the **Unicode** standard. This standard assigns a number to virtually every character you would ever need, including characters from Greek, Arabic, Japanese, Armenian, and so on. If we have a number for every character, a string can be described by a sequence of numbers.

JavaScript’s representation uses 16 bits per string element, which can describe up to $$2^{16}$$ different characters. But Unicode defines more characters than that: about twice as many. So some characters, such as many emoji, *take up two character positions* in JavaScript strings.

When comparing strings, JavaScript goes over the characters from left to right, comparing the Unicode codes one by one.

Most of the Unicode characters are associated with a specific **script**. The standard contains 140 different scripts — 81 are still in use today, and 59 are historic.

People are writing texts in at least 80 other writing systems, many of which We wouldn’t even recognize. For example, here’s a sample of Tamil handwriting:

![](https://eloquentjavascript.net/img/tamil.png)

JavaScript strings are encoded as a sequence of 16-bit numbers. These are called **code units**. 

A Unicode character code was initially supposed to fit within such a unit (which gives you a little over 65,000 characters). When it became clear that wasn’t going to be enough, many people balked at the need to use more memory per character.

To address these concerns, **UTF-16**, the format used by JavaScript strings, was invented. It describes most common characters using a single 16-bit code unit **but uses a pair of two such units for others**.

UTF-16 is generally considered a bad idea today. It seems almost intentionally designed to invite mistakes. *It’s easy to write programs that pretend code units and characters are the same thing*. 

And if your language doesn’t use two-unit characters, that will appear to work just fine. But as soon as someone tries to use such a program with some less common Chinese characters, it breaks. Fortunately, with the advent of emoji, everybody has started using two-unit characters, and the burden of dealing with such problems is more fairly distributed.

Unfortunately, obvious operations on JavaScript strings, such as getting their length through the length property and accessing their content using square brackets, deal only with code units.

```js
// Two emoji characters, horse and shoe
let horseShoe = "🐴👟";
console.log(horseShoe.length);
// → 4
console.log(horseShoe[0]);
// → (Invalid half-character)
console.log(horseShoe.charCodeAt(0));
// → 55357 (Code of the half-character)
console.log(horseShoe.codePointAt(0));
// → 128052 (Actual code for horse emoji)
```

JavaScript’s `charCodeAt` method gives you a code unit, not a full character code. The `codePointAt` method, added later, does give a full Unicode character. 

So we could use that to get characters from a string. 

But the argument passed to `codePointAt` is still an index into the sequence of code units. 
So to run over all characters in a string, we’d still need to deal with the question of whether a character takes up one or two code units.

A `for/of` loop can be used to iterate on strings. 
Like `codePointAt`, this type of loop was introduced at a time where people were acutely aware of the problems with UTF-16. When you use it to loop over a string, it gives you real characters, not code units.

```js
let roseDragon = "🌹🐉";
for (let char of roseDragon) {
  console.log(char);
}
// → 🌹
// → 🐉
```

If you have a character (which will be a string of one or two code units), you can use `codePointAt(0)` to get its code.

* Examples of [JavaScript y Unicode](https://github.com/ULL-ESIT-PL/unicode-js) (Repo en GitHub unicode-js)

### Unicode and Editors

* [Visual Studio Code Extension: Insert Unicode](https://marketplace.visualstudio.com/items?itemName=brunnerh.insert-unicode)
* En Vim:
  * `ga` shows the decimal, hexadecimal and octal value of the character under  the cursor.
  * Any utf character at all can be entered with a `Ctrl-V` prefix, either `<Ctrl-V> u aaaa` or `<Ctrl-V> U bbbbbbbb`, with `0 <= aaaa <= FFFF`, or `0 <= bbbbbbbb <= 7FFFFFFF`.
  * Digraphs work by pressing CTRL-K and a two-letter combination while in insert mode. `<Ctrl-K> a *` produces `α` `<Ctrl-K> b *` produces `β`, `<Ctrl-k> d =` produces `д`, etc.


### Unicode: Regular Expressions and International characters

[EloquentJS: International characters](https://eloquentjavascript.net/09_regexp.html#h_+y54//b0l+)

```javascript
> console.log("\u03A0")
Π
> console.log("\u03B1")
α
> "Πα".match(/\u03A0(\u03B1)/)
[ 'Πα', 'α', index: 0, input: 'Πα' ]
```

Because of JavaScript’s initial simplistic implementation and the fact that this simplistic approach was later set in stone as standard behavior, JavaScript’s regular expressions are rather dumb about characters that do not appear in the English language. For example, as far as JavaScript’s regular expressions are concerned, a **word character** is only one of the 26 characters in the Latin alphabet (uppercase or lowercase), decimal digits, and, for some reason, the underscore character. Things like _é_ or _β_, which most definitely are word characters, will not match `\w` (and _will_ match uppercase `\W`, the nonword category).

By a strange historical accident, `\s` (whitespace) does not have this problem and matches all characters that the Unicode standard
considers whitespace, including things like the nonbreaking space
and the Mongolian vowel separator:

`\s` casa con el carácter unicode Mongolian Vowel

![](mongolianvowel.png)

* [See: *What is the Mongolian vowel separator for?*](https://linguistics.stackexchange.com/questions/12712/what-is-the-mongolian-vowel-separator-for/12722)

* [Repo con Ejemplos de Unicode en JS](https://github.com/ULL-ESIT-PL/unicode-js)
* [Ejemplo unicode.js usando XRegExp](https://github.com/ULL-ESIT-GRADOII-PL/xregexp-example/blob/gh-pages/unicode.js)
* Read [JavaScript has a Unicode problem](https://mathiasbynens.be/notes/javascript-unicode) 2013


* [Eloquent JS: International characters](https://eloquentjavascript.net/09_regexp.html#h_+y54//b0l+)
* [JavaScript y Unicode](https://github.com/ULL-ESIT-PL/unicode-js) (Repo en GitHub unicode-js)
* [Repositorio con ejemplos de uso de XRegExp](https://github.com/ULL-ESIT-GRADOII-PL/xregexp-example) 
* [Ejemplos de extensiones de XRegExp para Unicode](https://github.com/ULL-ESIT-GRADOII-PL/xregexp-example/blob/gh-pages/unicode.js)


### XRegExp: Expresiones Regulares Extendidas (a la Perl)

* [ GitHub repo ilustrando el uso de XRegExp URL](https://github.com/ULL-ESIT-GRADOII-PL/xregexp-example)
* [xregexp repo en GitHub. Documentación](https://github.com/slevithan/xregexp)
* [http://xregexp.com/ website](http://xregexp.com/): Documentación
* [API de XRegExp](http://xregexp.com/api/)
  - [XRegExp](http://xregexp.com/api/#XRegExp)
  - [XRegExp.addToken](http://xregexp.com/api/#addToken)
  - [XRegExp.build](http://xregexp.com/api/#build) (addon)
  - [XRegExp.cache](http://xregexp.com/api/#cache)
  - [XRegExp.escape](http://xregexp.com/api/#escape)
  - [XRegExp.exec](http://xregexp.com/api/#exec)
  - [XRegExp.forEach](http://xregexp.com/api/#forEach)
  - [XRegExp.globalize](http://xregexp.com/api/#globalize)
  - [XRegExp.install](http://xregexp.com/api/#install)
  - [XRegExp.isInstalled](http://xregexp.com/api/#isInstalled)
  - [XRegExp.isRegExp](http://xregexp.com/api/#isRegExp)
  - [XRegExp.match](http://xregexp.com/api/#match)
  - [XRegExp.matchChain](http://xregexp.com/api/#matchChain)
  - [XRegExp.matchRecursive](http://xregexp.com/api/#matchRecursive) (addon)
  - [XRegExp.replace](http://xregexp.com/api/#replace)
  - [XRegExp.replaceEach](http://xregexp.com/api/#replaceEach)
  - [XRegExp.split](http://xregexp.com/api/#split)
  - [XRegExp.test](http://xregexp.com/api/#test)
  - [XRegExp.uninstall](http://xregexp.com/api/#uninstall)
  - [XRegExp.union](http://xregexp.com/api/#union)
  - [XRegExp.version](http://xregexp.com/api/#version)

#### XRegExp instance properties

- [<regexp>.xregexp.source](http://xregexp.com/api/#dot-source) (The original pattern provided to the XRegExp constructor)
- [<regexp>.xregexp.flags](http://xregexp.com/api/#dot-flags) (The original flags provided to the XRegExp constructor)

#### XRegExp. Unicode

*  [XRegExp Plugins](http://xregexp.com/plugins/)
*  [Regular Expressions.info: Unicode Regular Expressions](https://www.regular-expressions.info/unicode.html)

### Módulo @ull-esit-pl/uninums

Javascript supports Unicode strings, but parsing such strings to numbers is unsupported (e.g., the user enters a phone number using Chinese numerals).  
[uninums.js](https://raw.github.com/roysharon/uninums/master/uninums.js) is a small utility script that implements five methods for handling non-ASCII numerals in Javascript

* [Módulo @ull-esit-pl/uninums](https://www.npmjs.com/package/@ull-esit-pl/uninums)

```js
> uninums = require("@ull-esit-pl/uninums")
{ normalSpaces: [Function: normalSpaces],
  normalDigits: [Function: normalDigits],
  parseUniInt: [Function: parseUniInt],
  parseUniFloat: [Function: parseUniFloat],
  sortNumeric: [Function: sortNumeric] }
> uninums.parseUniInt('६.६')
6
> uninums.parseUniFloat('६.६')
6.6
> uninums.parseUniFloat('६.६e६')
6600000
> uninums.sortNumeric(['٣ dogs','١٠ cats','٢ mice']) 
[ '٢ mice', '٣ dogs', '١٠ cats' ]
> uninums.normalDigits('٢ mice')
'2 mice'
> uninums.normalDigits('٣ dog')
'3 dog'
> uninums.normalDigits('١٠ cats')
'10 cats'
> uninums.normalDigits('٠۴६')
'046'
```

### Extensiones a las Expresiones Regulares en ECMA6

* [New regular expression features in ECMAScript 6](http://www.2ality.com/2015/07/regexp-es6.html)



## RegExps en Otros lenguajes

Antiguos apuntes del profesor sobre el uso de RegExp en otros lenguajes:

### Perl

* [Expresiones Regulares en Perl](http://crguezl.github.io/ull-etsii-grado-pl-apuntes/node96.html)

### Varios Lenguajes

* [Expresiones Regulares en varios lenguajes](http://crguezl.github.io/ull-etsii-grado-pl-apuntes/node100.html)

### Python

* [Python](http://crguezl.github.io/ull-etsii-grado-pl-apuntes/node100.html#SECTION05440050000000000000)

### Ruby

* [Ruby](http://crguezl.github.io/ull-etsii-grado-pl-apuntes/node100.html#SECTION05440060000000000000)

### C

* [Expresiones Regulares en C](http://crguezl.github.io/ull-etsii-grado-pl-apuntes/node80.html)

### sed

* [Expresiones Regulares en sed](http://crguezl.github.io/ull-etsii-grado-pl-apuntes/node83.html)

## Análisis Léxico

* [Ejemplo de Analizador Léxico para JS](https://github.com/crguezl/ull-etsii-grado-pl-minijavascript/blob/gh-pages/tokens.js)
* [Descripción de la Práctica: Analizador Léxico para Un Subconjunto de JavaScript](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/practicas/practicaanalisislexicotdop2018.html)
* [Compiler Construction by Wikipedians](https://books.google.es/books?id=nMZnyp_zW8AC&pg=PA570#v=onepage&q=Lexical&f=false). Chapter  Lexical Analysis
* [Un caso a estudiar: El módulo npm lexical-parser](https://github.com/Eitz/lexical-parser)
* [Esprima. Chapter 3. Lexical Analysis (Tokenization)](http://esprima.readthedocs.io/en/latest/lexical-analysis.html)
    - [RepoULL-ESIT-GRADOII-PL/esprima-pegjs-jsconfeu-talk](https://github.com/ULL-ESIT-GRADOII-PL/esprima-pegjs-jsconfeu-talk)
* [jison-lex](https://github.com/zaach/jison-lex)
* [lexer](https://github.com/aaditmshah/lexer)
* [Expresiones Regulares en Flex](https://ull-esit-pl-1617.github.io/apuntesingenieriainformaticaPL/node19.html)

### Práctica p4-t2-lexer

* [Práctica Escribir un Analizador Léxico para Javascript (p4-t2-lexer)](practicas/p4-t2-lexer/README.md)

## Referencias

* [Apuntes de Expresiones Regulares](regexp) del profesor
* [Eloquent JavaScript: Regular Expressions](http://eloquentjavascript.net/09_regexp.html)
* [Chapter Regular expressions](https://javascript.info/regular-expressions) in the "Modern JavaScript Tutorial" book
* [New regular expression features in ECMAScript 6](http://2ality.com/2015/07/regexp-es6.html)

### Otros Apuntes del Profesor

* [Apuntes 16/17 de Expresiones Regulares](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/content/apuntes/regexp/) del profesor (gitbook)
* [Expresiones Regulares y Análisis Léxico en JavaScript](http://crguezl.github.io/ull-etsii-grado-pl-apuntes/node70.html) Apuntes del profesor cursos 2012-2014. Latex2html, LateX, GitHub 
* [Apuntes de la Asignatura Procesadores de Lenguajes](http://crguezl.github.io/pl-html/) GitHub Cursos 13-15 http://crguezl.github.io/pl-html
* [Expresiones Regulares y Análisis Léxico en JavaScript](https://crguezl.github.io/pl-html/node7.html) Latex2Html, LaTeX, nereida
