Level Navigation: [1](./server-lesson-lv-1.md) | [2](./server-lesson-lv-2.md) | [3](./server-lesson-lv-3.md) | [(4ℹ️)](./server-lesson-lv-4.md) | [(5ℹ️)](./server-lesson-lv-5.md) | [6](./server-lesson-lv-6.md) | [7](./server-lesson-lv-7.md) | [8](./server-lesson-lv-8.md) | [9](./server-lesson-lv-9.md) | [10](./server-lesson-lv-10.md) | [11](./server-lesson-lv-11.md) | [12](./server-lesson-lv-12.md) | [13](./server-lesson-lv-13.md) | [14⚡](./server-lesson-lv-14.md) | [15⚡](./server-lesson-lv-15.md) | [(16ℹ️)](./server-lesson-lv-16.md) | [17](./server-lesson-lv-17.md) | [18](./server-lesson-lv-18.md) | [19](./server-lesson-lv-19.md) | [20](./server-lesson-lv-20.md) | [21](./server-lesson-lv-21.md) | [22](./server-lesson-lv-22.md) | [23](./server-lesson-lv-23.md) | **24** | [25](./server-lesson-lv-25.md) | [26⚡](./server-lesson-lv-26.md) | [27⚡](./server-lesson-lv-27.md) | [28⚡](./server-lesson-lv-28.md) | [29](./server-lesson-lv-29.md) | [30](./server-lesson-lv-30.md) | [31](./server-lesson-lv-31.md) | [32](./server-lesson-lv-32.md) | [33](./server-lesson-lv-33.md) | [34](./server-lesson-lv-34.md) | [35](./server-lesson-lv-35.md) | [36](./server-lesson-lv-36.md) | [37](./server-lesson-lv-37.md) | [38](./server-lesson-lv-38.md) | [39⚡](./server-lesson-lv-39.md) | [40⚡](./server-lesson-lv-40.md)

## Level 24: Implement `DELETE /items/:id`

- Remove a record by `id` and return `200` when found.
- Use the `filter` pattern to create a new array without the deleted item. Replace the array with the filtered array. (See the "Show me" for more.)
- Respond with `404` and a friendly error JSON when the id is missing.
- **Remember:** Apply the filter pattern to your own resource array, not `itemsStorage`.

<details>
<summary>Show Me: complete DELETE route</summary>
<pre><code class="language-js">
app.delete('/items/:id', (req, res) =&gt; {
  
  console.log("Deleting " + req.params.id)

  // Find the item first to check if it exists
  const item = itemsStorage.find((entry) =&gt; entry.id === req.params.id);
  
  // If not found, return 404
  if (!item) {
    return res.status(404).json({ error: 'Item not found' });
  }
  
  // TODO: Delete the item from your storage.
  
  
  // Return success response
  res.status(200).json({ message: 'Item deleted successfully' });
});
</code></pre>
</details>

<details>
<summary>Show Me: delete using filter pattern</summary>
<pre><code class="language-js">
const item = itemsStorage.find((entry) =&gt; entry.id === req.params.id);
if (!item) return res.status(404).json({ error: 'Item not found' });

// Use filter to create a new array without the deleted item
// The filter pattern keeps all items where id does NOT match
itemsStorage = itemsStorage.filter((entry) =&gt; entry.id !== req.params.id);
res.status(200).json({ message: 'Item deleted successfully' });
</code></pre>
</details>