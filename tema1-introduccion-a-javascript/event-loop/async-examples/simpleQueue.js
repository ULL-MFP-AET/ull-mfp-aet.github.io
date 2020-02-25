var async = require('async');

function worker(data, callback) {
  console.log(data);
  callback();
}
var concurrency = 2;
var queue = async.queue(worker, concurrency);
queue.push(1);
queue.push(2);
queue.push(3);
