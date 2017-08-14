---
title: react-native常用样式总结
date: 2017-08-08 16:36:24
tags:
---
## View Style
支持Flexbox、ShadowPropTypesIOS、Transforms属性。

背面可见性
backfaceVisibility enum('visible', 'hidden')

背景颜色
backgroundColor string

<!-- more -->
边框颜色
borderColor string
borderTopColor string
borderRightColor string
borderBottomColor string
borderLeftColor string

边框圆角半径
borderRadius number
borderTopLeftRadius number
borderTopRightRadius number
borderBottomLeftRadius number
borderBottomRightRadius number

边框样式
borderStyle enum('solid', 'dotted', 'dashed')

边框宽度
borderWidth number
borderTopWidth number
borderRightWidth number
borderBottomWidth number
borderLeftWidth number

不透明度
opacity number

填充
overflow enum('visible', 'hidden')

测试ID（用来定位视图）
testID string

## Image Style
支持Flexbox和Transforms

调整大小模式
resizeMode Object.keys(ImageResizeMode)

背景颜色
backgroundColor string

边框属性
borderColor string
borderWidth number
borderRadius number

填充
overflow enum('visible', 'hidden')

色彩颜色
tintColor string

不透明度
opacity number

## Text Style
支持View的样式

字体颜色
color string

字体
fontFamily string

字体大小
fontSize number

字体样式
fontStyle enum('normal', 'italic')

字体粗细（指定字体的粗细。大多数字体都支持’normal’和’bold’值。并非所有字体都支持所有的数字值。如果某个值不支持，则会自动选择最接近的值。）
fontWeight enum("normal", 'bold', '100', '200', '300', '400', '500', '600', '700', '800', '900')

字间距
letterSpacing number

行间距
lineHeight number

字体对齐方式（指定文本的对齐方式。其中’justify’值仅iOS支持。）
textAlign enum("auto", 'left', 'right', 'center', 'justify')

## Flexbox Style

宽高
width number
height number

项目对齐
alignItems enum('flex-start', 'flex-end', 'center', 'stretch')

自身对齐
alignSelf enum('auto', 'flex-start', 'flex-end', 'center', 'stretch')

边框宽度
borderBottomWidth number
borderLeftWidth number
borderRightWidth number
borderTopWidth number
borderWidth number

弹性伸缩
flex number

弹性伸缩方向
flexDirection enum('row', 'column')

弹性伸缩包裹
flexWrap enum('wrap', 'nowrap')

证明内容
justifyContent enum('flex-start', 'flex-end', 'center', 'space-between', 'space-around')

外边距
margin number
marginBottom number
marginLeft number
marginRight number
marginTop number
marginHorizontal number
marginVertical number

内边距
padding number
paddingBottom number
paddingLeft number
paddingRight number
paddingTop number
paddingHorizontal number
paddingVertical number

位置（绝对、相对）
position enum('absolute', 'relative')

上下左右
right number
top number
left number
bottom number

## Transform

属性变化
transform [{perspective: number}, {rotate: string}, {rotateX: string}, {rotateY: string}, {rotateZ: string}, {scale: number}, {scaleX: number}, {scaleY: number}, {translateX: number}, {translateY: number}, {skewX: string}, {skewY: string}]

属性矩阵
transformMatrix TransformMatrixPropType 