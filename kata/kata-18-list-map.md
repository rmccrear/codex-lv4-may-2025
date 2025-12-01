# Kata 18: Fruit List with `.map()`

**Concept:** Refactoring list rendering with array methods

We've already built `FruitList` with a manual `for` loop back in [Kata 5](./kata-05-list.md). Now let's revisit that kata and refactor it using the built-in `.map()` array method.

## Challenge

Create a `FruitListMap` component that:
1. Uses the same fruit array: `['Apple', 'Banana', 'Orange', 'Grape']`
2. Returns an unordered list (`<ul>`) with `<li>` items generated with `.map()`
3. Keeps the JSX concise by mapping directly inside the JSX

**🔗 [Practice on CodeSandbox](https://codesandbox.io/)**

## Expected Output

```
• Apple
• Banana
• Orange
• Grape
```

## Starter Code

<pre><code class="language-jsx">export default function FruitListMap() {
  const fruits = [&#x27;Apple&#x27;, &#x27;Banana&#x27;, &#x27;Orange&#x27;, &#x27;Grape&#x27;];

  return (
    &lt;ul&gt;
      {/* Use .map() here */}
    &lt;/ul&gt;
  );
}</code></pre>

## Hints

- `.map()` transforms each item in an array and returns a new array
- Inside `.map()`, return `<li key={fruit}>...</li>`
- Keys should be unique – using the fruit name works because all fruits are unique
- You can keep the entire `.map()` call right inside the JSX `{ ... }`

## Solution

<details>
<summary>Click to reveal solution</summary>

<pre><code class="language-jsx">export default function FruitListMap() {
  const fruits = [&#x27;Apple&#x27;, &#x27;Banana&#x27;, &#x27;Orange&#x27;, &#x27;Grape&#x27;];

  return (
    &lt;ul&gt;
      {fruits.map((fruit) =&gt; (
        &lt;li key={fruit}&gt;{fruit}&lt;/li&gt;
      ))}
    &lt;/ul&gt;
  );
}</code></pre>

</details>

## Concept Review

- `.map()` is perfect for transforming arrays into JSX
- Returning the mapped JSX inline keeps components short and readable
- Using the array values as keys is fine when each value is unique
- In real projects we often `.map()` over data to transform objects into JSX because array helpers run cleanly inside `{}` expressions
- Compare with [Kata 5](./kata-05-list.md) to see the difference between manual loops and array helpers

---

**← [Back to Kata Index](./)**

