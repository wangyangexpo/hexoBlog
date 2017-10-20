---
title: node md5加密
date: 2017-10-10 16:27:08
tags:
---
node 模块中需要用到md5，sha1加密。
大概步骤：
1.data = {}
2.jsonstr = JSON.stringify(data);
3.md5 = crypto.createHash('md5').update(jsonstr, 'utf8').digest('hex');
4.md5Key = (md5 + secret_key).toLowerCase();
5.sign = crypto.createHash('sha1').update(md5Key, 'utf8').digest('hex');

<!-- more -->

```
var request = require('request');
var crypto = require('crypto');

var apply = function(req, res) {
    var body = req.query;
    //处理 form提交数据
    //线上
    var url = 'http://sms-email-private.putao.com/base/tempalte';
    var appid = '1018043180141462528';
    var secret_key = '07E13AF890B547B59DFD76E0F674E7D8';
    //测试
    //  var url = 'http://10.1.11.31:8082/base/tempalte';
    //  var appid = '1018196122978714624';
    //  var secret_key = '07E17AF970964D9D93224DAD85483F11';
    var timestramp = Math.round(new Date().getTime() / 1000);
    var requestData = {
     "key":"chengliuling@putao.com",
     "type":"shop-join",
     "language":"zh_CN",
     "content": [
         body.name,
         body.gender == '0' ? '先生' : '女士',
         body.mobile,
         body.email,
         body.place,
         body.advice
     ]
    };
    console.log(requestData);

    var jsonstr = JSON.stringify(requestData);

    var md5 = crypto.createHash('md5').update(jsonstr, 'utf8').digest('hex');

    var md5Key = (md5 + secret_key).toLowerCase();

    var sign = crypto.createHash('sha1').update(md5Key, 'utf8').digest('hex');

    console.log("sign====" + sign);

    var headers = {
        "content-type": "application/json;charset=utf-8",
        "appid": appid,
        "sign": sign,
        "timestramp": timestramp
    };

    console.log(headers);

    request({
        url: url,
        method: "POST",
        json: true,
        headers: headers,
        body: jsonstr
    }, function(error, response, body) {

        if (!error && response.statusCode == 200) {
            // 成功
            console.log('post email success!!!');
        }else{
            // 失败
            console.log(error, response.statusCode);
        }
        res.json({code: 200});
    });
}

module.exports = apply
```