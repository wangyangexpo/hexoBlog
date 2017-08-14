---
title: react性能优化
date: 2017-08-14 18:15:14
tags:
---
### Provider
一个很简单的React组件，它主要的作用是把store放到context中，connect就可以获取store，使用store的方法，比如dispatch。其实没有被connect的组件通过声明contextTypes属性也是可以获取store，使用store的方法的，
<!-- more -->
但是这个时候，如果使用dispatch修改了store的state，React-Redux并不能把修改后的state作为props给React组件，可能会导致UI和数据不同步，所以这个时候一定要清楚自己在做什么。

### Connect
一个柯里化函数，函数将被调用两次。第一次是设置参数，第二次是组件与 Redux store 连接。connect 函数不会修改传入的 React 组件，返回的是一个新的已与 Redux store 连接的组件，而且你应该使用这个新组件。connect的使用方式是connect([mapStateToProps], [mapDispatchToProps], [mergeProps], [options])(Component)，第一次调用的时候4个参数都是可选。

mapStateToProps在store发生改变的时候才会调用，然后把返回的结果作为组件的props。
mapDispatchToProps主要作用是弱化Redux在React组件中存在感，让在组件内部改变store的操作感觉就像是调用一个通过props传递进来的函数一样。一般会配合Redux的bindActionCreators使用。如果不指定这个函数，dispatch会注入到你的组件props中。
mergeProps用来指定mapStateToProps、mapDispatchToProps、ownProps(组件自身属性)的合并规则，合并的结果作为组件的props。如果要指定这个函数，建议不要太复杂。
options里面主要关注pure，如果你的组件仅依赖props和Redux的state，pure一定要为true，这样能够避免不必要的更新。
Component就是要被连接的React组件，组件可以是任意的，不一定是AppRoot。一般会是需要更新store、或者是依赖store中state的最小组件。因为被连接的组件在Redux的state改变后会更新，大范围的更新对性能不友好，而且其中有些组件可能是没必要更新也会更新，所以要尽量拆分、细化，connect仅仅要更新store或依赖store的state的最小组件。
Reselect
mapStateToProps也被叫做selector，在store发生变化的时候就会被调用，而不管是不是selector关心的数据发生改变它都会被调用，所以如果selector计算量非常大，每次更新都重新计算可能会带来性能问题。Reselect能帮你省去这些没必要的重新计算。
Reselect 提供 createSelector 函数来创建可记忆的 selector。createSelector 接收一个 input-selectors 数组和一个转换函数作为参数。如果 state tree 的改变会引起 input-selector 值变化，那么 selector 会调用转换函数，传入 input-selectors 作为参数，并返回结果。如果 input-selectors 的值和前一次的一样，它将会直接返回前一次计算的数据，而不会再调用一次转换函数。这样就可以避免不必要的计算，为性能带来提升。

### 总结
谨慎使用context中的store
被connect组件更新的时候影响范围尽量小，避免不必要更新
使用Resselect避免不必要的selector计算