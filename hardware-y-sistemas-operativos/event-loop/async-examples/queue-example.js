const async = require("async");
const ir = (min, max) =>  Math.round((Math.random() * (max - min) + min))
const d = new Date();
const makeCb = (str) => (err => console.log('finished processing '+str+' '+(new Date() - d)));

const worker = (task, callback) => {
    setTimeout(
      () => {
        console.log('hello ' + task.name);
        callback();
      },ir(0,1000) // Wait a random time
    )
};

// create a queue object with concurrency 2
const q = async.queue(worker, 2);

/*
 q.drain: a function that sets a callback that is called when the last item 
          from the queue has returned from the worker.
  If the callback is omitted, q.drain() returns a promise for the next occurrence.
*/
q.drain(function() {
    console.log('worker finished and queue is empty');
});

// assign an error callback
q.error(function(err, task) {
    console.error('task experienced an error '+err);
});

// add some items to the queue
q.push({name: 'foo'}, makeCb('foo'));
// call)ack is optional
q.push({name: 'bar'}, makeCb('bar'));

// add some items to the queue (batch-wise)
q.push([{name: 'baz'},{name: 'bay'},{name: 'bax'}], makeCb('item'));

// add some items to the front of the queue
q.unshift({name: 'ear'}, makeCb('ear'));

