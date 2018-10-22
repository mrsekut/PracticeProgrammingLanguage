# Minium Template for TypeScript Project

## compile

`$ npm run tsc`

## run in the background

`$ node build/index.js`

## npm update

`$ npm update`

## how to make this project

1. npm init

`$ npm init`

2. tsc init

`$ tsc --init`

3. edit package.json

```
// package.json
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
// tsconfig.json
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
// index.ts
const message: string = 'Hello! TypeScript!';
console.log(message);
```

6. run

`$ node build/index.js`
