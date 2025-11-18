Level Navigation: [1](./server-lesson-lv-1.md) | [2](./server-lesson-lv-2.md) | [3](./server-lesson-lv-3.md) | [(4ℹ️)](./server-lesson-lv-4.md) | [(5ℹ️)](./server-lesson-lv-5.md) | **6** | [7](./server-lesson-lv-7.md) | [8](./server-lesson-lv-8.md) | [9](./server-lesson-lv-9.md) | [10](./server-lesson-lv-10.md) | [11](./server-lesson-lv-11.md) | [12](./server-lesson-lv-12.md) | [13](./server-lesson-lv-13.md) | [14⚡](./server-lesson-lv-14.md) | [15⚡](./server-lesson-lv-15.md) | [(16ℹ️)](./server-lesson-lv-16.md) | [17](./server-lesson-lv-17.md) | [18](./server-lesson-lv-18.md) | [19](./server-lesson-lv-19.md) | [20](./server-lesson-lv-20.md) | [21](./server-lesson-lv-21.md) | [22](./server-lesson-lv-22.md) | [23](./server-lesson-lv-23.md) | [24](./server-lesson-lv-24.md) | [25](./server-lesson-lv-25.md) | [26⚡](./server-lesson-lv-26.md) | [27⚡](./server-lesson-lv-27.md) | [28⚡](./server-lesson-lv-28.md) | [29](./server-lesson-lv-29.md) | [30](./server-lesson-lv-30.md) | [31](./server-lesson-lv-31.md) | [32](./server-lesson-lv-32.md) | [33](./server-lesson-lv-33.md) | [34](./server-lesson-lv-34.md) | [35](./server-lesson-lv-35.md) | [36](./server-lesson-lv-36.md) | [37](./server-lesson-lv-37.md) | [38](./server-lesson-lv-38.md) | [39⚡](./server-lesson-lv-39.md) | [40⚡](./server-lesson-lv-40.md)

## Level 6: Serve HTML First

Now that you've tested with plain text, let's serve HTML from your root route. Update your route to use `res.send()` with an HTML snippet so you can see the browser render formatted content. For example, try sending `<h1>Hello Express!</h1><p>Your server is working!</p>` to see HTML rendering in action.

<details>
<summary>Show Me: serving HTML with res.send()</summary>
<pre><code class="language-js">
// src/index.js
app.get('/', (req, res) =&amp;gt; {
  res.send('&amp;lt;h1&amp;gt;Hello Express!&amp;lt;/h1&amp;gt;&amp;lt;p&amp;gt;Your server is working!&amp;lt;/p&amp;gt;');
});
</code></pre>
</details>

### Digging Deeper: Template Literals and Backticks

When serving HTML, you might want to write multi-line HTML for better readability. JavaScript **template literals** (strings wrapped in backticks `` ` ``) allow you to write multi-line strings and include variables:

**Backticks vs. Quotes:**
- **Regular strings** (single `'` or double `"` quotes): Must be on a single line
- **Template literals** (backticks `` ` ``): Can span multiple lines and support interpolation with `${variable}`

**Example:**
```js
// Single-line string (regular quotes)
res.send('<h1>Hello Express!</h1><p>Your server is working!</p>');

// Multi-line string (backticks)
res.send(`
  <h1>Hello Express!</h1>
  <p>Your server is working!</p>
  <ul>
    <li>Feature 1</li>
    <li>Feature 2</li>
  </ul>
`);

// Template literal with variable interpolation
const name = 'Express';
res.send(`<h1>Hello ${name}!</h1>`);
```

**When to use backticks:**
- ✅ Writing multi-line HTML strings
- ✅ Including variables in strings (interpolation)
- ✅ Building dynamic HTML content
- ❌ Not needed for simple single-line strings (regular quotes work fine)

**Note:** When using backticks for multi-line HTML, whitespace (spaces, tabs, newlines) is preserved. This is usually fine for HTML since browsers collapse extra whitespace, but be aware that indentation in your code will appear in the output.