Level Navigation: [1](./server-lesson-lv-1.md) | [2](./server-lesson-lv-2.md) | [3](./server-lesson-lv-3.md) | [(4ℹ️)](./server-lesson-lv-4.md) | [5](./server-lesson-lv-5.md) | [6](./server-lesson-lv-6.md) | [7](./server-lesson-lv-7.md) | [8](./server-lesson-lv-8.md) | [9](./server-lesson-lv-9.md) | [10](./server-lesson-lv-10.md) | [11](./server-lesson-lv-11.md) | [12](./server-lesson-lv-12.md) | [13](./server-lesson-lv-13.md) | [14⚡](./server-lesson-lv-14.md) | [15⚡](./server-lesson-lv-15.md) | [(16ℹ️)](./server-lesson-lv-16.md) | [17](./server-lesson-lv-17.md) | [18](./server-lesson-lv-18.md) | [19](./server-lesson-lv-19.md) | [20](./server-lesson-lv-20.md) | **21** | [22](./server-lesson-lv-22.md) | [23](./server-lesson-lv-23.md) | [24](./server-lesson-lv-24.md) | [25](./server-lesson-lv-25.md) | [26⚡](./server-lesson-lv-26.md) | [27⚡](./server-lesson-lv-27.md) | [28⚡](./server-lesson-lv-28.md) | [29](./server-lesson-lv-29.md) | [30](./server-lesson-lv-30.md) | [31](./server-lesson-lv-31.md) | [32](./server-lesson-lv-32.md) | [33](./server-lesson-lv-33.md) | [34](./server-lesson-lv-34.md) | [35](./server-lesson-lv-35.md) | [36](./server-lesson-lv-36.md) | [37](./server-lesson-lv-37.md) | [38](./server-lesson-lv-38.md) | [39⚡](./server-lesson-lv-39.md) | [40⚡](./server-lesson-lv-40.md)

## Level 21: Enforce Basic Validation

- Ensure required fields are present and short-circuit with `400` plus an error message when data is missing.
- Add default values or type checks as needed to keep the data structure consistent.
- **Reminder:** Validate fields appropriate for your resource type, not just the example `items` fields.

<details>
<summary>Show Me: validation check</summary>
<pre><code class="language-js">
if (!req.body?.title) {
  return res.status(400).json({ error: 'Title is required' });
}
</code></pre>
</details>

**Understanding the shorthand:** `!req.body?.title` uses two JavaScript features:
- **Optional chaining (`?.`)**: Safely accesses `title` even if `req.body` is `undefined` or `null`. Without `?`, accessing `req.body.title` when `req.body` is `undefined` would throw an error.
- **Logical NOT (`!`)**: Negates the value, so the condition is true when `title` is missing, empty string, `null`, `undefined`, `0`, or `false`.

This is equivalent to: `if (!req.body || !req.body.title)` but more concise and safer.