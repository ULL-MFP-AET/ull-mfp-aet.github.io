# Árbol de Análisis Abstracto {#section:eyapaat}

Un Árbol de Análisis Abstracto (denotado *AAA*, en inglés *AST*) porta la misma información que el árbol de análisis sintáctico concreto pero de forma mas condensada, eliminándose
terminales y producciones que no aportan información.

## Alfabeto con Aridad o Alfabeto Árbol

Un *alfabeto con función de aridad* es un par $$(\Sigma, \rho)$$ donde $$\Sigma$$ es un conjunto finito y
$$\rho$$ es una función $$\rho: \Sigma \rightarrow ℕ_0$$,
denominada . Denotamos por
$$\Sigma_k = \{ a \in \Sigma :\ \rho(a) = k \}$$.

## Lenguaje de los Arboles
Definimos el $$B(\Sigma)$$ sobre $$\Sigma$$ inductivamente:

-   Todos los elementos de aridad 0 están en $$B(\Sigma)$$:
    $$a \in  \Sigma_0$$ implica $$a \in B(\Sigma)$$

-   Si $$b_1, \ldots , b_k \in B(\Sigma)$$ y $$f \in \Sigma_k$$ es un
    elemento $$k$$-ario, entonces $$f(b_1, \ldots , b_k) \in B(\Sigma)$$


Los elementos de $$B(\Sigma)$$ se llaman *árboles* o *términos*.

## Ejemplo

Sea $$\Sigma = \{A, CONS, NIL \}$$ con
$$\rho(A) = \rho(NIL) = 0,\ \rho(CONS) = 2$$. Entonces

$$B(\Sigma) = \{ A, NIL, CONS(A,NIL), CONS(NIL, A), CONS(A, A), CONS(NIL,NIL), \ldots \}$$

Observe que los elementos en $$B(\Sigma)$$ no necesariamente son árboles
*correctos*

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


