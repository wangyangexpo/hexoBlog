---
title: 微信jssdk配置使用
date: 2017-09-01 17:46:54
tags:
---
### 微信jssdk分享功能使用
注意点：
1.需要关注公众号之后再测试，否则不能分享
2.分享缩略图imgUrl需要使用绝对路径，不能是相对路径

具体使用代码如下：
<!-- more -->

```
$(function() {
    // 回到顶部
    $('.go-to-top').on('click', function() {
        $("html,body").animate({ scrollTop: 0 }, 500);
    })

    //热点区域点击
    $('[class^="hot-"]').on('click', function() {
        var id = $(this).attr('class');
        $("html,body").animate({ scrollTop: $("#" + id).offset().top }, 500);
    })

    //微信分享
    var jsApiList = ['onMenuShareTimeline', 'onMenuShareAppMessage'];
    var weixinUrl = location.href.split('#')[0];
    var title = '值得买的幼儿黑科技玩具全在这了！'; //分享出去的大标题
    var sec = '限时4折起，涵盖语数外，涉及科艺综，好玩不要不要的！'; //分享出去之后小字部分的明细标题
    var icon = "http://h5.putao.com/schoolpage/images/share_icon.jpg"; //分享出去的icon
    var shareLink = window.location.href; //分享出去的链接

    $.ajax({
        data: {
            url: weixinUrl
        },
        type: "get",
        // url: "http://dev-api-chenshan.ptdev.cn/blocks/jsdk/config", //测试／开发
        url:"http://api-chenshan.putao.com/blocks/jsdk/config",//正式
        success: function(res) {
            res = typeof res == 'string' ? JSON.parse(res) : res;
            var r = res.data;
            // console.log(res);
            wx.config({
                debug: false,
                appId: r.appId,
                timestamp: r.timestamp,
                nonceStr: r.nonceStr,
                signature: r.signature,
                jsApiList: jsApiList
            });

        }
    });

    wx.ready(function() {

		console.log('JSSDK配置成功');

        wx.onMenuShareTimeline({
            title: title, // 分享标题
            link: shareLink, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
            imgUrl: icon, // 分享图标
            success: function() {
                // 用户确认分享后执行的回调函数
            },
            cancel: function() {
                // 用户取消分享后执行的回调函数
            }
        });

        wx.onMenuShareAppMessage({
            title: title, // 分享标题
            desc: sec, // 分享描述
            link: shareLink, // 分享链接
            imgUrl: icon, // 分享图标
            success: function() {
                // 用户确认分享后执行的回调函数
            },
            cancel: function() {
                // 用户取消分享后执行的回调函数
            }
        });

    });

    wx.error(function(res){
        console.log(res);
    });
})
```