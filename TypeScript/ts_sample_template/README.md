# TypeScript プロジェクトのための最小のテンプレート

## compile

`$ npm run tsc`

## exec

`$ node build/index.js`

## how to make this project

1. npm install

`$ npm init`

2. tsc init

`$ tsc --init`

3. edit package.json

```
{
  "name": "ts_sample_template",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "tsc": "tsc -w",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC"
}
```

4. edit tsconfig.json

```
{
  "compilerOptions": {
    "module": "commonjs",
    "target": "es2017",
    "sourceMap": true,
    "types": ["node"],
    "lib": ["es6", "dom"],
    "outDir": "build",
    "rootDir": "src",
    "baseUrl": "."
  }
}
```

5. make index.ts

```
const message: string = 'Hello! TypeScript!';
console.log(message);
```

6. exec

`$ node build/index.js`
