# Kata 21: Simple Fruit API with Express Routes

**Concept:** Separating routes into modules in an Express app

In earlier katas, we’ve worked with Express apps where all routes lived in a single file. Now let’s refactor that pattern by moving routes into a dedicated router file.

This kata introduces:

* `express.Router()`
* Splitting routes into separate files
* Returning JSON data from a GET endpoint

---

## Challenge

Create a simple Express app with **two files**:

1. `index.js` – sets up the Express server
2. `routes/fruits.js` – defines a single GET route

The `/fruits` route should:

* Respond to a `GET` request
* Return an array of fruit objects as JSON

Example fruit objects:

```js
{ name: 'Apple', color: 'red' }
```

---

## Expected Output

When you visit:

```
http://localhost:3000/fruits
```

You should see JSON like:

```json
[
  { "name": "Apple", "color": "red" },
  { "name": "Banana", "color": "yellow" },
  { "name": "Orange", "color": "orange" },
  { "name": "Grape", "color": "purple" }
]
```

---

## Starter Code

### `index.js`

```js
import express from 'express';
import fruitsRouter from './routes/fruits.js';

const app = express();
const PORT = 3000;

// Mount the fruits router here

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
```

---

### `routes/fruits.js`

```js
import express from 'express';

const router = express.Router();

// Add a GET route here

export default router;
```

---

## Hints

* Use `express.Router()` to create a router
* The route should respond with `res.json(...)`
* Mount the router in `index.js` using `app.use('/fruits', ...)`
* Keep the fruit data as a simple array inside the route file

---

## Solution

<details>
<summary>Click to reveal solution</summary>
<div>
`index.js`
</div>

<pre class="highlight">
import express from 'express';
import fruitsRouter from './routes/fruits.js';

const app = express();
const PORT = 3000;

app.use('/fruits', fruitsRouter);

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
</pre>

---

<p>
  `routes/fruits.js`
</p>
<pre class="highlight">
import express from 'express';

const router = express.Router();

router.get('/', (req, res) => {
  const fruits = [
    { name: 'Apple', color: 'red' },
    { name: 'Banana', color: 'yellow' },
    { name: 'Orange', color: 'orange' },
    { name: 'Grape', color: 'purple' }
  ];

  res.json(fruits);
});

export default router;
</pre>

</details>

---

## Concept Review

* `express.Router()` lets you group related routes together
* Separating routes keeps `index.js` clean and readable
* Mounting a router with `app.use('/fruits', router)` prefixes all routes
* Returning JSON with `res.json()` is the standard pattern for APIs
* This structure scales naturally as your app adds more routes

---

**← [Back to Kata Index](./)**
