---
title: vue源码分析（三）
date: 2021-02-05 16:43:50
tags:
---
# Vue源码阅读（三）

### 响应式数据
**data****，props，computed，watch**<br />

### 响应式原理
**Object.defineProperty**** + 观察者模式**
```javascript
// 定义响应式，
function defineReactive (obj, key, val) {
  Object.defineProperty(obj, key, {
    enumerable: false,
    configurable: true,
    get: function getter () {
      console.log('get:' + key)
      return val
    },
    set: function setter (newVal) {
      console.log('set: ' + key)
      val = newVal
    }
  })
}

const data = { name: '张三 ', age: 18 }

const keys = Object.keys(data)

keys.map(key => {
  defineReactive(data, key, data[key])
})

console.log(data.name)   // get: name

data.age = 20            // set: age

```
![image.png](https://intranetproxy.alipay.com/skylark/lark/0/2020/png/203416/1591149883668-819ad7ae-c1fd-498d-a181-f5450de1f70c.png#align=left&display=inline&height=636&margin=%5Bobject%20Object%5D&name=image.png&originHeight=802&originWidth=941&size=367818&status=done&style=none&width=746)
### observe (vm.data)
![image.png](https://intranetproxy.alipay.com/skylark/lark/0/2020/png/203416/1591149388374-6493fbad-ec4f-462d-a52e-fc27b760fc57.png#align=left&display=inline&height=766&margin=%5Bobject%20Object%5D&name=image.png&originHeight=914&originWidth=890&size=302034&status=done&style=none&width=746)
### render.call(vm)
![image.png](https://intranetproxy.alipay.com/skylark/lark/0/2020/png/203416/1591149781718-45133a6d-9703-4bca-9d9b-c75a31f7761f.png#align=left&display=inline&height=136&margin=%5Bobject%20Object%5D&name=image.png&originHeight=150&originWidth=823&size=118258&status=done&style=none&width=746)
### vm.flag = 1 ----> vm.flag.set(1)


### 案例分析
```javascript
// 1
vm.flag = 1

// 2
vm.male.name = 'ted'
vm.male.age = 40

// 3
vm.male = { name: 'ted', age: 40 }
vm.male.name = 'abc'
vm.male.age = 41

vm.male = {}
vm.male.name = 'ted'
vm.male.age = 40

// 4
function onClick (vm) {
  vm.male.name = 'xxx'
  vm.male.age = 50
  console.log(document.getElementById('demo').innerText)
  vm.$nextTick(() => {
    console.log(document.getElementById('demo').innerText)
  })
}

```
### event-loop
![event-loop.png](https://intranetproxy.alipay.com/skylark/lark/0/2020/png/203416/1591236450381-425c9d92-1d65-4a6d-924f-90a2b85556d4.png#align=left&display=inline&height=905&margin=%5Bobject%20Object%5D&name=event-loop.png&originHeight=529&originWidth=436&size=82357&status=done&style=none&width=746)<br />

### ISSUE（#3371）
![image.png](https://intranetproxy.alipay.com/skylark/lark/0/2020/png/203416/1591238918464-b71b86b7-0f29-44cf-bc4b-628efeb9fe48.png#align=left&display=inline&height=406&margin=%5Bobject%20Object%5D&name=image.png&originHeight=440&originWidth=809&size=220767&status=done&style=none&width=746)
