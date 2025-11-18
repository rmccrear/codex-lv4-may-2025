Level Navigation: [1](./server-lesson-lv-1.md) | [2](./server-lesson-lv-2.md) | [3](./server-lesson-lv-3.md) | [(4ℹ️)](./server-lesson-lv-4.md) | [(5ℹ️)](./server-lesson-lv-5.md) | [6](./server-lesson-lv-6.md) | [7](./server-lesson-lv-7.md) | [8](./server-lesson-lv-8.md) | [9](./server-lesson-lv-9.md) | [10](./server-lesson-lv-10.md) | [11](./server-lesson-lv-11.md) | [12](./server-lesson-lv-12.md) | [13](./server-lesson-lv-13.md) | [14⚡](./server-lesson-lv-14.md) | [15⚡](./server-lesson-lv-15.md) | [(16ℹ️)](./server-lesson-lv-16.md) | [17](./server-lesson-lv-17.md) | [18](./server-lesson-lv-18.md) | [19](./server-lesson-lv-19.md) | **20** | [21](./server-lesson-lv-21.md) | [22](./server-lesson-lv-22.md) | [23](./server-lesson-lv-23.md) | [24](./server-lesson-lv-24.md) | [25](./server-lesson-lv-25.md) | [26⚡](./server-lesson-lv-26.md) | [27⚡](./server-lesson-lv-27.md) | [28⚡](./server-lesson-lv-28.md) | [29](./server-lesson-lv-29.md) | [30](./server-lesson-lv-30.md) | [31](./server-lesson-lv-31.md) | [32](./server-lesson-lv-32.md) | [33](./server-lesson-lv-33.md) | [34](./server-lesson-lv-34.md) | [35](./server-lesson-lv-35.md) | [36](./server-lesson-lv-36.md) | [37](./server-lesson-lv-37.md) | [38](./server-lesson-lv-38.md) | [39⚡](./server-lesson-lv-39.md) | [40⚡](./server-lesson-lv-40.md)

## Level 20: Build `POST /items`

- Accept a JSON payload, append it to the in-memory list, and return status `201`.
- Return the newly created record so clients can confirm what was saved.
- **Important:** Use your own resource endpoint (e.g., `/books`, `/courses`) instead of `/items` in your routes.
- Use Postman (or a similar REST client) to send a `POST` request:
  1. Set the method to `POST` and the URL to `http://localhost:3000/items` (adjust port as needed).
  2. In the "Body" tab choose "raw" → "JSON" and paste a payload like `{ "title": "Notebook", "price": 4.99 }`.
  3. Send the request and confirm the response shows status `201` with the new record (including any generated `id`).

<details>
<summary>Show Me: POST route starter code</summary>
<pre><code class="language-js">
// Make sure you have express.json() middleware set up first!
app.use(express.json());

app.post('/items', (req, res) =&amp;gt; {
  // req.body contains the parsed JSON from the request
  const newItem = req.body;
  
  // Add to your storage array
  itemsStorage.push(newItem);
  
  // Return the created item with 201 status
  res.status(201).json(newItem);
});
</code></pre>
</details>

### Diving Deeper: Request Body and Middleware

The **request body** is the data sent by the client in a POST, PUT, or PATCH request. When you send JSON from Postman or another client, it arrives in the request body as **plain text** (a string like `'{"name":"Alice","age":25}'`). 

**Middleware** are functions that run between receiving a request and sending a response. They can modify the request or response objects, execute code, or pass control to the next middleware function.

The `express.json()` middleware transforms that plain text JSON string into a **POJO (Plain Old JavaScript Object)** that you can use in your code. Without this middleware, `req.body` would be `undefined` or contain the raw string.

For JSON request bodies, you need to add `express.json()` middleware before your routes:

```js
import express from 'express';
const app = express();

// Middleware to parse JSON request bodies
// This transforms the plain text JSON string into a JavaScript object
app.use(express.json());

// Now req.body will contain a parsed JavaScript object
app.post('/items', (req, res) => {
  console.log(req.body); // Access the parsed object (e.g., { name: 'Alice', age: 25 })
  // ...
});
```

### Try It: See What Happens Without Middleware

1. **Temporarily comment out** `app.use(express.json())` in your server file
2. **Send a POST request** from Postman with a JSON body (e.g., `{ "title": "Test", "price": 10 }`)
3. **Log `req.body`** in your route handler: `console.log('req.body:', req.body)`
4. **Observe:** You'll see `req.body` is `undefined` because Express hasn't parsed the JSON string
5. **Uncomment** `app.use(express.json())` and try again
6. **Now observe:** `req.body` contains the parsed JavaScript object `{ title: 'Test', price: 10 }`

This demonstrates why middleware is essential—it transforms the raw request data into a format your code can work with!