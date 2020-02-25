const { inspect } = require('util');
const async = require('async');

function worker(task, callback) {
  console.log('Inside worker: '+inspect(task))
  setTimeout(callback, task.ms);
}
const concurrency = 2;
const start = new Date;
const queue = async.queue(worker, concurrency);
queue.drain = function() {
  console.log('Completed in ' + (new Date - start) + 'ms');
};

queue.error(function(err, task) {
    console.error('task experienced an error');
});

queue.push([
  {ms: 100, cb: () => console.log(100) }, 
  {ms: 200, cb: () => console.log(200)},
 // {ms: 300, cb: () => console.log(300)}, 
], (err) => console.log(`finished processing ${(arguments)}`) );
