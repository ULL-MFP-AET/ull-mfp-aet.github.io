## Ejemplo de Código EVM (Egg Virtual Machine)

The code below contains the AST for this input program:

```
[~/.../crguezl-egg(master)]$ cat examples/two.egg
```
```lisp
do(
  define(sum,  # function
    fun(nums, other,
      do(
         print(other),
         define(i, 0),
         define(sum, 0),
         while(<(i, length(nums)),
           do(define(sum, +(sum, element(nums, i))),
              define(i, +(i, 1))
           )
         ),
         sum
      )
   )
 ),
 print(sum(array(1, 2, 3), 4))
)
```

Si ejecutamos `bin/eggc.js  examples/two.egg` produce como salida un fichero con el mismo nombre y extensión `.evm` (por Egg Virtual Machine) que no es otra cosa que el AST generado por el parser guardado como un objeto JSON.

```
[~/.../crguezl-egg(master)]$ bin/eggc.js examples/two.egg
[~/.../crguezl-egg(master)]$ ls -ltr examples/two.egg.evm
-rw-r--r--  1 casiano  staff  7466  2 abr 11:03 examples/two.egg.evm
```

## The .evm 

Here is the AST:

```json
{
  "type": "apply",
  "operator": {
    "type": "word",
    "name": "do"
  },
  "args": [
    {
      "type": "apply",
      "operator": {
        "type": "word",
        "name": "define"
      },
      "args": [
        {
          "type": "word",
          "name": "sum"
        },
        {
          "type": "apply",
          "operator": {
            "type": "word",
            "name": "fun"
          },
          "args": [
            {
              "type": "word",
              "name": "nums"
            },
            {
              "type": "word",
              "name": "other"
            },
            {
              "type": "apply",
              "operator": {
                "type": "word",
                "name": "do"
              },
              "args": [
                {
                  "type": "apply",
                  "operator": {
                    "type": "word",
                    "name": "print"
                  },
                  "args": [
                    {
                      "type": "word",
                      "name": "other"
                    }
                  ]
                },
                {
                  "type": "apply",
                  "operator": {
                    "type": "word",
                    "name": "define"
                  },
                  "args": [
                    {
                      "type": "word",
                      "name": "i"
                    },
                    {
                      "type": "value",
                      "value": 0
                    }
                  ]
                },
                {
                  "type": "apply",
                  "operator": {
                    "type": "word",
                    "name": "define"
                  },
                  "args": [
                    {
                      "type": "word",
                      "name": "sum"
                    },
                    {
                      "type": "value",
                      "value": 0
                    }
                  ]
                },
                {
                  "type": "apply",
                  "operator": {
                    "type": "word",
                    "name": "while"
                  },
                  "args": [
                    {
                      "type": "apply",
                      "operator": {
                        "type": "word",
                        "name": "<"
                      },
                      "args": [
                        {
                          "type": "word",
                          "name": "i"
                        },
                        {
                          "type": "apply",
                          "operator": {
                            "type": "word",
                            "name": "length"
                          },
                          "args": [
                            {
                              "type": "word",
                              "name": "nums"
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "type": "apply",
                      "operator": {
                        "type": "word",
                        "name": "do"
                      },
                      "args": [
                        {
                          "type": "apply",
                          "operator": {
                            "type": "word",
                            "name": "define"
                          },
                          "args": [
                            {
                              "type": "word",
                              "name": "sum"
                            },
                            {
                              "type": "apply",
                              "operator": {
                                "type": "word",
                                "name": "+"
                              },
                              "args": [
                                {
                                  "type": "word",
                                  "name": "sum"
                                },
                                {
                                  "type": "apply",
                                  "operator": {
                                    "type": "word",
                                    "name": "element"
                                  },
                                  "args": [
                                    {
                                      "type": "word",
                                      "name": "nums"
                                    },
                                    {
                                      "type": "word",
                                      "name": "i"
                                    }
                                  ]
                                }
                              ]
                            }
                          ]
                        },
                        {
                          "type": "apply",
                          "operator": {
                            "type": "word",
                            "name": "define"
                          },
                          "args": [
                            {
                              "type": "word",
                              "name": "i"
                            },
                            {
                              "type": "apply",
                              "operator": {
                                "type": "word",
                                "name": "+"
                              },
                              "args": [
                                {
                                  "type": "word",
                                  "name": "i"
                                },
                                {
                                  "type": "value",
                                  "value": 1
                                }
                              ]
                            }
                          ]
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "word",
                  "name": "sum"
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "type": "apply",
      "operator": {
        "type": "word",
        "name": "print"
      },
      "args": [
        {
          "type": "apply",
          "operator": {
            "type": "word",
            "name": "sum"
          },
          "args": [
            {
              "type": "apply",
              "operator": {
                "type": "word",
                "name": "array"
              },
              "args": [
                {
                  "type": "value",
                  "value": 1
                },
                {
                  "type": "value",
                  "value": 2
                },
                {
                  "type": "value",
                  "value": 3
                }
              ]
            },
            {
              "type": "value",
              "value": 4
            }
          ]
        }
      ]
    }
  ]
}
```
