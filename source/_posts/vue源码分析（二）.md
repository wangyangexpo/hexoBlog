---
title: vue源码分析（二）
date: 2021-02-05 16:35:24
tags:
---
# Vue源码阅读（二）

#### 开发调试
npm run dev
#### 示例演示
变量：<br />**   vm**<br />**   vm.$options**<br />**<br />**new Vue()**<br />**<br />![1586230039996-b1993fb9-a042-41c7-9147-1d021b631bd4.png](https://intranetproxy.alipay.com/skylark/lark/0/2020/png/203416/1586505565185-0c9af2ba-4368-49a2-8836-7af9ec409594.png#align=left&display=inline&height=326&margin=%5Bobject%20Object%5D&name=1586230039996-b1993fb9-a042-41c7-9147-1d021b631bd4.png&originHeight=453&originWidth=260&size=115878&status=done&style=none&width=187)
#### 从入口开始
**import Vue from ***<br />_render() --> compileToFunction() --> baseCompile() --> parse() --> generate()<br />_update() --> __patch__() -->
#### 总结归纳
流程图<br />![无标题绘图.jpg](https://intranetproxy.alipay.com/skylark/lark/0/2020/jpeg/203416/1591006275852-7187975e-8b67-4fc8-b5e3-32130cb14fe9.jpeg#align=left&display=inline&height=2221&margin=%5Bobject%20Object%5D&name=%E6%97%A0%E6%A0%87%E9%A2%98%E7%BB%98%E5%9B%BE.jpg&originHeight=2221&originWidth=2137&size=278344&status=done&style=none&width=2137)<br />
<br />

