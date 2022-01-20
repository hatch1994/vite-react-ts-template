# Vite + React + TypeScript + Eslint + Prettier

使用Vite和静态代码测试 Eslint 和 Prettier 格式化的 Typescript React 入门。

## Usage
Clone the repo and run `yarn install`

## Start
After the successfull installation of the packages: `yarn start`

<details>
<summary>详细解释: 为什么它们被称为"reducer"?</summary>

该`Array.reduce()` 方法允许您获取一个值数组,一次处理一个数组中的每一项,并返回一个最终结果.您可以将其视为“将数组减少到一个值”.
`Array.reduce()`将毁掉函数作为参数,数组中的每一项都会调用一次回调函数.它需要两个参数:
- `previousResult`, 您的回调上次返回的值
- `currentItem`, 数组中的当前值

回调第一次运行时,没有`previousResult`可用的,因此我们还需要传入一个初始值,该值将用作first `previousResult`.

如果我们想将一个number数组的中的每一项相加,找出总数时多少,我们可以编写一个如下所示的reduce回调:

```js
const numbers = [2,5,8]

const addNumbers = (previousResult, currentItem) => {
    console.log({ previousResult, currentItem})
    return previousResult + currentItem;
}

const initialValue = 0;

const total = numbers.reduce(addNumbers, initialValue);
// {previousResult: 0, currentItem: 2}
// {previousResult: 2, currentItem: 5}
// {previousResult: 7, currentItem: 8}

console.log(total)
// 15
```

请注意,这个`addNumbers`回调函数本身不需要跟踪任何内容. 它接收`previousResult` 和 `currentItem` 参数, 对它们做一些事情,并返回一个新的结果值.

**Redux reducer 函数与这个“reduce”回调函数的想法完全相同**!它采用“previousResult”(`state`)和“currentItem”(`action`对象),根据这些参数决定新的状态值,并返回该新状态.
如果我们要创建一个 array Redux actions, 调用`reduce()`传入一个reducer函数,我们将以相同的方式得到最终结果:

```jsx
const actions = [
    { type: 'counter/incremented' },
    { type: 'counter/incremented' },
    { type: 'counter/incremented' }
]

const counterReducer = (previousResult, currentItem) => {
    return previousResult + 1;
}

const initialState = { value: 0 }

const finalResult = actions.reduce(counterReducer, initialState)
console.log(finalResult)
// { value: 3}
```

我们可以**Redux reducer**将一组action (随着时间的推移) 减少到一个状态. 不同之处在于 `Array.reducer` 它是一次性发生的, 而对于Redux, 他会在您运行的应用程序的整个生命周期内发生.
</details>
