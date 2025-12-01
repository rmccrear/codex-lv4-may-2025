# Kata 20: Search Names with `.filter()`

**Concept:** Refactoring search filtering using array helpers

In [Kata 8](./kata-08-filter-search.md) we filtered names with a manual `for` loop. Let's modernize that code by switching to `.filter()` and keeping the search logic tidy.

## Challenge

Create a `SearchNamesArrayMethod` component that:
1. Reuses the names array `['Alice', 'Bob', 'Charlie', 'David', 'Eve']`
2. Has controlled input state for the search term
3. Uses `.filter()` to show only the names containing the search text (case-insensitive)

**🔗 [Practice on CodeSandbox](https://codesandbox.io/)**

## Expected Behavior

Typing updates the search input and immediately filters the list, just like Kata 8 — only the implementation changes.

## Starter Code

<pre><code class="language-jsx">import { useState } from &#x27;react&#x27;;

export default function SearchNamesArrayMethod() {
  const names = [&#x27;Alice&#x27;, &#x27;Bob&#x27;, &#x27;Charlie&#x27;, &#x27;David&#x27;, &#x27;Eve&#x27;];
  const [search, setSearch] = useState(&#x27;&#x27;);

  // Use .filter() here

  return (
    &lt;div&gt;
      {/* Add search input */}
      {/* Display filtered results */}
    &lt;/div&gt;
  );
}</code></pre>

## Hints

- Convert both the name and search term to lowercase before comparing
- `.includes()` works great inside the `.filter()` callback
- Remember that every string includes the empty string (`''`), so you still get all names when the search is blank

## Solution

<details>
<summary>Click to reveal solution</summary>

<pre><code class="language-jsx">import { useState } from &#x27;react&#x27;;

export default function SearchNamesArrayMethod() {
  const names = [&#x27;Alice&#x27;, &#x27;Bob&#x27;, &#x27;Charlie&#x27;, &#x27;David&#x27;, &#x27;Eve&#x27;];
  const [search, setSearch] = useState(&#x27;&#x27;);

  const filteredNames = names.filter((name) =&gt;
    name.toLowerCase().includes(search.toLowerCase())
  );

  return (
    &lt;div&gt;
      &lt;input
        type=&quot;text&quot;
        value={search}
        onChange={(event) =&gt; setSearch(event.target.value)}
        placeholder=&quot;Search names...&quot;
      /&gt;
      &lt;p&gt;Results: {filteredNames.join(&#x27;, &#x27;)}&lt;/p&gt;
    &lt;/div&gt;
  );
}</code></pre>

</details>

## Concept Review

- `.filter()` keeps the code short and expressive when selecting items
- Pair `.filter()` with string helpers like `.toLowerCase()` and `.includes()`
- Controlled inputs ensure React state drives the UI
- Compare with [Kata 8](./kata-08-filter-search.md) to see the evolution from loops to array helpers

---

**← [Back to Kata Index](./)**




