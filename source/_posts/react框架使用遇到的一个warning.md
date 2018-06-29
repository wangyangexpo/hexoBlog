---
title: react框架使用遇到的一个warning
date: 2018-06-29 15:04:19
tags:
---
最近在使用react + antd做前端开发的时候，偶然间发现控制台的一个warning报错:
<font color='red'>Can't call setState(or forceUpdate) on an unmount component. This is a no-op, but it indicates a memory leak in your application. To fix, cancel all subscriptions and asynchronous tasks in the componentWillUnmount method.
</font>
一开始以为是组件注册了监听事件，组件卸载以后没有移除监听导致的，后来看了代码排查了这个因素（虽然之前确实没有移除监听事件，导致了内存泄露的问题），显然这里不是。
 <!-- more -->
而且这个warning每次只有第一次才能复现，（react的warning只有第一次出现的时候会在控制台报错提醒）。导致找了半天复现的方法。
网上查到的原因：
关于react中切换路由时报以上错误，实际的原因是因为在组件挂载（mounted）之后进行了异步操作，比如ajax请求或者设置了定时器等，而你在callback中进行了setState操作。当你切换路由时，组件已经被卸载（unmounted）了，此时异步操作中callback还在执行，因此setState没有得到值。
然后我仔细翻看了下每个组件，似乎都存在这个问题。不光是我写过的组件，看了同组的其他同事的代码，也都是这么处理的。首先这个现象很常见。在componentDidMount里发送异步请求，等待请求返回的时候setState，这个是最正常的写法了吧。但是这种做法没有考虑到，如果这个异步请求耗时较长，在请求回来之前，用户点击了回退，或者切换了其他路由，那么当前组件卸载之后，此时，异步请求回来之后执行的setState必然会出现上面的警告。
解决办法：
1.将所有需要改变状态（setState）的异步请求放在最外层的一个不会被卸载的组件上例如App组件进行，通过props传递给子组件完成渲染。（不是很可行）
2.结合react-redux，将所有可能改变状态的数据，放在store里，通过redux的数据管理来完成渲染。（可行，但是局限也很大，毕竟所有的数据都通过redux管理，还是比较麻烦的）
3.在组件内部定义一个isUnmount的变量，在异步请求返回之后的setState操作外面包一层判断 if（!isUnmount）{} 然后执行setState操作，在组件的生命周期componentWillUnmount里将isUnmout设为true。(比较推荐)