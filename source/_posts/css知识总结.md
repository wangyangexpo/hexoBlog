---
title: css知识总结
date: 2017-08-02 15:51:30
tags:
---
1.设置css样式的三种方式？
        外部样式表，引入一个外部css文件
        内部样式表，将css代码放在<head>标签内部
        内联样式，将css样式直接定义在html元素内部

2.css有哪些选择器？
        id选择器
        类选择器
        标签选择器
<!--more-->
        又可以细分为：
        派生选择器（包括后代选择器、子元素选择器、相邻兄弟选择器）
        伪元素选择器
        属性选择器
        群组选择器
        通配符选择器

        css优先级定义？
                一般而言，选择器越特殊指向越准确，优先级越高；
                计算方法：
                标签选择器优先级为1
                类选择器优先级为10
                id选择器优先级为100
                行内样式优先级为1000
                ！important 无限大；

        （附：css选择器执行效率与兼容性详列：http://www.cnblogs.com/xiaowuzi/p/3726835.html）

3.css中属性定义，使得dom元素不显示在浏览器可视范围内？
        1.display属性为none、visibility设为hidden（但是仍然占据页面空间）
        2.设置宽高为0/透明度0/z-index位置-1000(附：该属性仅在定位元素中生效)；

                （附：display：none和visibility：hidden的区别）
                display：隐藏对应的元素不占据原来的空间。visibility：隐藏对应的元素仍占据空间位置。

4.超链接访问过后hover样式就不出现？如何解决？
        改变css属性的排列顺序（LVHA）link visited hover active

5.css hack的原理？
        由于不同的浏览器和浏览器各版本对css的支持及解析结果不一样，以及css优先级对浏览器展现效果的影响，我们可以据此针对不同浏览器情景来应用不同的css。
        
        css hack的分类？
                css hack有三种表现形式，css属性前缀法、选择器前缀法以及ie条件注释法（即头部引用if ie）。实际项目中css hack大部分是针对ie浏览器不同版本之间的表现差异而引入的。

                5.1属性前缀法：
                        例：ie6能识别下划线“_”和星号“*”，ie7能识别星号“*”（以上版本并不支持），但不能识别下划线“_”，ie6~ie10都认识“\9”，但是其他浏览器不能支持（也就是说可以利用这个特性恶心一下还在使用老版本的用户，哈哈）（“\9”测试网址http://www.jb51.net/css/24944.html）
                5.2选择器前缀法（选择器hack）
                        例：ie6能识别*html .class{},ie7能识别*+html .class{} 或者*:first-child+html .class{};
                5.3ie条件注释法：
                        针对所有ie（ie10+已经不再支持条件注释）：<!--[if IE]>ie浏览器显示的内容<![endif]-->，针对ie6及以下版本：<!--[if lte IE 6]>只在ie6及以下显示的内容<![endif]-->.这类hack不仅针对css生效，对写在判断语句里面的所有代码都会生效。

                css hack书写顺序：
                        一般将适用范围广，能识别能力强的css定义在前面。因为写在后面代码如果被识别会覆盖前面识别的。
                （hack参考大全：http://blog.csdn.net/freshlover/article/details/12132801）

6.行内元素和块级元素的具体区别？行内元素的padding和margin可设置吗？
        块级元素：总是独占一行，宽、高、内边距、外边距都可以控制。
        内联元素：和相邻的内联元素在同一行，宽、高、上下内边距、上下外边距都不可变。
        块级元素：
                div、p、h1~h6、hr、ul、ol、li、dl、dt、dd、form、table、tbody、tfoot、thead、（header、article、footer、nav、section）
        内联元素：
                span、a、b、br、em、strong、img、input、abbr、button、label、textarea
        （拓展：浏览器默认的inline-block元素

        （附：行内块元素的兼容性使用？）
                div｛
                    display:inline-blcok;  //触发ie的hasLayout
                    display:inline;
                ｝
                div｛
                    *display：inline；*zoom：1;
                ｝
7:外边距重叠是什么？导致的结果是什么？
        在css当中两个（普通文档流）竖直方向上的毗邻（没有被非空内容、padding、border 或 clear 分隔开）盒子的外边距可以结合成一个单独的外边距。这种合并外边距的方式被称为折叠，所结合而成的外边距成为折叠外边距。
        注意：父块级盒子与子块级盒子在垂直方向上毗邻也会导致外边距重叠；

        计算规则：
                两个竖直方向上相邻的外边距都是正数，折叠结果是他们两者之间较大的值。
                两个竖直方向上相邻的外边距都是负数时，折叠结果是两者绝对值的较大值。
                两个竖直方向上相邻的外边距一正一负时，折叠结果是两者的相加的和；

        (附：如何使元素上下margin不折叠？)
                1、浮动、inline-block、绝对定位；
                2、创建块级格式化上下文（BFC）的元素，不和它的子元素发生margin折叠；
                (详细链接：https://www.zhihu.com/question/19823139)

8.rgba()和opacity()的透明效果的区别？
        rgba()和opacity都能实现透明效果，但最大的不同是opacity作用于元素，以及元素内的所有内容的透明度，而rgba()只作用于元素的颜色或其背景色。
        （css样式继承拓展：http://www.cnblogs.com/thislbq/p/5882105.html）

9.css中文字的水平垂直居中？
        line-height  设置为盒子高度
        text-align  center;

10.垂直居中一个浮动元素？
        已知高度：
        .son{
                background-color:#ff0000;
                width:200px;
                height:200px;
                position:absolute;        
                top:50%;
                left:50%;
                margin-left:-100px;
                margin-top:-100px;
        }
        未知高度：
        .son{
                        width: 200px;   
                    height: 200px;   
                    background-color: #ff0000;   
                    margin:auto;   
                    position: absolute;          
                    left: 0;   
                    top: 0;   
                    right: 0;   
                    bottom: 0; 
        }
        附：css3方法未知宽高
        .father{
                display:flex;
                justify-content:center; 
                align-items:center;                
        }
        (详解c3div水平垂直居中：http://www.cnblogs.com/shenxiaolin/p/5387623.html)
        
        如何垂直居中一个<img>？
        第一种：
        .father{
                display:table-cell;                
                text-align:center;
                vertical-align:middle;
        }
        第二种：
        .father{
                height: 1000px;
                width: 1000px;
                text-align: center;
                margin: 0 auto;
                line-height: 1000px;
        }
        .img{
                vertical-align: middle;
        }


        
11.px和em的区别
        px和em都是长度单位。
        px的值是固定的，指定多少就是多少，容易计算。em的值不是固定的，并且em会继承父级元素的字体大小。
        浏览器默认字体高都是16px。在默认情况下都是：1em=16px。12px=0.75em。

12.css的content属性？有什么作用与应用？
        css的content属性专门应用在before/after伪元素上，用来插入生成内容。
        常用伪类清除浮动：
                .clearfix:after{
                        content:".";
                        display:block;
                        height:0;
                        visibility:hidden;
                        clear:both;
                }
                .clearfix{
                        *zoom:1;        
                }
        (附：清除浮动的方式？)
                1、给父元素定义height
                2、结尾处加空div标签clear：both；
                3、父级元素定义伪类：如上；
                4、父级元素定义overflow：hidden；
                5、父级元素定义overflow：auto；
                6、父级元素也浮动,需要定义宽度；
                7、父级元素定义display：table；
                8、结尾处加br标签clear：both；

                第三种：after伪元素方法清理浮动，文档结构更加清晰

13.box-sizing 常用的属性？分别有什么作用？
        box-sizing：content-box|border-box|inherit；
        content-box：宽、高应用到元素的内容框。在高、宽之外绘制元素的内边距和边框（默认效果）；
        border-box：元素的任何内边距和边框都在已设定的宽度和高度内进行绘制。
        此时的宽高=content+padding+border；