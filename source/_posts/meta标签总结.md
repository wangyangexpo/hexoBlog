---
title: meta标签总结
date: 2017-08-04 16:57:07
tags:
---

关键字，搜所引擎 SEO
`<meta http-equiv="keywords" content="关键字1,关键字2,...">`

页面描述
`<meta http-equiv="description" content="网页描述">`

content的取值为webkit,ie-comp,ie-stand之一，区分大小写，分别代表用webkit内核，IE兼容内核，IE标准内核。
`<meta name="renderer" content="webkit|ie-comp|ie-stand">`

若页面需默认用极速核，增加标签：
`<meta name="renderer" content="webkit">`
<!--more-->

若页面需默认用ie兼容内核，增加标签：
`<meta name="renderer" content="ie-comp">`

若页面需默认用ie标准内核，增加标签：
`<meta name="renderer" content="ie-stand">`

如果安装了GCF，则使用GCF来渲染页面，如果没有安装GCF，则使用最高版本的IE内核进行渲染。X-UA-Compatible：这是个是IE8的专用标记,用来指定IE8浏览器去模拟某个特定版本的IE浏览器的渲染方式(比如人见人烦的IE6)，以此来解决部分兼容问题。
`<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" >`

强制页面在当前窗口以独立页面显示。 
`<meta http-equiv="Window-target" content="_top">`

自动刷新，并指向新的页面
`<meta http-equiv="Refresh" content="2；URL=http://">`

禁止浏览器缓存是用于设定禁止浏览器从本地机的缓存中调阅页面内容，设定后一旦离开网页就无法从Cache中再调出用法：
`<meta http-equiv="pragram" content="no-cache">`

清除缓存（再访问这个网站要重新下载！）
`<meta http-equiv="cache-control" content="no-cache, must-revalidate">`

设定网页的到期时间
`<meta http-equiv="expires" content="0">`

手机端
`<meta name="format-detection" content="telphone=no, email=no"/>`

忽略页面中的数字识别为电话，忽略email识别
`<meta name="apple-mobile-web-app-status-bar-style" content="black"/>`

设置苹果工具栏颜色不让百度转码
`<meta http-equiv="Cache-Control" content="no-siteapp" />`

不缓存
`<meta http-equiv="cache-control" content="no-cache" />`

初始化设备
`<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, `minimal-ui" />`

网站开启对iphone私有 web app 程序的支持
`<meta content="yes" name="apple-mobile-web-app-capable" />`

 改变顶部状态条的颜色  iphone私有的属性
`<meta content="black" name="apple-mobile-web-app-status-bar-style" />`