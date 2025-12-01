# Kata 19: Filter Even Numbers with `.filter()`

**Concept:** Refactoring the filter pattern with array methods

In [Kata 7](./kata-07-filter-numbers.md) we looped through numbers to pick out the evens. Let's rewrite the same behavior using the `.filter()` helper.

## Challenge

Create a `FilterEvensArrayMethod` component that:
1. Starts with the numbers array `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`
2. Uses `.filter()` to keep only even numbers
3. Displays the result as `Even numbers: 2, 4, 6, 8, 10`

**🔗 [Practice on CodeSandbox](https://codesandbox.io/)**

## Starter Code

<pre><code class="language-jsx">export default function FilterEvensArrayMethod() {
  const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  // Use .filter() here

  return (
    &lt;div&gt;
      {/* Display the even numbers */}
    &lt;/div&gt;
  );
}</code></pre>

## Hints

- `.filter()` keeps items that make the callback return `true`
- `% 2 === 0` checks if a number is even
- After filtering, use `.join(', ')` to format the string
- Store the result of `.filter()` in a descriptive variable like `evenNumbers`

## Solution

<details>
<summary>Click to reveal solution</summary>

<pre><code class="language-jsx">export default function FilterEvensArrayMethod() {
  const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  const evenNumbers = numbers.filter((number) =&gt; number % 2 === 0);

  return (
    &lt;div&gt;
      &lt;p&gt;Even numbers: {evenNumbers.join(&#x27;, &#x27;)}&lt;/p&gt;
    &lt;/div&gt;
  );
}</code></pre>

</details>

## Concept Review

- `.filter()` returns a new array with only the items that match the condition
- Callbacks should return `true` to keep an item, `false` to skip it
- This is the array-helper version of the **List Filter Pattern**
- Compare with [Kata 7](./kata-07-filter-numbers.md) to see the difference between manual loops and `.filter()`

---

**← [Back to Kata Index](./)**



