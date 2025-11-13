Level Navigation: [1](./server-lesson-lv-1.md) | [2](./server-lesson-lv-2.md) | [3](./server-lesson-lv-3.md) | [4](./server-lesson-lv-4.md) | [5](./server-lesson-lv-5.md) | [6](./server-lesson-lv-6.md) | [7](./server-lesson-lv-7.md) | [8](./server-lesson-lv-8.md) | [9](./server-lesson-lv-9.md) | [10](./server-lesson-lv-10.md) | [11](./server-lesson-lv-11.md) | [12⚡](./server-lesson-lv-12.md) | [13⚡](./server-lesson-lv-13.md) | [14](./server-lesson-lv-14.md) | [15](./server-lesson-lv-15.md) | [16](./server-lesson-lv-16.md) | [17](./server-lesson-lv-17.md) | [18](./server-lesson-lv-18.md) | [19](./server-lesson-lv-19.md) | [20](./server-lesson-lv-20.md) | [21](./server-lesson-lv-21.md) | [22](./server-lesson-lv-22.md) | [23⚡](./server-lesson-lv-23.md) | [24⚡](./server-lesson-lv-24.md) | [25⚡](./server-lesson-lv-25.md) | [26](./server-lesson-lv-26.md) | [27](./server-lesson-lv-27.md) | [28](./server-lesson-lv-28.md) | **29** | [30](./server-lesson-lv-30.md) | [31](./server-lesson-lv-31.md) | [32](./server-lesson-lv-32.md) | [33](./server-lesson-lv-33.md) | [34](./server-lesson-lv-34.md) | [35](./server-lesson-lv-35.md) | [36⚡](./server-lesson-lv-36.md) | [37⚡](./server-lesson-lv-37.md)

## Level 29: Test the Hello Express Route

Set up Vitest and Supertest to test your Express routes. Start with a simple test for your root route that serves HTML.

**Setup:**
1. Install testing dependencies: `npm install -D vitest supertest @vitest/coverage-v8`
2. Create a `tests` directory in the root of your project.
3. Export your Express app from `src/app.ts` (or `src/index.js`) so it can be imported in tests

<details>
<summary>Show Me: basic test setup and Hello Express test</summary>
<pre><code class="language-ts">
// tests/routes/app.test.ts
import { describe, it, expect } from 'vitest';
import request from 'supertest';
import app from '../../src/app';

describe('Server Routes', () =&amp;gt; {
  it('serves HTML from root route', async () =&amp;gt; {
    const server = app.listen(0);
    const res = await request(server).get('/');
    server.close();
    expect(res.status).toBe(200);
    expect(res.text).toContain('&amp;lt;h1&amp;gt;Hello Express!&amp;lt;/h1&amp;gt;');
    expect(res.headers['content-type']).toMatch(/html/);
  });
});
</code></pre>
</details>