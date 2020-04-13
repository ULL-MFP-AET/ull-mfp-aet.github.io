# Árbol de Análisis Abstracto {#section:eyapaat}

Un Árbol de Análisis Abstracto (denotado *AAA*, en inglés *AST*) porta la misma información que el árbol de análisis sintáctico concreto pero de forma mas condensada, eliminándose
terminales y producciones que no aportan información.

## Alfabeto con Aridad o Alfabeto Árbol

No deja de ser curioso que es posible definir un equivalente del cierre de Kleene $$\Sigma*$$ de un alfabeto $$\Sigma$$ para modelizar matemáticamente los árboles.

Para ello se empieza definiendo lo que es un **alfabeto con función de aridad**:

### Definición

Un **alfabeto con función de aridad** es un par $$(\Sigma, \rho)$$ donde $$\Sigma$$ es un conjunto finito y
$$\rho$$ es una función 

$$\rho: \Sigma \rightarrow ℕ_0 \cup \{ * \}$$,

denominada **función de aridad**.

### Definición

Denotamos por $$\Sigma_k$$ los elementos del alfabeto con aridad *k*:

$$\Sigma_k = \{ a \in \Sigma :\ \rho(a) = k \}$$.

$$\Sigma_0$$ son las hojas, $$\Sigma_1$$ son los elementos con un solo hijo,
$$\Sigma_2$$ los nodos binarios, 
$$\Sigma_*$$ son los nodos con aridad variable, 
etc.

## Lenguaje de los Arboles

Definimos el $$B(\Sigma)$$ sobre $$\Sigma$$ inductivamente:

-   Todos los elementos de aridad 0  así como los de aridad variable $$\Sigma_*$$ están en $$B(\Sigma)$$:
    -   $$a \in  \Sigma_0$$ implica $$a \in B(\Sigma)$$
    -   $$a \in  \Sigma_*$$ implica $$a \in B(\Sigma)$$
-   Si $$b_1, \ldots , b_k \in B(\Sigma)$$ y $$f \in \Sigma_k$$ es un
    elemento $$k$$-ario o bien es de aridad variable, entonces $$f(b_1, \ldots , b_k) \in B(\Sigma)$$

Los elementos de $$B(\Sigma)$$ se llaman **árboles** o **términos**.

$$B(\Sigma)$$ es el conjunto de todos los árboles posibles.

Al igual que cuando parseamos las cadenas hablamos de **tokens** para hablar de la 
ocurrencia en la cadena de un elemento del alfabeto aquí hablamos de **nodos** para 
hablar de la ocurrencia de un elemento $$f \in \Sigma_k$$ dentro de un árbol.

$$B(\Sigma)$$ es a los *nodos* (árboles) lo  que $$\Sigma*$$ es a las tokens (strings).


## Ejemplo en Egg

Los AST con los que trabajamos en nuestro parser son de tres tipos

$$\Sigma = \{ VALUE, \, WORD, \, APPLY \}$$

y 

* $$\rho(VALUE) = 0$$, 
* $$\rho(WORD) = 0$$ y 
* $$\rho(APPLY) = *$$

* Los nodos del tipo `VALUE` representan constantes (literals) STRINGS o NUMBERS.
  - Al igual que con los tokens, los nodos son objetos y tienen propiedades.
  - Their `value` property contains the string or number value that they represent.
* Nodes of type `WORD` are used for identifiers (names). 
  - Such objects have a `name` property that holds the identifier’s name as a string. 
* Finally, `APPLY` nodes represent applications. 
  - They have an `operator` property that refers to the expression that is being applied, and 
  - an `args` property that holds the children: an array of ASTs for the argument expressions.

```
ast: VALUE{value: String | Number}
   | WORD{name: String}
   | APPLY{operator: ast, args: [ ast ...]}
```

The `>(x, 5)` would be represented like this:

```bash
$ cat greater-x-5.egg 
>(x,5)
$ ./eggc.js greater-x-5.egg 
$ cat greater-x-5.egg.evm 
{
  "type": "apply",
  "operator": {
    "type": "word",
    "name": ">"
  },
  "args": [
    {
      "type": "word",
      "name": "x"
    },
    {
      "type": "value",
      "value": 5
    }
  ]
}
```

## Gramática Árbol
Una es una cuadrupla $$((\Sigma, \rho), N, P, S)$$, donde:

-   $$(\Sigma, \rho)$$ es un alfabeto con aricidad
    $$\rho: \Sigma \rightarrow ℕ$$

-   $$N$$ es un conjunto finito de variables sintácticas o no terminales

-   $$P$$ es un conjunto finito de reglas de producción de la forma
    $$X \rightarrow s$$ con $$X \in N$$ y $$s \in B(\Sigma \cup N)$$

-   $$S \in N$$ es la variable o símbolo de arranque

## Notación de Dewey o Coordenadas de un Árbol

La [notación de Dewey](https://en.wikipedia.org/wiki/Dewey_Decimal_Classification) 
es una forma de
especificar los subárboles de un árbol $$t \in B(\Sigma)$$. La notación
sigue el mismo esquema que la numeración de secciones en un texto: es
una palabra formada por números separados por puntos. Así *t/2.1.3*
denota al tercer hijo del primer hijo del segundo hijo del árbol $$t$$. La
definición formal sería:

-   $$t/\epsilon = t$$

-   Si $$t = a(t_1, \ldots t_k)$$ y $$j \in \{ 1 \ldots k \}$$ y $$n$$ es una
    cadena de números y puntos, se define inductivamente el subárbol
    $$t/j.n$$ como el subárbol $$n$$-ésimo del $$j$$-ésimo subárbol de $$t$$.
    Esto es: $$t/j.n = t_j/n$$


