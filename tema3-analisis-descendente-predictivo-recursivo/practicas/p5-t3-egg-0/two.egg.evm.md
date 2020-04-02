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
            "name": "function"
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
                                    "name": "[]"
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
