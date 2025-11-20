Level Navigation: [1](./server-lesson-lv-1.md) | [2](./server-lesson-lv-2.md) | [3](./server-lesson-lv-3.md) | [(4ℹ️)](./server-lesson-lv-4.md) | [(5ℹ️)](./server-lesson-lv-5.md) | [6](./server-lesson-lv-6.md) | [7](./server-lesson-lv-7.md) | [8](./server-lesson-lv-8.md) | [9](./server-lesson-lv-9.md) | [10](./server-lesson-lv-10.md) | [11](./server-lesson-lv-11.md) | [12](./server-lesson-lv-12.md) | [13](./server-lesson-lv-13.md) | [14⚡](./server-lesson-lv-14.md) | [15⚡](./server-lesson-lv-15.md) | [(16ℹ️)](./server-lesson-lv-16.md) | [17](./server-lesson-lv-17.md) | [18](./server-lesson-lv-18.md) | [19](./server-lesson-lv-19.md) | [20](./server-lesson-lv-20.md) | [21](./server-lesson-lv-21.md) | [22](./server-lesson-lv-22.md) | [23](./server-lesson-lv-23.md) | [24](./server-lesson-lv-24.md) | [25](./server-lesson-lv-25.md) | [26⚡](./server-lesson-lv-26.md) | [27⚡](./server-lesson-lv-27.md) | [28⚡](./server-lesson-lv-28.md) | [29](./server-lesson-lv-29.md) | **30** | [31](./server-lesson-lv-31.md) | [32](./server-lesson-lv-32.md) | [33](./server-lesson-lv-33.md) | [34](./server-lesson-lv-34.md) | [35](./server-lesson-lv-35.md) | [36](./server-lesson-lv-36.md) | [37](./server-lesson-lv-37.md) | [38](./server-lesson-lv-38.md) | [39⚡](./server-lesson-lv-39.md) | [40⚡](./server-lesson-lv-40.md)

## Level 30: Harden — Validate and Handle Errors

### Goal

Add validation and consistent error handling to your API.

### What to Do

1. Validate incoming POST data and return `400` on bad input.
2. Centralize errors in a helper or middleware that responds with `{ "error": "message" }`.
3. Optional booster:
   - Add a timing log for each request.

<details>
<summary>Show Me: comprehensive validation</summary>
<pre><code class="language-js">
// Validate multiple required fields
app.post('/items', (req, res) =&amp;gt; {
  if (!req.body?.title) {
    return res.status(400).json({ error: 'Title is required' });
  }
  if (!req.body?.price) {
    return res.status(400).json({ error: 'Price is required' });
  }
  if (typeof req.body.price !== 'number' || req.body.price &amp;lt; 0) {
    return res.status(400).json({ error: 'Price must be a positive number' });
  }
  
  // If validation passes, create the item
  const newItem = { ...req.body, id: randomUUID() };
  itemsStorage.push(newItem);
  res.status(201).json(newItem);
});
</code></pre>
</details>

<details>
<summary>Show Me: centralized error helper</summary>
<pre><code class="language-js">
// Create a helper function for consistent error responses
function sendError(res, statusCode, message) {
  return res.status(statusCode).json({ error: message });
}

// Use it in your routes
app.post('/items', (req, res) =&amp;gt; {
  if (!req.body?.title) {
    return sendError(res, 400, 'Title is required');
  }
  // ... rest of route
});

app.get('/items/:id', (req, res) =&amp;gt; {
  const item = itemsStorage.find(entry =&amp;gt; entry.id === req.params.id);
  if (!item) {
    return sendError(res, 404, 'Item not found');
  }
  res.json(item);
});
</code></pre>
</details>

<details>
<summary>Show Me: request timing log (optional)</summary>
<pre><code class="language-js">
// Add timing middleware before your routes
app.use((req, res, next) =&amp;gt; {
  const start = Date.now();
  
  // Log after response is sent
  res.on('finish', () =&amp;gt; {
    const duration = Date.now() - start;
    console.log(`${req.method} ${req.path} - ${res.statusCode} - ${duration}ms`);
  });
  
  next();
});
</code></pre>
</details>

### Digging Deeper: Middleware in Express

**What is middleware?**

Middleware functions are functions that have access to the request object (`req`), the response object (`res`), and the `next` function in the application's request-response cycle. Middleware can execute code, make changes to the request and response objects, end the request-response cycle, or call the next middleware function.

**The Request-Response Cycle:**

When a request comes in, Express passes it through middleware functions in the order they are defined. Each middleware can:
1. **Execute code** (like logging, timing, authentication)
2. **Modify the request or response** (like parsing JSON, adding headers)
3. **End the cycle** (by sending a response)
4. **Call `next()`** to pass control to the next middleware

**Example: How `express.json()` Works**

```js
// This middleware runs for every request
app.use(express.json());

// What it does:
// 1. Checks if request has Content-Type: application/json
// 2. Reads the request body
// 3. Parses it from JSON string to JavaScript object
// 4. Attaches it to req.body
// 5. Calls next() to continue to your route handlers
```

**Types of Middleware:**

1. **Application-level middleware** (runs for all routes):
   ```js
   app.use(express.json()); // Parse JSON bodies
   app.use((req, res, next) => {
     console.log('Request received:', req.method, req.path);
     next();
   });
   ```

2. **Route-level middleware** (runs for specific routes):
   ```js
   app.post('/items', validateItem, (req, res) => {
     // validateItem is middleware that runs before this handler
   });
   ```

3. **Error-handling middleware** (runs when errors occur):
   ```js
   app.use((err, req, res, next) => {
     console.error(err);
     res.status(500).json({ error: 'Something went wrong' });
   });
   ```

**Why Use Middleware?**

- **Separation of concerns**: Each middleware handles one responsibility (parsing, logging, validation)
- **Reusability**: Write once, use across multiple routes
- **Order matters**: Middleware runs in the order it's defined, so you can build a pipeline of operations
- **Flexibility**: You can add, remove, or modify middleware without changing route handlers

**Common Middleware Patterns:**

- **Logging**: Record every request for debugging
- **Authentication**: Check if user is logged in before allowing access
- **Validation**: Verify request data before processing
- **Error handling**: Catch and format errors consistently
- **Timing**: Measure how long requests take to process