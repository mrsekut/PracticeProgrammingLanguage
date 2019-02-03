const babylon = require('babylon');
const ast = babylon.parse('1 + 2 * ( 3 + 4 )');

const isNode = obj => {
  if (typeof obj !== 'object') return false;
  if (Array.isArray(obj)) return obj.find(v => isNode(v)) !== undefined;
  return obj && 'constructor' in obj && obj.constructor.name === 'Node';
};

const replacer = (key, value) => {
  if (!key || key === 'type' || isNode(value)) return value;
  return undefined;
};

console.log(JSON.stringify(ast, replacer, ' '));
