# Análisis Sintáctico Predictivo Recursivo {#section:predictivo}

La siguiente fase en la construcción del analizador es la fase de
análisis sintáctico. Esta toma como entrada el flujo de terminales y
construye como salida el árbol de análisis sintáctico abstracto.

El árbol de análisis sintáctico abstracto es una representación
compactada del árbol de análisis sintáctico concreto que contiene la
misma información que éste.

Existen diferentes métodos de análisis sintáctico. La mayoría caen en
una de dos categorías: 

1. ascendentes y 
2. descendentes. 
 
Los ascendentes
construyen el árbol desde las hojas hacia la raíz. 

Los descendentes lo
hacen en modo inverso. 

El que describiremos aquí es un descendente: se denomina **método de análisis predictivo descendente recursivo**.

## Introducción {#subsection:introduccion}

Supongamos una gramática $$G = (\Sigma, V, P, S)$$ con alfabeto $$\Sigma$$, conjunto de variables sintácticas (o no terminales) $$V$$, reglas de producción $$P$$ y símbolo de arranque $$S$$.


Por ejemplo, en la gramática de Egg este es el conjunto $$P$$ de reglas de producción:

```yacc
expression: STRING
          | NUMBER
          | WORD apply

apply: /* vacio */
     | '(' (expression ',')* expression? ')' apply
```

Sólo hay dos variables sintácticas $$V = \{ expression, \, apply \}$$. El símbolo de arranque $$S$$ es $$expression$$.

El conjunto de tokens es:

$$\Sigma = \{ STRING,\, NUMBER,\, WORD,\, '(',\, ')',\, ','  \}$$

En los métodos de Análisis Sintáctico Descendente Recursivo (PDR) se asocia una subrutina con cada variable sintáctica
$$A \in V$$. Dicha subrutina (que llamaremos `parseA()`) reconocerá el lenguaje
generado desde la variable $$A$$:

$$L_A(G) = \{ x \in \Sigma^* : A \stackrel{*}{\Longrightarrow} x \}$$

Esto es, $$L_A(G)$$ es el conjunto de frases del alfabeto que **derivan** en varias substituciones
desde la variable $$A$$.

Resumiendo: 

- Cuando construimos un PDR se escribe una rutina `parseA` por cada variable sintáctica en la gramática $$A \in V$$. 
- Una vez mas: Se le suele dar a la rutina asociada un nombre relacionado con la
variable sintáctica asociada, por ejemplo `parseA` será la función asociada con
la variable $$A \in V$$.
- La función de `parseA()` es reconocer el lenguaje $$L(A)$$ generado por $$A$$.

En Egg, para hacer el parser escribimos dos funciones 

- `parseExpression` y 
- `parseApply`.

La función `parseExpression` reconoce el lenguaje 

$$L(expression) = \{ x \in \Sigma^* : expression \stackrel{*}{\Longrightarrow} x \}$$ 

y la función  `parseApply` reconoce el lenguaje 

$$L(apply) = \{ x \in \Sigma^* : apply \stackrel{*}{\Longrightarrow} x \}$$


En un PDR, la estrategia general que sigue la rutina `parseA` para reconocer $$L(A)$$ es
decidir en términos del terminal `a` por el que vamos en la entrada cual de las partes derechas $$\alpha_i$$ de las reglas de $$A$$

$$A \rightarrow \alpha_1$$ 

$$A \rightarrow \alpha_2$$ 

$$ \ldots $$

$$A \rightarrow \alpha_n$$ 

se aplica para construir el árbol. Si es así, a continuación se pasa a comprobar que la entrada que sigue a continuación de `a...` pertenece al lenguaje generado por $$\alpha_i$$. 

Por ejemplo, en la gramática de Egg estas son las reglas para `expression`:

```yacc
expression: STRING
          | NUMBER
          | WORD apply
```

Vemos que las tres reglas empiezan por un token distinto. Si sabemos que el token actual es `WORD` estamos seguros que la regla que se aplica es la tercera.

En un analizador predictivo descendente recursivo (PDR o APDR) se
asume que el terminal/token que actualmente esta siendo observado (que a partir de ahora denominaré `lookahead`) permite determinar unívocamente que producción de $$A$$ hay
que aplicar. 

Una vez que dentro del cuerpo de  `parseA` se ha determinado que la regla concreta por la que 
continuar la derivación es la regla $$A \rightarrow \alpha$$, el algoritmo procede a reconocer
$$L_{\alpha}(G)$$, el lenguaje generado por la parte derecha de la regla: $$\alpha$$:

$$L_{\alpha}(G) = \{ x \in \Sigma^* : \alpha \stackrel{*}{\Longrightarrow} x \}$$

Para ello se procede así. Supongamos que $$\alpha = X_1 \ldots X_n$$, donde $$X_i$$ es o bien un token $$X_i \in \Sigma$$ o bien una variable $$X_i \in V$$.

- las apariciones de terminales $$X_i$$ en $$\alpha$$ son emparejadas con los terminales en la entrada avanzando en el flujo de tokens, 

  ```js
  lookahead = lex();
  ```

mientras que

- las apariciones de variables sintácticas $$X_i = B \in V$$ en $$\alpha$$ se traducen en llamadas a la correspondiente subrutina asociada con `parseB`.

La secuencia de llamadas cuando se procesa la entrada mediante el
siguiente programa construye "implícitamente" el árbol de análisis
sintáctico concreto.

El análisis predictivo confía en que, si
estamos ejecutando la entrada del procedimiento `parseA`, el cuál está
asociado con la variable $$A \in V$$, el símbolo terminal que esta en la
entrada $$a$$ determine de manera unívoca cual de las reglas de producción
$$A \rightarrow a \alpha_i$$ debe ser procesada.

Si se piensa, esta condición requiere que todas las partes derechas
$$\alpha_i$$ de las reglas $$A \rightarrow \alpha_i$$ de $$A$$ "comiencen" por
diferentes símbolos. 

denotamos por  $$FIRST(\alpha)$$ al conjunto de terminales que pueden aparecer al "comienzo" de una derivación desde $$\alpha$$:

$$FIRST(\alpha) = \left \{ b \in \Sigma :  \alpha  \stackrel{*}{\Longrightarrow}  b \beta \right \}$$

Podemos reformular ahora nuestra afirmación anterior en estos términos:
Si $$A \rightarrow \gamma_1 \mid \ldots \mid \gamma_n$$ y los conjuntos
$$FIRST(\gamma_i)$$ son disjuntos podemos construir el procedimiento para
la variable $$A$$ siguiendo este seudocódigo:

    function parseA() {
      if (lookahead in FIRST(gamma_1)) { imitar gamma_1 }
      else if (lookahead in FIRST(gamma_2)) { imitar gamma_2 }
      ...
      else (lookahead in FIRST(gamma_n)) { imitar gamma_n }
    }

Donde si $$\gamma_j$$ es $$X_1 \ldots X_k$$ el código `gamma_j` consiste en
una secuencia $$i = 1 \ldots k$$ de llamadas de uno de estos dos tipos:

-   Llamar a la subrutina `parseX_i()` si $$X_i$$ es una variable sintáctica

-   Hacer una llamada al analizador léxico  avanzando sobre el token `lex()` si $$X_i$$ es el terminal actual

Si aplicamos esta teoría a la variable sintáctica `expression` cuyas reglas eran:

```yacc
expression: STRING
          | NUMBER
          | WORD apply
```

tenemos tres partes derechas $$\gamma_1$$ = `STRING`,  $$\gamma_2$$ = `NUMBER` y $$\gamma_3$$ = `WORD apply`. Si computamos los $$FIRST(\gamma_i)$$ obtenemos:

$$FIRST(STRING) = \left \{ STRING \right \}$$

$$FIRST(NUMBER) = \left \{ NUMBER \right \}$$

$$FIRST(WORD \! apply) = \left \{ WORD \right \}$$

nos produce este código:

```js
function parseExpression() {
  if (lookahead.type == "STRING") { // Imitar STRING 
    lex(); // Saltamos el token STRING
    return expr;
  } else if (lookahead.type == "NUMBER") { // Imitar NUMBER
     lex();  // Saltemos el token NUMBER
    return expr;
  } else if (lookahead.type == "WORD") { // Imitar WORD Apply
    lex(); // Consumimos  WORD
    return parseApply(expr); // ... y llamamos a parseApply
  } else {
    throw new SyntaxError(`Unexpected syntax line ${lineno}: ${program.slice(0,10)}`);
  }
}
```

Aplicar el algoritmo PDR a las dos reglas de `apply` requiere añadir algunas extensiones al método. 

Recordemos las reglas de `apply`:

```yacc
apply: /* vacio */
     | '(' (expression ',')* expression? ')' apply
```

En primer lugar queda claro que si el `lookahead`es un `'('`  la regla que se aplica
es la segunda.

Mas difícil es determinar que tokens pueden aparecer cuando se aplica la primera regla.

Para poder responder a esta pregunta consideremos una derivación en la que intervenga la regla `apply: /* vacio */`

Si hacemos una derivación a derechas en la que esta es la última regla que se aplica, tendría que ocurrir algo como esto:

$$ expression \stackrel{*}{\Longrightarrow} \beta \, apply \, a_1\, a_2\, \ldots \, a_n \Rightarrow \beta \, a_1 \ldots \, a_n $$

Se sigue de la fórmula que cuando se aplica la regla `apply: /* vacio */`
el token $$a_1$$ es un token que puede aparecer en alguna derivación 
**inmediatamente a continuación de `apply`**. 

Esta derivación:

$$ expression \Rightarrow WORD \, apply \stackrel{*}{\Longrightarrow} WORD \, ( \,expression \, WORD \, apply \, )$$

muestra que uno de esos tokens es `')`. También si nos fijamos en la primera sustitución 

$$ expression \Rightarrow WORD \, apply $$

vemos que `apply ` aparece al final de la regla. 

Así pues, puede ocurrir que cuando se aplique la regla el token sea el final de la entrada.

Asumiremos que el analizador léxico retorna un `null` cuando encuentra el final de la entrada. 

Puesto que la segunda regla tiene un `*` indicando la repetición 0 o mas veces de la expresión entre paréntesis:

```
apply: '(' (expression ',')* expression? ')' apply
```
necesitaremos un bucle para ir procesando la expresión interior. El bucle se termina cuando vemos el paréntesis de cierre o bien si se produce el final de la entrada.

Entonces el código queda como sigue:

```js
function parseApply() {
  if (!lookahead) return;      // token "final de la entrada" apply: /* vacio */
  if (lookahead.type === "RP") // apply: /* vacio */
    return;
  if (lookahead.type !== "LP") throw new SyntaxError(`Error`);
  lex();                // apply: '(' (expression ',')* expression? ')' apply
  while (lookahead && lookahead.type !== "RP") {
    parseExpression();
    if (lookahead && lookahead.type == "COMMA") lex(); 
    else if (!lookahead || lookahead.type !== "RP") 
      throw new SyntaxError(`Error`);
  }
  if (!lookahead) throw new SyntaxError(`Error`);
  lex();
  if (!lookahead) return; 
  return parseApply();
}
```

