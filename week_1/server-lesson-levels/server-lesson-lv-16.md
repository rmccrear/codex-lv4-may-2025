Level Navigation: [1](./server-lesson-lv-1.md) | [2](./server-lesson-lv-2.md) | [3](./server-lesson-lv-3.md) | [(4ℹ️)](./server-lesson-lv-4.md) | [5](./server-lesson-lv-5.md) | [6](./server-lesson-lv-6.md) | [7](./server-lesson-lv-7.md) | [8](./server-lesson-lv-8.md) | [9](./server-lesson-lv-9.md) | [10](./server-lesson-lv-10.md) | [11](./server-lesson-lv-11.md) | [12](./server-lesson-lv-12.md) | [13](./server-lesson-lv-13.md) | [14⚡](./server-lesson-lv-14.md) | [15⚡](./server-lesson-lv-15.md) | **(16ℹ️)** | [17](./server-lesson-lv-17.md) | [18](./server-lesson-lv-18.md) | [19](./server-lesson-lv-19.md) | [20](./server-lesson-lv-20.md) | [21](./server-lesson-lv-21.md) | [22](./server-lesson-lv-22.md) | [23](./server-lesson-lv-23.md) | [24](./server-lesson-lv-24.md) | [25](./server-lesson-lv-25.md) | [26⚡](./server-lesson-lv-26.md) | [27⚡](./server-lesson-lv-27.md) | [28⚡](./server-lesson-lv-28.md) | [29](./server-lesson-lv-29.md) | [30](./server-lesson-lv-30.md) | [31](./server-lesson-lv-31.md) | [32](./server-lesson-lv-32.md) | [33](./server-lesson-lv-33.md) | [34](./server-lesson-lv-34.md) | [35](./server-lesson-lv-35.md) | [36](./server-lesson-lv-36.md) | [37](./server-lesson-lv-37.md) | [38](./server-lesson-lv-38.md) | [39⚡](./server-lesson-lv-39.md) | [40⚡](./server-lesson-lv-40.md)

<!-- INFORMATIVE_ONLY -->

## Level 16: Manage Data — Create and Persist

Lay the groundwork for working with data by breaking the classic CRUD flow into small, repeatable wins. Each level builds on the previous one so you can iterate confidently. Before we bring in a real SQL database like Supabase's Postgres, we'll keep data in simple in-memory arrays (declared as module-level globals) so you can focus on route behavior without worrying about persistence.

### Why Start with In-Memory Data?

When learning to build APIs, it's common to start with in-memory storage before introducing database complexity. This approach allows you to:

- **Focus on route logic**: Learn how to structure GET, POST, PUT, DELETE routes without worrying about SQL syntax or connection management
- **Understand data flow**: See how data moves through your application from request → processing → response
- **Iterate quickly**: Make changes and test immediately without database migrations or schema updates
- **Build confidence**: Master the patterns (like finding items by ID, validating input) that you'll reuse with real databases later

### Digging Deeper: In-Memory Arrays as Module-Level Globals

**What is a module-level global?**

In Node.js, when you declare a variable at the top level of a file (outside of any function), it becomes a **module-level variable**. This variable is shared across all code within that module (file), and any route handler in that file can access and modify it.

**Example:**
```js
// src/index.js
import express from 'express';

const app = express();

// This is a module-level global array
// It's declared outside any function, at the "top level" of the module
const items = [];

app.get('/items', (req, res) => {
  // Route handlers can access the items array
  res.json(items);
});

app.post('/items', (req, res) => {
  // Route handlers can modify the items array
  items.push(req.body);
  res.status(201).json(req.body);
});
```

**Why use module-level globals for in-memory data?**

1. **Persistence during server session**: As long as your server is running, data in the array persists. Multiple requests can read and write to the same array.
2. **Shared state**: All route handlers in the same file can access the same data structure.
3. **Simple and straightforward**: No need for complex setup—just declare an array and start using it.

**Important limitations to understand:**

- **Data is lost on server restart**: When you stop the server (Ctrl+C) or it crashes, all data in the array is gone. This is why it's called "in-memory"—it only exists in the server's RAM.
- **Not shared across server instances**: If you run multiple copies of your server, each has its own separate array.
- **Not suitable for production**: For real applications, you need persistent storage (databases) that survives server restarts and can be shared across multiple servers.

**The path forward:**

As you progress through these levels, you'll learn to:
1. Create, read, update, and delete data using in-memory arrays
2. Validate and structure your data properly
3. Handle errors and edge cases
4. Later, you'll learn to connect to Supabase (PostgreSQL) and use the same patterns with persistent, production-ready storage

Think of in-memory arrays as a **training ground**—once you understand how to manipulate data with arrays, moving to a database is mostly about learning the syntax, not the concepts.