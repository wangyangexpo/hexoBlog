---
title: vue源码分析（一）
date: 2021-02-05 16:34:52
tags:
---
# Vue源码阅读（一）

#### Flow
1. Facebook出品
1. JavaScript静态类型检查工具（辅助）
1. Git地址: [https://github.com/facebook/flow](https://github.com/facebook/flow)
1. 官网: [https://flow.org/](https://flow.org/)
1. VScode插件: Flow Language Support
#### 源码目录
主要内容
#### 构建方式

1. 类似于webpack的打包构建工具，更轻量高效
1. rollup: [https://github.com/rollup/rollup](https://github.com/rollup/rollup)
#### 编译入口
src/platforms/web/*<br />runtime-only 和 runtime-with-compiler
