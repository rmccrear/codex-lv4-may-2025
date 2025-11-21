Level Navigation: [1](./server-lesson-lv-1.md) | [2](./server-lesson-lv-2.md) | [3](./server-lesson-lv-3.md) | [(4ℹ️)](./server-lesson-lv-4.md) | [(5ℹ️)](./server-lesson-lv-5.md) | [6](./server-lesson-lv-6.md) | [7](./server-lesson-lv-7.md) | [8](./server-lesson-lv-8.md) | [9](./server-lesson-lv-9.md) | [10](./server-lesson-lv-10.md) | [11](./server-lesson-lv-11.md) | [12](./server-lesson-lv-12.md) | [13](./server-lesson-lv-13.md) | [14⚡](./server-lesson-lv-14.md) | [15⚡](./server-lesson-lv-15.md) | [(16ℹ️)](./server-lesson-lv-16.md) | [17](./server-lesson-lv-17.md) | [18](./server-lesson-lv-18.md) | [19](./server-lesson-lv-19.md) | [20](./server-lesson-lv-20.md) | [21](./server-lesson-lv-21.md) | [22](./server-lesson-lv-22.md) | [23](./server-lesson-lv-23.md) | [24](./server-lesson-lv-24.md) | [25](./server-lesson-lv-25.md) | **26⚡** | [27⚡](./server-lesson-lv-27.md) | [28⚡](./server-lesson-lv-28.md) | [29](./server-lesson-lv-29.md) | [30](./server-lesson-lv-30.md) | [31](./server-lesson-lv-31.md) | [32](./server-lesson-lv-32.md) | [33](./server-lesson-lv-33.md) | [34](./server-lesson-lv-34.md) | [35](./server-lesson-lv-35.md) | [36](./server-lesson-lv-36.md) | [37](./server-lesson-lv-37.md) | [38](./server-lesson-lv-38.md) | [39⚡](./server-lesson-lv-39.md) | [40⚡](./server-lesson-lv-40.md)

## Level 26 (Challenge): Persist to Disk

- Write your in-memory data out to a JSON file after each create.
- On server start, load the file back in so data survives restarts.
- **Important:** Name your JSON file after your resource (e.g., `books.json`, `courses.json`), not `items.json`.
- **Hint:** Replace your fake data array (like `const itemsStorage = [...]`) with data loaded from the JSON file. Read from the file once when the server starts, then call `saveItems()` after each change (POST, PUT, DELETE) in your routes.

<details>
<summary>Show Me: read from disk</summary>
<pre><code class="language-js">
import { readFileSync, writeFileSync } from 'node:fs';

const DATA_PATH = './items.json';

// Load data from file when server starts
// If file doesn't exist yet, start with empty array
let itemsStorage = [];
try {
  itemsStorage = JSON.parse(readFileSync(DATA_PATH, 'utf-8'));
} catch (error) {
  // File doesn't exist yet, start with empty array
  itemsStorage = [];
}
</code></pre>
</details>

<details>
<summary>Show Me: persist to disk</summary>
<pre><code class="language-js">
import { readFileSync, writeFileSync } from 'node:fs';

const DATA_PATH = './items.json';

// Load data from file when server starts (read once at startup)
// If file doesn't exist yet, start with empty array
let itemsStorage = [];
try {
  itemsStorage = JSON.parse(readFileSync(DATA_PATH, 'utf-8'));
} catch (error) {
  // File doesn't exist yet, start with empty array
  itemsStorage = [];
}

function saveItems() {
  writeFileSync(DATA_PATH, JSON.stringify(itemsStorage, null, 2));
}

// Use in your routes - call saveItems() after each change:
app.post('/items', (req, res) =&gt; {
  itemsStorage.push(req.body);
  saveItems(); // Write after each POST
  res.json(req.body);
});

app.put('/items/:id', (req, res) =&gt; {
  // ... update logic ...
  saveItems(); // Write after each PUT
  res.json(updatedItem);
});

app.delete('/items/:id', (req, res) =&gt; {
  // ... delete logic ...
  saveItems(); // Write after each DELETE
  res.json({ message: 'Deleted' });
});
</code></pre>
</details>