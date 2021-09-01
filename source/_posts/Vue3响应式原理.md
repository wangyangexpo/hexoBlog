---
title: vue3 响应式原理
date: 2021-09-01 14:57:50
tags:
---

# reactive

定义响应式的函数，和vue2的名称一致，但是实现原理从 Object.defineProperty 变成了 Proxy。

Proxy 使用对象代理的方式，比 Object.defineProperty 有两个明显好处。

1. Proxy可以动态添加属性，并且添加的属性支持响应式，比如 obj = {}, obj.name = 'jack'; vue2的响应式只能在原有属性的基础上，添加新属性需要使用 Vue.set(obj, 'name', 'jack') --- ugly code!

2. Proxy使用的是懒加载的方式，只有在用到的时候才会触发getter，vue2的话在初始化的时候就必须定义好响应式的数据结构，性能没有那么好。