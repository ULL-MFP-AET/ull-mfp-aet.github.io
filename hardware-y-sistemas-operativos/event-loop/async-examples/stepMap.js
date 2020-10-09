var Step = require('step');

function stepMap(arr, iterator, callback) {
  Step(
    function() {
      var group = this.group();
      for (var i = 0; i < arr.length; i++) {
        iterator(arr[i], group());
      }
    },
    callback
  );
}
