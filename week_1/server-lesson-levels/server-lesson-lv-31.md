Level Navigation: [1](./server-lesson-lv-1.md) | [2](./server-lesson-lv-2.md) | [3](./server-lesson-lv-3.md) | [(4ℹ️)](./server-lesson-lv-4.md) | [(5ℹ️)](./server-lesson-lv-5.md) | [6](./server-lesson-lv-6.md) | [7](./server-lesson-lv-7.md) | [8](./server-lesson-lv-8.md) | [9](./server-lesson-lv-9.md) | [10](./server-lesson-lv-10.md) | [11](./server-lesson-lv-11.md) | [12](./server-lesson-lv-12.md) | [13](./server-lesson-lv-13.md) | [14⚡](./server-lesson-lv-14.md) | [15⚡](./server-lesson-lv-15.md) | [(16ℹ️)](./server-lesson-lv-16.md) | [17](./server-lesson-lv-17.md) | [18](./server-lesson-lv-18.md) | [19](./server-lesson-lv-19.md) | [20](./server-lesson-lv-20.md) | [21](./server-lesson-lv-21.md) | [22](./server-lesson-lv-22.md) | [23](./server-lesson-lv-23.md) | [24](./server-lesson-lv-24.md) | [25](./server-lesson-lv-25.md) | [26⚡](./server-lesson-lv-26.md) | [27⚡](./server-lesson-lv-27.md) | [28⚡](./server-lesson-lv-28.md) | [29](./server-lesson-lv-29.md) | [30](./server-lesson-lv-30.md) | **31** | [32](./server-lesson-lv-32.md) | [33](./server-lesson-lv-33.md) | [34](./server-lesson-lv-34.md) | [35](./server-lesson-lv-35.md) | [36](./server-lesson-lv-36.md) | [37](./server-lesson-lv-37.md) | [38](./server-lesson-lv-38.md) | [39⚡](./server-lesson-lv-39.md) | [40⚡](./server-lesson-lv-40.md)

## Level 31: Refactor — Export App and Separate Server Startup

### Goal

Refactor your Express server to separate app configuration from server startup. This is a common practice that makes your code more testable, reusable, and better organized.

### Why Separate App from Server?

In your current setup, everything is in one file (`src/index.js`): the app creation, routes, and the `app.listen()` call. As your project grows, you'll want to:

1. **Test your app without starting a server**: Testing tools like Supertest need access to your Express app, but they don't need the server to be listening on a port.
2. **Reuse your app**: You might want to use the same app configuration in different contexts (testing, development, production).
3. **Better organization**: Separating concerns makes your code easier to understand and maintain.

### What You'll Do

1. **Create `src/app.js`**: Move your Express app creation and configuration here, then export it.
2. **Update `src/index.js`**: Import the app and handle server startup (the `listen()` call).

### Step-by-Step Refactor

#### Step 1: Create `src/app.js` and Export the App

Create a new file `src/app.js` and move your Express app setup there:

<details>
<summary>Show Me: exporting the app from app.js</summary>
<pre><code class="language-js">
// src/app.js
import express from 'express';

const app = express();

// Middleware
app.use(express.json());
app.use(express.static('public'));

// Routes
app.get('/', (req, res) =&gt; {
  res.send('&lt;h1&gt;Hello Express!&lt;/h1&gt;&lt;p&gt;Your server is working!&lt;/p&gt;');
});

app.get('/happy-birthday', (req, res) =&gt; {
  res.json({
    name: 'Alice',
    age: 25,
    greeting: 'Happy Birthday! 🎉'
  });
});

// ... all your other routes ...

// Export the app so it can be imported elsewhere
export default app;
</code></pre>
</details>

**Key changes:**
- All your app configuration (middleware, routes) stays in `app.js`
- The app is exported using `export default app;`
- **No `app.listen()` call** — that will go in a different file

#### Step 2: Update `src/index.js` to Import and Start the Server

Update `src/index.js` to import the app and handle server startup:

<details>
<summary>Show Me: importing app and starting server in index.js</summary>
<pre><code class="language-js">
// src/index.js
import app from './app.js';

const PORT = process.env.PORT || 3000;

app.listen(PORT, () =&gt; {
  console.log(`Server listening on port ${PORT}`);
});
</code></pre>
</details>

**Key changes:**
- Import the app: `import app from './app.js';`
- Handle the `listen()` call here
- Use environment variable `PORT` for flexibility (important for deployment)

### Your New Project Structure

After refactoring, your project structure should look like this:

```
your-project/
├── src/
│   ├── app.js      ← App configuration (middleware, routes)
│   └── index.js    ← Server startup (listen call)
├── public/
│   └── ...
└── package.json
```

### Testing the Refactor

1. **Start your server:**
   ```bash
   npm run dev
   ```
   - The server should start exactly as before
   - All your routes should work the same way

2. **Verify nothing broke:**
   - Test your routes in Postman or your browser
   - Make sure all endpoints still respond correctly

### Digging Deeper: ES6 Module Exports

**Exporting with `export default`:**
- `export default app;` makes the app the **default export** from the module
- When importing, you can use any name: `import app from './app.js'` or `import myApp from './app.js'`
- Only one default export per module

**Why this pattern is common:**
- **Separation of concerns**: App configuration is separate from server startup
- **Testability**: Tests can import the app without starting a server
- **Flexibility**: You can create multiple server instances or use the app in different contexts
- **Industry standard**: Most Express projects follow this pattern

### What's Next?

In the next level, you'll set up testing. Having the app exported makes it easy to import in your test files without needing to start a server. This refactor sets you up for success with automated testing!

**Note:** If you're using TypeScript, the same pattern applies—just use `.ts` extensions and TypeScript syntax.