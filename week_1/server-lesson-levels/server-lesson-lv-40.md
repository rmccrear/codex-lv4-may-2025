Level Navigation: [1](./server-lesson-lv-1.md) | [2](./server-lesson-lv-2.md) | [3](./server-lesson-lv-3.md) | [(4ℹ️)](./server-lesson-lv-4.md) | [5](./server-lesson-lv-5.md) | [6](./server-lesson-lv-6.md) | [7](./server-lesson-lv-7.md) | [8](./server-lesson-lv-8.md) | [9](./server-lesson-lv-9.md) | [10](./server-lesson-lv-10.md) | [11](./server-lesson-lv-11.md) | [12](./server-lesson-lv-12.md) | [13](./server-lesson-lv-13.md) | [14⚡](./server-lesson-lv-14.md) | [15⚡](./server-lesson-lv-15.md) | [(16ℹ️)](./server-lesson-lv-16.md) | [17](./server-lesson-lv-17.md) | [18](./server-lesson-lv-18.md) | [19](./server-lesson-lv-19.md) | [20](./server-lesson-lv-20.md) | [21](./server-lesson-lv-21.md) | [22](./server-lesson-lv-22.md) | [23](./server-lesson-lv-23.md) | [24](./server-lesson-lv-24.md) | [25](./server-lesson-lv-25.md) | [26⚡](./server-lesson-lv-26.md) | [27⚡](./server-lesson-lv-27.md) | [28⚡](./server-lesson-lv-28.md) | [29](./server-lesson-lv-29.md) | [30](./server-lesson-lv-30.md) | [31](./server-lesson-lv-31.md) | [32](./server-lesson-lv-32.md) | [33](./server-lesson-lv-33.md) | [34](./server-lesson-lv-34.md) | [35](./server-lesson-lv-35.md) | [36](./server-lesson-lv-36.md) | [37](./server-lesson-lv-37.md) | [38](./server-lesson-lv-38.md) | [39⚡](./server-lesson-lv-39.md) | **40⚡**

## Level 40 (Challenge): Deploy with Render

Deploy your Express server to Render so it's accessible on the internet. This allows you to share your API with others and test it from anywhere.

**Setup:**
1. Create an account at [render.com](https://render.com)
   - **Note:** You may need a credit card for ID verification (free tier available)
2. Connect your Git repository (GitHub, GitLab, or Bitbucket)
3. Create a new **Web Service** (not a Static Site)
4. Configure your service:
   - **Build Command:** `npm install` (or leave default)
   - **Start Command:** `npm start` (make sure your `package.json` has a `start` script)
   - **Environment:** Node
5. Ensure your server listens on the port provided by Render's `PORT` environment variable:

<details>
<summary>Show Me: Render deployment configuration</summary>
<pre><code class="language-js">
// src/index.js or src/app.js
import express from 'express';

const app = express();
const PORT = process.env.PORT || 3000;

// ... your routes ...

app.listen(PORT, () =&amp;gt; {
  console.log(`Server running on port ${PORT}`);
});
</code></pre>
</details>

6. Deploy and test your live API endpoints using the URL Render provides (e.g., `https://your-app.onrender.com`)

**Success Criteria:**
- Your Express server is live and accessible via a public URL
- All your routes work correctly on the deployed server
- You can test your API using Postman or curl with the Render URL