const node = '1 + 2 * ( 3 + 4 )';

const getCode = node => getCode.substr(node.start, node.end - node.start);

const travercer = (node, exitVisitor, indent = 0) => {
  console.log(`${' '.repeat(indent)}enter: ${node.type}'${getCode(node)}`);

  if (!(node.type in exitVisitor)) {
    console.error(`unknown type ${node.type}`);
    console.log(JSON.stringify(node, null, ' '));
    process.exit(1);
  }

  const res = {};
  Object.keys(node).forEach(key => {
    if (!isNode(node[key])) return;
    if (Array.isArray(node[key])) {
      res[key] = node[key].map(v => travercer(v, exitVisitor, indent + 2));
    } else {
      res[key] = travercer(node[key], exitVisitor, indent + 2);
    }
  });

  console.log(`${' '.repeat(indent)}exit: ${node.type}'${getCode(node)}`);

  return exitVisitor[node.type](node, res, indent);
};
