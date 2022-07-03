---
title: react/type升级导致的vscode提示报错
date: 2022-07-03 11:44:07
tags:
---

umi项目如果，出现很多 children 相关的类型问题的，先尝试在 package 里显示依赖 @types/react: ^17.0.0，然后 git add . && git clean -dfx && tnpm i 重装依赖试试；如果问题仍然存在，在 package 的 resolutions 里锁定一下 @types/react: ^17.0.0。

原因：部分 @types/react: * 依赖安装了 react 18 的 types，react 18 类型中移除了默认的 children，需用 withChildren。