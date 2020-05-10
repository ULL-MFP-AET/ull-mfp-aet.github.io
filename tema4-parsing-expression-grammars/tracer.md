# The `tracer` option

## Example of the `tracer` option

```js
[~/.../pegjs/examples(master)]$ cat tracer.js
"use strict";
const util = require('util');
const ins = x => util.inspect(x, { depth: null})
const peg = require( "pegjs" );
const sinon = require( "sinon" );

const grammar = `
  start = ab+
  ab = 'a' / 'b'
`;
const parser = peg.generate( grammar, { trace: true } );
const tracer = { trace: sinon.spy() };

parser.parse( "abba", { tracer: tracer } );
const c = tracer.trace.callCount;
console.log(`tracer called ${c} times`);
for(let i=0; i<c; i++) {
  console.log(ins(tracer.trace.getCall(i).args));
}
```

## Execution

```
[~/.../pegjs/examples(master)]$ node tracer.js
tracer called 12 times
[
  {
    type: 'rule.enter',
    rule: 'start',
    location: {
      start: { offset: 0, line: 1, column: 1 },
      end: { offset: 0, line: 1, column: 1 }
    }
  }
]
[
  {
    type: 'rule.enter',
    rule: 'ab',
    location: {
      start: { offset: 0, line: 1, column: 1 },
      end: { offset: 0, line: 1, column: 1 }
    }
  }
]
[
  {
    type: 'rule.match',
    rule: 'ab',
    result: 'a',
    location: {
      start: { offset: 0, line: 1, column: 1 },
      end: { offset: 1, line: 1, column: 2 }
    }
  }
]
[
  {
    type: 'rule.enter',
    rule: 'ab',
    location: {
      start: { offset: 1, line: 1, column: 2 },
      end: { offset: 1, line: 1, column: 2 }
    }
  }
]
[
  {
    type: 'rule.match',
    rule: 'ab',
    result: 'b',
    location: {
      start: { offset: 1, line: 1, column: 2 },
      end: { offset: 2, line: 1, column: 3 }
    }
  }
]
[
  {
    type: 'rule.enter',
    rule: 'ab',
    location: {
      start: { offset: 2, line: 1, column: 3 },
      end: { offset: 2, line: 1, column: 3 }
    }
  }
]
[
  {
    type: 'rule.match',
    rule: 'ab',
    result: 'b',
    location: {
      start: { offset: 2, line: 1, column: 3 },
      end: { offset: 3, line: 1, column: 4 }
    }
  }
]
[
  {
    type: 'rule.enter',
    rule: 'ab',
    location: {
      start: { offset: 3, line: 1, column: 4 },
      end: { offset: 3, line: 1, column: 4 }
    }
  }
]
[
  {
    type: 'rule.match',
    rule: 'ab',
    result: 'a',
    location: {
      start: { offset: 3, line: 1, column: 4 },
      end: { offset: 4, line: 1, column: 5 }
    }
  }
]
[
  {
    type: 'rule.enter',
    rule: 'ab',
    location: {
      start: { offset: 4, line: 1, column: 5 },
      end: { offset: 4, line: 1, column: 5 }
    }
  }
]
[
  {
    type: 'rule.fail',
    rule: 'ab',
    location: {
      start: { offset: 4, line: 1, column: 5 },
      end: { offset: 4, line: 1, column: 5 }
    }
  }
]
[
  {
    type: 'rule.match',
    rule: 'start',
    result: [ 'a', 'b', 'b', 'a' ],
    location: {
      start: { offset: 0, line: 1, column: 1 },
      end: { offset: 4, line: 1, column: 5 }
    }
  }
]
```