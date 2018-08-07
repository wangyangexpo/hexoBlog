---
title: 安卓浏览器display：flex的样式bug
date: 2018-08-07 14:35:09
tags:
---
### vue移动端单页应用，一个滚动加载的列表，样式错乱的bug

```js
<template>
  <div class="global-search-page">
    <search showSearch
      defaultFocus
      placeholder="搜索"></search>

    ...
    ...
    ...

    <my-load-more :allLoaded="allLoaded"
      :hideTip="showFastInfo"
      :resultInfo="resultInfo"
      :isLoading="isLoading"
      <CardList v-for="(item,index) in resultInfo"
        :type="item.type"
        :key="setKey(item)"
        :source="item"></CardList>
    </my-load-more>
  </div>
</template>

<style>
  .global-search-page {
    background: #fff;
    display: flex;
    flex-direction: coloum;
  }
  ...
</style>
```
布局是`search组件`占一行顶部，`my-load-more组件`根据内容`CardList`高度撑开。

<!-- more -->

刚进入页面的时候ajax请求后台列表数据，渲染`CardList`，撑开组件。

`ios`和`chrome`调试的时候正常展示，`钉钉客户端安卓`打开，<font color="red">CardList会侵入到search组件中间，导致重叠</font>。

一开始以为是安卓的软键盘导致`body被压缩`，造成的。使用js控制body的height属性，不管有没有CardList数据，都固定设置
容器高度为屏幕高度，但是一旦CardList数据溢出容器，还是会出现重叠，后来大概意识到是`flex布局`的问题，果断去掉了`display:flex;flex-direction: coloum;`改用常规布局，问题迎刃而解。
