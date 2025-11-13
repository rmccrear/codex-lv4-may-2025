<!-- LEVEL_START -->

## Level 1: Why Build an Express Server?

Over this week you will grow a simple Express project into a well-structured API. Each level maps to a daily assignment, building confidence as you layer on new responsibilities for your routes.

### Project Setup

Before diving into the concepts, let's set up your Express project:

1. **Initialize your project:**
   ```bash
   npm init -y
   ```

2. **Install Express and development dependencies:**
   ```bash
   npm install express
   npm install --save-dev nodemon
   ```
   
   **📖 References:**
   - [Express.js Documentation](https://expressjs.com/)
   - [Express Hello World Example](https://expressjs.com/en/starter/hello-world.html)

<!-- LEVEL_START -->

## Level 2: Configure Package.json

3. **Add a dev script to `package.json`:**
   
   Show Me: npm scripts with nodemon and node
   
   ```json
   {
     "type": "module",
     "scripts": {
       "start": "node src/index.js",
       "dev": "nodemon src/index.js"
     }
   }
   ```
   
   **Understanding the scripts:**
   - **`npm start`**: Runs your server with Node.js. Use this for production or when you want to run the server once.
   - **`npm run dev`**: Runs your server with `nodemon`, which automatically restarts the server whenever you save changes to your files. This speeds up your development workflow—no need to manually stop and restart the server after each code change.
   
   **ES6 Modules (`"type": "module"`):**
   - Setting `"type": "module"` in `package.json` enables ES6 module syntax throughout your project.
   - Use `import` and `export` instead of CommonJS `require()` and `module.exports`:
     ```js
     // ES6 Modules (with "type": "module")
     import express from 'express';
     export default app;
     
     // CommonJS (without "type": "module")
     const express = require('express');
     module.exports = app;
     ```
   - ES6 modules are the modern standard and provide better static analysis and tree-shaking capabilities.

<!-- LEVEL_START -->

## Level 3: Create Your First Express Server

4. **Create your project structure:**
   - Create a `src` directory
   - Create `src/index.js` as your main server file
   
   Show Me: starter Express server code
   
   ```js
   // src/index.js
   import express from 'express';
   
   const app = express();
   const port = 3000;
   
   app.get('/', (req, res) => {
     res.send('Hello World!');
   });
   
   app.listen(port, () => {
     console.log(`Server listening on port ${port}`);
   });
   ```
   
   **See:** [Express Hello World Example](https://expressjs.com/en/starter/hello-world.html) for a minimal Express app example.

Now you're ready to start building your Express server!

### Try It!

Test your server setup:

1. **Start the development server:**
   ```bash
   npm run dev
   ```
   - The server should start and display "Server listening on port 3000"
   - Open `http://localhost:3000` in your browser
   - You should see "Hello World!" displayed
   - Try making a change to `src/index.js` (like changing the message) and save—nodemon will automatically restart the server!

2. **Stop the server** (press `Ctrl+C` in your terminal)

3. **Start the production server:**
   ```bash
   npm start
   ```
   - The server starts the same way, but without auto-restart
   - Make a change to your code and save—notice the server doesn't restart automatically
   - Stop the server again (`Ctrl+C`)

**💡 Tip:** Use `npm run dev` during development for the auto-restart feature, and `npm start` when you want to test the production behavior.

<!-- LEVEL_START -->

<!-- INFORMATIVE_ONLY -->

## Level 4: Understanding HTTP Fundamentals

At the core sits the web server: a program that listens for incoming HTTP requests, processes them, and sends back responses. Requests are structured messages that include a verb (like `GET` or `POST`), a path, headers, and optionally a body [^mdn-methods]. The server examines those pieces, decides what work to perform, and then constructs a response containing a status line, headers, and a body.

Status codes communicate the outcome of each request—`200` means "OK", `201` indicates a resource was created, `400` flags invalid input, and `500` signals something went wrong on the server. Matching the right status to each scenario helps clients understand what happened without reading the full payload, and resources like [http.cat](https://http.cat/) make the full catalog easy (and fun) to scan.

The response body can take many forms, but two you'll use often are HTML and JSON. HTML (`text/html`) is perfect for returning full web pages that a browser can render. JSON (`application/json`) shines when you want to send structured data to another program or frontend. These formats are part of the broader MIME (Multipurpose Internet Mail Extensions) type system, which labels response payloads so clients know how to parse them [^mdn-mime]. Choosing the correct MIME type—communicated through the `Content-Type` header—is critical for interoperability as your API evolves.

[^mdn-mime]: [Media types (MIME types) — MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/MIME_types)
[^mdn-methods]: [HTTP request methods — MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Methods)

<!-- LEVEL_START -->

## Level 5: Kickoff — Start the Server

Focus on spinning up a minimal Express app and verifying that you can return JSON back to a client. This level should feel quick—you only need a root route and confidence that the server responds.

<!-- LEVEL_START -->

## Level 6: Serve HTML First

Now that you've tested with plain text, let's serve HTML from your root route. Update your route to use `res.send()` with an HTML snippet so you can see the browser render formatted content. For example, try sending `<h1>Hello Express!</h1><p>Your server is working!</p>` to see HTML rendering in action.

<!-- LEVEL_START -->

## Level 7: Set Up Postman for Testing

Download and install Postman (the desktop application, not the website) so you can test your localhost server. Postman allows you to send HTTP requests to `http://localhost:3000` and inspect responses.

**Option 1: Postman Desktop App (Recommended)**
- Download from [postman.com/downloads](https://www.postman.com/downloads/)
- Install the desktop application (not the web version)
- The desktop app can access `localhost` URLs

**Option 2: Postman Extension**
- Install the Postman extension for VS Code or your preferred browser
- Ensure it supports localhost connections

Once installed, you'll use Postman to test your API endpoints throughout this project. Make sure you can access `http://localhost:3000` before moving to the next level.

<!-- LEVEL_START -->

## Level 8: Serve Static Assets

Use `app.use(express.static('public'))` (or a directory name you prefer) so the server can return HTML, CSS, images, or other assets directly from disk. Seed the directory with a variety of files (`styles.css`, `sample.json`, `report.csv`, `logo.png`) and hit each one with your browser or Postman.

Show Me: serve static assets

```js
import express from 'express';

const app = express();

// Serve static files from the 'public' directory
// Files in public/ will be accessible at the root URL
// e.g., public/styles.css → http://localhost:3000/styles.css
app.use(express.static('public'));

const port = 3000;
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
```

**Directory structure example:**
```
your-project/
├── src/
│   └── index.js
├── public/
│   ├── styles.css
│   ├── sample.json
│   ├── report.csv
│   └── logo.png
└── package.json
```

**Testing:**
- Visit `http://localhost:3000/styles.css` to see the CSS file
- Visit `http://localhost:3000/sample.json` to see the JSON file
- Visit `http://localhost:3000/logo.png` to see the image

<!-- LEVEL_START -->

## Level 9: Inspect MIME Types

- Use Postman, cURL, or your browser dev tools to download the static assets you just exposed.
- Record the `Content-Type` header that comes back for HTML, CSS, JSON, CSV, and image files.
- Check the `Content-Type` header on each response to see how Express advertises different MIME types.
- Adjust file extensions or add `res.type()` calls if any MIME type isn’t what you expect.
- **Note:** HTTP response headers (like `Content-Type`, `Content-Length`, or `Cache-Control`) describe metadata about the payload so clients know how to interpret and handle the data they receive.

<!-- LEVEL_START -->

## Level 10: Take Notes

- Capture screenshots of your Postman or browser dev tools views that show the different `Content-Type` headers.
- Jot down a short summary of what each header value indicates and where it came from (file extension vs. manual configuration).
- Consolidate the notes into a single document or README snippet so you can reference these MIME type examples later.

<!-- LEVEL_START -->

## Level 11: Create a JSON Route

Create a new route called "Happy Birthday" that returns JSON. Add a `GET /happy-birthday` route (or similar path) that returns a JSON object with:
- `name`: a person's name
- `age`: their age
- `greeting`: a birthday greeting message

Use `res.json()` to send the response. Test it in Postman to see the JSON formatted response.

Show Me: happy birthday JSON route

```js
app.get('/happy-birthday', (req, res) => {
  res.json({
    name: 'Alice',
    age: 25,
    greeting: 'Happy Birthday! 🎉'
  });
});
```

- Verify in Postman or your browser that the response body and `Content-Type: application/json` header are both correct.

<!-- LEVEL_START -->

## Level 12: Return Your Favorite JSON

- Create a new route (for example `GET /favorite`) that returns a JSON object similar to `{ "pokemon": "Bulbasaur", "height": 0.7, "weight": 6.9, "attacks": ["Vine Whip", "Seed Bomb", "Solar Beam"] }`.
- Add at least one nested property or array to demonstrate structured data.
- Verify in Postman or your browser that the response body and `Content-Type: application/json` header are both correct.

<!-- LEVEL_START -->

## Level 13: Mirror a Public API

Add two additional `GET` routes modeled after a public API of your choice. Aim to mirror the shape of real responses so clients can practice consuming them—the JSON doesn’t have to match exactly, or be as complex, just be close enough to capture the intent. Browse the [Public APIs collection](https://github.com/public-apis/public-apis) for inspiration and pick an endpoint whose fields look fun to reproduce.

<!-- LEVEL_START -->

## Level 14 (Challenge): Echo Workflow

- Add a `POST` endpoint that echoes or stores JSON you define so you can practice inspecting `req.body`.
- Wire up body parsing (e.g., `express.json()`) if you haven’t already to ensure the payload makes it to your handler.

<!-- LEVEL_START -->

## Level 15 (Challenge): Developer Feedback Loop

- Time yourself rebuilding the server from scratch to reinforce muscle memory.
<!-- LEVEL_START -->

## Level 16: Manage Data — Create and Persist

Lay the groundwork for working with data by breaking the classic CRUD flow into small, repeatable wins. Each level builds on the previous one so you can iterate confidently. Before we bring in a real SQL database like Supabase’s Postgres, we’ll keep data in simple in-memory arrays (declared as module-level globals) so you can focus on route behavior without worrying about persistence.

<!-- LEVEL_START -->

## Level 17: Sketch Your Data Shape

- Decide what kind of resource you’re modeling (e.g. `courses`, `books`).
- List the fields each record will contain and note any default values.
- Write a quick sample object so you have a reference when coding.
- Do NOT use `items` choose your own resource you'd like to use.

Show Me: sample data structure

```js
const sampleItem = {
  id: 1,
  title: 'Notebook',
  price: 4.99,
  tags: ['stationery', 'paper']
};
```

<!-- LEVEL_START -->

## Level 18: Seed In-Memory Data

- Create an in-memory array to hold a few starter records.
- Export it or keep it in the same module as your Express routes for now.
- Log the data at launch so you know what the initial state looks like.
- **Remember:** Use your own resource type (not `items`)—whether it's `books`, `courses`, `pets`, or something else you chose.

Show Me: seed in-memory data array

```js
const itemsStorage = [
  { id: 1, title: 'Notebook', price: 4.99, tags: ['stationery', 'paper'] },
  { id: 2, title: 'Mechanical Pencil', price: 2.49, tags: ['stationery'] }
];

console.log('Seeded items:', itemsStorage);
export default itemsStorage;
```

<!-- LEVEL_START -->

## Level 19: Build `GET /items`

- Add a route that returns the full list with status `200`.
- Include metadata if helpful (count, last updated) to practice shaping JSON responses.
- **Note:** Replace `/items` with your own resource path (e.g., `/books`, `/courses`, `/pets`).

<!-- LEVEL_START -->

## Level 20: Build `POST /items`

- Accept a JSON payload, append it to the in-memory list, and return status `201`.
- Return the newly created record so clients can confirm what was saved.
- **Important:** Use your own resource endpoint (e.g., `/books`, `/courses`) instead of `/items` in your routes.
- Use Postman (or a similar REST client) to send a `POST` request:
  1. Set the method to `POST` and the URL to `http://localhost:3000/items` (adjust port as needed).
  2. In the "Body" tab choose "raw" → "JSON" and paste a payload like `{ "title": "Notebook", "price": 4.99 }`.
  3. Send the request and confirm the response shows status `201` with the new record (including any generated `id`).

Show Me: POST route starter code

```js
// Make sure you have express.json() middleware set up first!
app.use(express.json());

app.post('/items', (req, res) => {
  // req.body contains the parsed JSON from the request
  const newItem = req.body;
  
  // Add to your storage array
  itemsStorage.push(newItem);
  
  // Return the created item with 201 status
  res.status(201).json(newItem);
});
```

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

<!-- LEVEL_START -->

## Level 21: Enforce Basic Validation

- Ensure required fields are present and short-circuit with `400` plus an error message when data is missing.
- Add default values or type checks as needed to keep the data structure consistent.
- **Reminder:** Validate fields appropriate for your resource type, not just the example `items` fields.

Show Me: validation check

```js
if (!req.body?.title) {
  return res.status(400).json({ error: 'Title is required' });
}
```

**Understanding the shorthand:** `!req.body?.title` uses two JavaScript features:
- **Optional chaining (`?.`)**: Safely accesses `title` even if `req.body` is `undefined` or `null`. Without `?`, accessing `req.body.title` when `req.body` is `undefined` would throw an error.
- **Logical NOT (`!`)**: Negates the value, so the condition is true when `title` is missing, empty string, `null`, `undefined`, `0`, or `false`.

This is equivalent to: `if (!req.body || !req.body.title)` but more concise and safer.

<!-- LEVEL_START -->

## Level 22: Generate Identifiers

- Assign a unique `id` to each new record (e.g., incrementing counter or `crypto.randomUUID()`).
- Return the `id` with both reads and creates so future levels can reference it.
- **Keep in mind:** You're working with your own resource type, so adapt variable names accordingly (not `itemsStorage`).

Show Me: generate unique identifier

```js
import { randomUUID } from 'node:crypto';
const newItem = { ...req.body, id: randomUUID() };
itemsStorage.push(newItem);
res.status(201).json(newItem);
```

<!-- LEVEL_START -->

## Level 23: Implement `GET /items/:id`

- Look up a record by `id` and return it with `200` when found.
- Respond with `404` and a friendly error JSON when the id is missing.
- **Don't forget:** Use your own resource path and variable names, not the example `items`.

Show Me: find item by id

```js
const item = itemsStorage.find((entry) => entry.id === req.params.id);
if (!item) return res.status(404).json({ error: 'Item not found' });
res.json(item);
```

<!-- LEVEL_START -->

## Level 24: Implement `DELETE /items/:id`

- Remove a record by `id` and return `200` when found.
- Use the `filter` pattern to create a new array without the deleted item. Replace the array with the filtered array. (See the "Show me" for more.)
- Respond with `404` and a friendly error JSON when the id is missing.
- **Remember:** Apply the filter pattern to your own resource array, not `itemsStorage`.

Show Me: complete DELETE route

```js
app.delete('/items/:id', (req, res) => {
  
  console.log("Deleting " + req.params.id)

  // Find the item first to check if it exists
  const item = itemsStorage.find((entry) => entry.id === req.params.id);
  
  // If not found, return 404
  if (!item) {
    return res.status(404).json({ error: 'Item not found' });
  }
  
  // TODO: Delete the item from your storage.
  
  
  // Return success response
  res.status(200).json({ message: 'Item deleted successfully' });
});
```

Show Me: delete using filter pattern

```js
const item = itemsStorage.find((entry) => entry.id === req.params.id);
if (!item) return res.status(404).json({ error: 'Item not found' });

// Use filter to create a new array without the deleted item
// The filter pattern keeps all items where id does NOT match
itemsStorage = itemsStorage.filter((entry) => entry.id !== req.params.id);
res.status(200).json({ message: 'Item deleted successfully' });
```

<!-- LEVEL_START -->

## Level 25: Add Request Logging

- Log method, path, and status code for each request to build observability habits.
- Consider logging the request body for `POST` (without leaking secrets). Drop the snippet into each route for now:
- **Note:** Log your actual resource routes (e.g., `/books`, `/courses`), not the example `/items`.

Show Me: request logging

```js
console.log('POST /items', req.body);
```

<!-- LEVEL_START -->

## Level 26 (Challenge): Persist to Disk

- Write your in-memory data out to a JSON file after each create.
- On server start, load the file back in so data survives restarts.
- **Important:** Name your JSON file after your resource (e.g., `books.json`, `courses.json`), not `items.json`.

Show Me: persist to disk

```js
import { readFileSync, writeFileSync } from 'node:fs';
const DATA_PATH = new URL('./items.json', import.meta.url);

let itemsStorage = JSON.parse(readFileSync(DATA_PATH, 'utf-8'));

function saveItems() {
  writeFileSync(DATA_PATH, JSON.stringify(itemsStorage, null, 2));
}
```

<!-- LEVEL_START -->

## Level 27 (Challenge): Manage Multiple Resources

- Introduce a second resource (for example `categories` or `customers`) with its own array and routes (`GET /categories`, `POST /categories`, etc.).
- Keep the code duplicated for now so you can observe what it takes to maintain two parallel sets of handlers.
- Decide how you’ll persist the second resource (another JSON file, or bundled together).

<!-- LEVEL_START -->

## Level 28 (Challenge): Refine Error Responses

- Centralize error handling so validation or lookup failures return consistent JSON (e.g., `{ "error": "message" }`).
- Document the possible errors in a short README snippet or inline comment.
- **Final reminder:** Make sure error messages reference your actual resource type, not generic "items".

<!-- LEVEL_START -->

## Level 29: Checkpoint — Confirm Core Behavior

### Objective

Run an Express checkpoint to ensure the API satisfies basic expectations.

### Requirements

1. Implement `GET /items` and `POST /items`.
2. Return `200` for reads, `201` for creates, and `400` or `404` when appropriate.

### Submission & Rubric

- Submit a Git repo link.
- Scoring (20 pts total):
  - Routes behave as described — 0–5
  - Status codes appropriate — 0–5
  - Project runs from README — 0–5
  - Code organization — 0–5

<!-- LEVEL_START -->

## Level 30: Harden — Validate and Handle Errors

### Goal

Add validation and consistent error handling to your API.

### What to Do

1. Validate incoming POST data and return `400` on bad input.
2. Centralize errors in a helper or middleware that responds with `{ "error": "message" }`.
3. Optional booster:
   - Add a timing log for each request.

<!-- LEVEL_START -->

## Level 31: Next Steps and Testing

- Keep refining your Express server as you introduce new features.
- Layer in automated testing with a lightweight runner like Vitest to lock in behavior as the code evolves [^1].
- Revisit logging, validation, and composition patterns to keep the API maintainable.

[^1]: Inspired by the progressive testing workflow outlined in the Vitest project guide [^vitest-guide].

[^vitest-guide]: [Vitest Project Guide](https://rmccrear.github.io/codex-lv3-may-2025/week8/function-practice/vitest-project-guide.md)

<!-- LEVEL_START -->

## Level 32: Test the Hello Express Route

Set up Vitest and Supertest to test your Express routes. Start with a simple test for your root route that serves HTML.

**Setup:**
1. Install testing dependencies: `npm install -D vitest supertest @vitest/coverage-v8`
2. Create a `tests` directory in the root of your project.
3. Export your Express app from `src/app.ts` (or `src/index.js`) so it can be imported in tests

Show Me: basic test setup and Hello Express test

```ts
// tests/routes/app.test.ts
import { describe, it, expect } from 'vitest';
import request from 'supertest';
import app from '../../src/app';

describe('Server Routes', () => {
  it('serves HTML from root route', async () => {
    const server = app.listen(0);
    const res = await request(server).get('/');
    server.close();
    expect(res.status).toBe(200);
    expect(res.text).toContain('<h1>Hello Express!</h1>');
    expect(res.headers['content-type']).toMatch(/html/);
  });
});
```

<!-- LEVEL_START -->

## Level 33: Test the Happy Birthday Route

Add a test for your Happy Birthday JSON route (Level 2.5). This tests a simple GET endpoint that returns JSON.

Show Me: Happy Birthday route test

```ts
it('returns JSON from Happy Birthday route', async () => {
  const server = app.listen(0);
  const res = await request(server).get('/happy-birthday');
  server.close();
  expect(res.status).toBe(200);
  expect(res.body).toHaveProperty('name');
  expect(res.body).toHaveProperty('age');
  expect(res.body).toHaveProperty('greeting');
  expect(res.headers['content-type']).toMatch(/json/);
});
```

<!-- LEVEL_START -->

## Level 34: Test a GET JSON Route

Add a test for one of your GET routes that returns JSON data (e.g., `GET /items` or your own resource route). Test that it returns an array and has the correct status code.

Show Me: GET JSON route test

```ts
it('returns seeded items array', async () => {
  const server = app.listen(0);
  const res = await request(server).get('/items');
  server.close();
  expect(res.status).toBe(200);
  expect(Array.isArray(res.body)).toBe(true);
  expect(res.headers['content-type']).toMatch(/json/);
});
```

<!-- LEVEL_START -->

## Level 35: Test a POST Route

Add a test for your POST route that creates a new record. Test that it returns status `201`, includes the created record, and generates an ID.

Show Me: POST route test

```ts
it('creates a new item', async () => {
  const server = app.listen(0);
  const response = await request(server)
    .post('/items')
    .send({ title: 'Test Notebook', price: 6.99 });
  server.close();
  expect(response.status).toBe(201);
  expect(response.body).toMatchObject({ title: 'Test Notebook', price: 6.99 });
  expect(response.body.id).toBeDefined();
});
```

<!-- LEVEL_START -->

## Level 36: Set Up Code Coverage

Configure code coverage reporting for your test suite. This helps you see which parts of your code are tested and which need more tests.

1. Install coverage dependency (if not already installed): `npm install -D @vitest/coverage-v8`
2. Add a coverage script to `package.json`

Show Me: coverage script setup

```json
{
  "scripts": {
    "test": "vitest",
    "test:coverage": "vitest run --coverage"
  }
}
```

3. Run `npm run test:coverage` to see your coverage report

<!-- LEVEL_START -->

## Level 37: Achieve 50% Code Coverage

Aim to achieve at least **50% code coverage** on your own. This means at least half of your code should be executed by your tests.

- Run `npm run test:coverage` to see your current coverage percentage
- Add tests for routes and edge cases you haven't covered yet
- Focus on testing:
  - All your GET routes
  - POST routes with valid and invalid data
  - Error cases (404, 400 validation errors)
  - DELETE operations

**Goal:** Reach at least 50% coverage across statements, branches, and functions. Getting 100% is often unrealistic, but 50-70% is a good target for most projects.



<!-- LEVEL_START -->

## Level 38: Deepen Coverage with Additional Tests

- Write at least three additional `GET`, `POST`, or `DELETE` tests that explore new scenarios (e.g., missing fields, duplicate records, alternate seed data, deleting non-existent items).
- Document what each test covers so classmates or future you can spot coverage gaps quickly.
- After each test, reset or reseed your in-memory arrays to keep the suite deterministic.

<!-- LEVEL_START -->

## Level 39 (Challenge): Bulletproof the Suite

- Expand coverage to include validation failures (Part 3.5), multi-resource scenarios (Part 3.11), DELETE operations using the filter pattern (Part 3.8), and error helpers (Part 4).
- Add at least three additional `GET`, `POST`, or `DELETE` test cases that explore different happy paths and failure modes.
- Run the suite with `npx vitest` (or `npm run test` if you wired the script) and ensure in-memory data is reset between tests so results stay deterministic.

<!-- LEVEL_START -->

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

Show Me: Render deployment configuration

```js
// src/index.js or src/app.js
import express from 'express';

const app = express();
const PORT = process.env.PORT || 3000;

// ... your routes ...

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
```

6. Deploy and test your live API endpoints using the URL Render provides (e.g., `https://your-app.onrender.com`)

**Success Criteria:**
- Your Express server is live and accessible via a public URL
- All your routes work correctly on the deployed server
- You can test your API using Postman or curl with the Render URL
