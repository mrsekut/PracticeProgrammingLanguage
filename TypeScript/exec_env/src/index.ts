// オブジェクトのコピー
const clone = (obj: any) => {
  const f = () => {};
  f.prototype = obj;
  return new f(); // () ?
};

// 関数合成
const compose = (f: any, g: any): any => {
  return function(x) {
    return f(g(x));
  };
};

// 並行移動のプリミティブ
const trans = (dx, dy) => {
  return function(coord) {
    const result = clone(coord);
    result.x += dx;
    result.y += dy;
    return result;
  };
};

// 原点中心回転のプリミティブ
const route = theta => {
  return function(coord) {
    const result = clone(coord);
    result.x = Math.cos(theta) * coord.x - Math.sin(theta) * coord.y;
    result.y = Math.sin(theta) * coord.x + Math.cos(theta) * coord.x;
    return result;
  };
};

const transByConfig = config => {
  return trans(config.ofsX, config.ofsY);
};

// 設定を元にした回転
const rotateByConfig = config => {
  return compose(
    trans(config.rotAt.x, config.rotAt.y),
    compose(
      rotate(config.theta),
      trans(-config.rotAt.x, -config.rotAt.y)
    )
  );
};

// 設定を元にした座標変換
const convertByConfig = config => {
  return compose(
    transByConfig(config),
    rotateByConfig(config)
  );
};

// 座標全てに同じ変換を適用
const config = {
  rotAt: {
    x: 0.5,
    y: 0.5
  },
  theta: Math.PI / 4,
  ofsX: -0.5,
  ofsY: -0.5
};

const unitRect = [
  { x: 0, y: 0 },
  { x: 0, y: 1 },
  { x: 1, y: 1 },
  { x: 1, y: 0 }
];

const convertedRect = unitRect.map(convertByConfig(config));

convertedRect.map(function(coord) {
  console.log(`(${coord.x.toFixed(6)}, ${coord.y.toFixed(6)})`);
});
