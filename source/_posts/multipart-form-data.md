---
title: multipart/form-data
date: 2018-07-31 16:26:45
tags:
---
### 手动设置`Content-Type: multipart/form-data`报错

```js
changeUserAvatar(authParam, file) {
    let formData = new FormData();
    //file is actually new FileReader.readAsDataURL(myId.files[0]);
    formData.append('profile_image', file);
    
    fetch(BASE_URL + 'profile-image', {
      method: 'POST',
      headers: {
  'Content-Type': 'multipart/form-data',
  'Authorization': authParam
      },
      body: formData
    }).then((response) => {
      return response.json();
    }).then((response) => {
      debugger;
    }).catch((error) => {
      console.error(error);
    });
  }
```

### 错误信息
<font color='red'>Error: profile_image can not be blank</font>

<!-- more -->

### 原因
手动设置`Content-type = multipart/form-data`，意味着缺少了`boundary`参数，这里不需要手动设置，`Fetch`会根据`FormData`的内容自动生成`Content-type`，像下面这样：

```js
Content-Type: multipart/form-data;boundary=----WebKitFormBoundaryyrV7KO0BoCBuDbTL
```

### 延伸
如果你想发送下面的数据到服务器：

```js
name = John
age = 12
```
1. 使用`application/x-www-form-urlencoded`方式，会这样发送：

```js
name=John&age=12

```
如你所见，服务器知道用`&`来分割参数，如果参数值里面有&字符，则需要经过encode来编码一下参数再传递。

2. 使用`multipart/form-data`方式，服务器如何知道用什么字符来分割参数呢。

使用`boundary`，所以发送的格式像下面这样：

```js
Content-Type: multipart/form-data; boundary=XXX

--XXX
Content-Disposition: form-data; name="name"

John
--XXX
Content-Disposition: form-data; name="age"

12
--XXX--
```

