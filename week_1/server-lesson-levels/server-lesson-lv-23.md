Level Navigation: [1](./server-lesson-lv-1.md) | [2](./server-lesson-lv-2.md) | [3](./server-lesson-lv-3.md) | [4](./server-lesson-lv-4.md) | [5](./server-lesson-lv-5.md) | [6](./server-lesson-lv-6.md) | [7](./server-lesson-lv-7.md) | [8](./server-lesson-lv-8.md) | [9](./server-lesson-lv-9.md) | [10](./server-lesson-lv-10.md) | [11](./server-lesson-lv-11.md) | [12⚡](./server-lesson-lv-12.md) | [13⚡](./server-lesson-lv-13.md) | [14](./server-lesson-lv-14.md) | [15](./server-lesson-lv-15.md) | [16](./server-lesson-lv-16.md) | [17](./server-lesson-lv-17.md) | [18](./server-lesson-lv-18.md) | [19](./server-lesson-lv-19.md) | [20](./server-lesson-lv-20.md) | [21](./server-lesson-lv-21.md) | [22](./server-lesson-lv-22.md) | **23⚡** | [24⚡](./server-lesson-lv-24.md) | [25⚡](./server-lesson-lv-25.md) | [26](./server-lesson-lv-26.md) | [27](./server-lesson-lv-27.md) | [28](./server-lesson-lv-28.md) | [29](./server-lesson-lv-29.md) | [30](./server-lesson-lv-30.md) | [31](./server-lesson-lv-31.md) | [32](./server-lesson-lv-32.md) | [33](./server-lesson-lv-33.md) | [34](./server-lesson-lv-34.md) | [35](./server-lesson-lv-35.md) | [36⚡](./server-lesson-lv-36.md) | [37⚡](./server-lesson-lv-37.md)

## Level 23 (Challenge): Persist to Disk

- Write your in-memory data out to a JSON file after each create.
- On server start, load the file back in so data survives restarts.
- **Important:** Name your JSON file after your resource (e.g., `books.json`, `courses.json`), not `items.json`.

<details>
<summary>Show Me: persist to disk</summary>
<pre><code class="language-js">
import { readFileSync, writeFileSync } from 'node:fs';
const DATA_PATH = new URL('./items.json', import.meta.url);

let itemsStorage = JSON.parse(readFileSync(DATA_PATH, 'utf-8'));

function saveItems() {
  writeFileSync(DATA_PATH, JSON.stringify(itemsStorage, null, 2));
}
</code></pre>
</details>