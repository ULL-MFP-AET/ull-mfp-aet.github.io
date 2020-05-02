# Introducción a los PEGs

In computer science, a parsing expression grammar, or PEG, is a type of
analytic formal grammar, i.e. it describes a formal language in terms
of a set of rules for recognizing strings in the language.

The formalism was introduced by 
[Bryan Ford in 2004 ](https://pdos.csail.mit.edu/papers/parsing:popl04.pdf)
and is closely related to the family of top-down parsing languages introduced in the early 1970s. 

Syntactically, PEGs also look similar to
context-free grammars (CFGs), but they have a different interpretation: 

**The choice operator selects the first match in PEG, while it is ambiguous in CFG**. 

This is closer to how string recognition tends to be done in practice, e.g. by a recursive descent parser.

Unlike CFGs, PEGs cannot be ambiguous; 
**if a string parses, it has exactly one valid parse tree**. 

It is conjectured that there exist context-free languages that cannot be parsed by a PEG, but this is not yet proven. 

## Syntax

Formally, a **parsing expression grammar** consists of:

1. A finite set $$N$$ of nonterminal symbols.
2. A finite set $$\Sigma$$ of terminal symbols that is disjoint from $$N$$.
3. A finite set $$P$$ of parsing rules.
4. An expression $$e_S$$ termed the starting expression.


Each parsing rule in $$P$$ 
has the form $$A \leftarrow e$$, 
where $$A$$ is a nonterminal symbol and $$e$$ is a parsing expression. 

A **parsing expression** is a hierarchical expression similar to a regular expression, which is constructed in the following fashion:

* An atomic parsing expression consists of:

1. any terminal symbol,
2. any nonterminal symbol, or
3. the empty string $$\epsilon$$.

Given any existing parsing expressions $$e$$, $$e_1$$, and $$e_2$$, 
a new parsing expression can be constructed using the following operators:

4. Sequence: $$e1 e2$$
5. Ordered choice: $$e1 / e2$$
6. Zero-or-more: $$e*$$
7. One-or-more: $$e+$$
8. Optional: $$e?$$
9. And-predicate: $$\&e$$
10. Not-predicate: $$!e$$

## Semantics

The fundamental difference between context-free grammars and parsing
expression grammars is that the PEG's choice operator is **ordered**:

* If the first alternative succeeds, the second alternative is ignored. 
* Thus ordered choice is not commutative, unlike unordered choice as in context-free grammars.
* The consequence is that if a CFG is transliterated directly to a PEG, any ambiguity in the former is resolved by deterministically picking one parse tree from the possible parses. 
* By carefully choosing the order in which the grammar alternatives are specified, a programmer has a great deal of control over which parse tree is selected.
* PEGs can look ahead into the input string without actually consuming it
* The and-predicate expression $$\&e$$ invokes the sub-expression $$e$$, and then succeeds if $$e$$ succeeds and fails if $$e$$ fails, but in either case never consumes any input.
* The not-predicate expression $$!e$$ succeeds if $$e$$ fails and fails if $$e$$ succeeds, again consuming no input in either case.

## Implementing parsers from parsing expression grammars

Any parsing expression grammar can be converted directly into a recursive descent parser. 

Due to the unlimited lookahead capability that the grammar formalism
provides, however, the resulting parser could exhibit exponential time
performance in the worst case.

It is possible to obtain better performance for any parsing expression
grammar by converting its recursive descent parser into a 
[packrat parser](http://bford.info/pub/lang/packrat-icfp02/),
which always runs in linear time, at the cost of substantially greater
storage space requirements. 

 A packrat parser is a form of parser similar to a recursive descent parser in construction, except that during the parsing process it memoizes the intermediate results of all invocations of the mutually recursive parsing functions, ensuring that each parsing function is only invoked at most once at a given input
position. 

Because of this memoization, a packrat parser has the ability
to parse many context-free grammars and any parsing expression grammar
(including some that do not represent context-free languages) in linear
time. 

Examples of memoized recursive descent parsers are known from at
least as early as 1993. 

Note that this analysis of the performance
of a packrat parser  _assumes that enough memory is available to hold all of the memoized results_; in practice, if there were not enough memory,
some parsing functions might have to be invoked more than once at the
same input position, and consequently the parser could take more than
linear time.

It is also possible to build LL parsers and LR parsers from parsing
expression grammars, with better worst-case performance than a recursive
descent parser, but the unlimited lookahead capability of the grammar
formalism is then lost. Therefore, not all languages that can be expressed
using parsing expression grammars can be parsed by LL or LR parsers.

## Lexical Analysis

Parsers for languages expressed as a CFG, such as LR parsers, require a
separate tokenization step to be done first, which breaks up the input
based on the location of spaces, punctuation, etc. 

The tokenization is
necessary because of the way these parsers use lookahead to parse CFGs
that meet certain requirements in linear time. 

PEGs do not require tokenization to be a separate step, and tokenization rules
can/must be written in the same way as any other grammar rule.

## Left recursion

PEGs cannot express left-recursive rules where a rule refers to itself
without moving forward in the string. 
 For example, the following left-recursive CFG rule:
```
string-of-a -> string-of-a 'a' | 'a'
```
can be rewritten in a PEG using the plus operator:
```
string-of-a <- 'a'+
```
The process of rewriting indirectly left-recursive rules is complex in some packrat parsers, especially when semantic actions are involved.

## Referencias y Documentación

* Véase [Parsing Expression Grammar](https://en.wikipedia.org/wiki/Parsing_expression_grammar) en la Wikipedia
* [PEG.js documentation](http://pegjs.org/documentation)
* [Testing PEG.js Online](https://pegjs.org/online)
* [David Majda - Easy parsing with PEG.js](https://www.youtube.com/watch?v=iPC6ArcGyL8) (The author of PEG.js)
* [Writing a PEG Parser For Fun and Profit](https://www.youtube.com/watch?v=7MuQQQWVzU4) by Guido van Rossum. North Bay Python 2019
* [The Packrat Parsing and Parsing Expression Grammars Page](http://bford.info/packrat/)
* Michael's Blog: [JavaScript Parser Generators](http://blog.mi-ernst.de/2012/05/14/javascript-parser-generators/).  The PEG.js Tutorial


