const babylon = require('babylon');

const ast = babylon.parse('1 + 2 * ( 3 + 4 )');
console.log(ast);
