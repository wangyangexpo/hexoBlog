---
title: shellSort希尔排序的间隔生成以及调优
date: 2018-11-26 11:29:55
tags:
---

### 希尔排序的间隔选择

希尔排序在排序数量较少的情况下，默认采用【5,3,1】这三个间隔，就可以达到很好的效果。

如果排序数值量在1000以上，建议使用动态生成的 间隔序列效果比较好，实际测试1万+随机数据，使用【5，3，1】的间隔耗时1100毫秒，
使用动态生成的间隔序列，时间在15毫秒以内。效果明显

```
function Sort(num) {
  this.totalNum = num
  this.gaps = [5,3,1]
  this.dataStore = []
  this.genData = function setData() {
    for (let i = 0; i < this.totalNum; ++i) {
      this.dataStore[i] = Math.floor(Math.random() * (this.totalNum + 1))
    }
  }

  this.genGaps = function genGaps() {
    let h = 1
    let gaps = []
    while (h < this.totalNum / 3) {
      gaps.unshift(h)
      h = 3 * h + 1
    }
    this.totalNum > 100 && (this.gaps = gaps)
  }

  this.bubbleSort = function bubbleSort() {
    let temp
    let data = [...this.dataStore]
    for (let outer = this.totalNum; outer >= 2; --outer) {
      for (let inner = 0; inner <= outer - 1; ++inner) {
        if (data[inner] > data[inner + 1]) {
          temp = data[inner]
          data[inner] = data[inner + 1]
          data[inner + 1] = temp
        }
      }
    }
  }

  this.shellSort = function shellsort() {
    let data = [...this.dataStore]
    for (let g = 0; g < this.gaps.length; ++g) {
      for (let i = this.gaps[g], len = data.length; i < len; ++i) {
        let temp = data[i]
        let j = i
        for (; j >= this.gaps[g] && data[j-this.gaps[g]] > temp; j -= this.gaps[g]) {
           data[j] = data[j - this.gaps[g]]
        }
        data[j] = temp
      }
    } 
  }
  this.genData()
  this.genGaps()

  // let start = Date.now()
  // this.bubbleSort()
  // let end = Date.now()
  // console.log('bubbleSort耗时： ' + (end - start) + '毫秒')

  start = Date.now()
  this.shellSort()
  end = Date.now()
  console.log('shellSort耗时： ' + (end - start) + '毫秒')
}
```