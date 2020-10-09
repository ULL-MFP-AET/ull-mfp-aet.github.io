const async = require('async');
const fs = require('fs');
process.chdir('recipes');  // change the working directory

const concatenation = '';

const dirContents = fs.readdirSync('.');

async.filter(dirContents, isFilename, function(filenames) {
  async.forEachSeries(filenames, readAndConcat, onComplete);
});

function isFilename(filename, callback) {
  fs.stat(filename, function(err, stats) {
    if (err) throw err;
    callback(stats.isFile());
  });
}

function readAndConcat(filename, callback) {
  fs.readFile(filename, 'utf8', function(err, fileContents) {
    if (err) return callback(err);
    concatenation += fileContents;
    console.log(`Inside readAndConcat ${concatenation}`)
    callback();
  });
}

function onComplete(err) {
  if (err) throw err;
  console.log(concatenation);
}
