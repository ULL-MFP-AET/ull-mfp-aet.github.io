#!/usr/bin/env node
'use strict';
const fs = require("fs");
const program = require('commander');

program
    .option('-f, --file <value>', 'set directories to watch', file, [])
    .option('-o, --output <salida>', 'output')

program.parse(process.argv);

function file(value, previous){
    return previous.concat([value]);
}

//Pregunta 2

let concatenateString = [];
let i = 0;

program.file.forEach((element,index) => {   
    fs.readFile(element.toString(), (err, data) => {
        if (err) throw err
        concatenateString[index] = data; 
        ++i;         
        if(i == program.file.length)
            fs.writeFile(program.output, concatenateString, function (err) {
                if (err) throw err;
                console.log('Saved!');
            });
    });
});

