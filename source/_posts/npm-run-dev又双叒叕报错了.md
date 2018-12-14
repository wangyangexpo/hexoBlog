---
title: npm run dev又双叒叕报错了
date: 2018-12-12 15:48:01
tags:
---

每次git clone 下来项目然后npm install之后，遇到各种报错。

这次是这个：

```js
...
...
...
ERROR in ./src/App.vue
vue-loader was used without the corresponding plugin. Make sure to include VueLoaderPlugin in your webpack config.
```
大概率是哪个npm包的版本不对。然后一查，果然，vue-loader用的 `latest`。

在当时开发人的场景下，版本号latest是可行的。但是等后面的人接手以后，latest可能就不是开发时候的版本号了，所以建议package.json文件里面的npm包名，不要使用latest，而是精确指定到某个大版本，比如`^14.2.2`。这样不管以后如何升级，都能保证，npm install 之后项目能跑起来。