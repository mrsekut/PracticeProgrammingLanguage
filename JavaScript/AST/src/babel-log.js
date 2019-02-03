const babylon = require('babylon');
const log = require('babel-log');

const ast = babylon.parse('1 + 2 * ( 3 + 4 )');
log(ast);
