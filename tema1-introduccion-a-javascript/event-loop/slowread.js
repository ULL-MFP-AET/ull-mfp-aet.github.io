const fs = require('fs')

const ir = (min, max) =>  Math.round((Math.random() * (max - min) + min))

console.time("reading")
setTimeout(
  () => fs.readFile("estas", 
                    {encoding: "utf8"}, 
                    (err, data) => { 
                      console.timeEnd("reading")
                      console.log(data);
                    } ),
  ir(500,2000)
)
