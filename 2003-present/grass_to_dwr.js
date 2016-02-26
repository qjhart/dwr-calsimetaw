var fs=require('fs');
var mimimist=require('minimist');



fs.readFile('foo.csv', 'utf8', function(err, contents) {
    console.log(contents);
});

console.log('after calling readFile');
