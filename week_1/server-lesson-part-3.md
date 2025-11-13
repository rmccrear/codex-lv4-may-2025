---
title: Server Lesson Part 3
type: guide
week: 1
order: 103
section: Week 1
source_file: server-lesson-overview.md
---

<!-- LEVEL_START -->

## Level 3: Manage Data — Create and Persist

Lay the groundwork for working with data by breaking the classic CRUD flow into small, repeatable wins. Each level builds on the previous one so you can iterate confidently. Before we bring in a real SQL database like Supabase’s Postgres, we’ll keep data in simple in-memory arrays (declared as module-level globals) so you can focus on route behavior without worrying about persistence.

<!-- LEVEL_START -->

## Level 3.0: Sketch Your Data Shape

- Decide what kind of resource you’re modeling (e.g., `items`, `courses`, `books`).
- List the fields each record will contain and note any default values.
- Write a quick sample object so you have a reference when coding.

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

## Level 3.1: Seed In-Memory Data

- Create an in-memory array to hold a few starter records.
- Export it or keep it in the same module as your Express routes for now.
- Log the data at launch so you know what the initial state looks like.

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

## Level 3.2: Build `GET /items`

- Add a route that returns the full list with status `200`.
- Include metadata if helpful (count, last updated) to practice shaping JSON responses.

<!-- LEVEL_START -->

## Level 3.3: Validate Reads

- Confirm the route returns an empty array gracefully when no data exists.
- Set explicit headers (`Content-Type: application/json`) if your setup doesn’t already.

<!-- LEVEL_START -->

## Level 3.4: Build `POST /items`

- Accept a JSON payload, append it to the in-memory list, and return status `201`.
- Return the newly created record so clients can confirm what was saved.
- Use Postman (or a similar REST client) to send a `POST` request:
  1. Set the method to `POST` and the URL to `http://localhost:3000/items` (adjust port as needed).
  2. In the “Body” tab choose “raw” → “JSON” and paste a payload like `{ "title": "Notebook", "price": 4.99 }`.
  3. Send the request and confirm the response shows status `201` with the new record (including any generated `id`).

<!-- LEVEL_START -->

## Level 3.5: Enforce Basic Validation

- Ensure required fields are present and short-circuit with `400` plus an error message when data is missing.
- Add default values or type checks as needed to keep the data structure consistent.

Show Me: validation check

```js
if (!req.body?.title) {
  return res.status(400).json({ error: 'Title is required' });
}
```

<!-- LEVEL_START -->

## Level 3.6: Generate Identifiers

- Assign a unique `id` to each new record (e.g., incrementing counter or `crypto.randomUUID()`).
- Return the `id` with both reads and creates so future levels can reference it.

Show Me: generate unique identifier

```js
import { randomUUID } from 'node:crypto';
const newItem = { ...req.body, id: randomUUID() };
itemsStorage.push(newItem);
res.status(201).json(newItem);
```

<!-- LEVEL_START -->

## Level 3.7: Implement `GET /items/:id`

- Look up a record by `id` and return it with `200` when found.
- Respond with `404` and a friendly error JSON when the id is missing.

Show Me: find item by id

```js
const item = itemsStorage.find((entry) => entry.id === req.params.id);
if (!item) return res.status(404).json({ error: 'Item not found' });
res.json(item);
```

<!-- LEVEL_START -->

## Level 3.8: Implement `DELETE /items/:id`

- Remove a record by `id` and return `200` when found.
- Use the `filter` pattern to create a new array without the deleted item—this is the functional approach that avoids mutating arrays in place.
- Respond with `404` and a friendly error JSON when the id is missing.

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

## Level 3.9: Add Request Logging

- Log method, path, and status code for each request to build observability habits.
- Consider logging the request body for `POST` (without leaking secrets). Drop the snippet into each route for now:

Show Me: request logging

```js
console.log('POST /items', req.body);
```

<!-- LEVEL_START -->

## Level 3.10 (Challenge): Persist to Disk

- Write your in-memory data out to a JSON file after each create.
- On server start, load the file back in so data survives restarts.

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

## Level 3.11 (Challenge): Manage Multiple Resources

- Introduce a second resource (for example `categories` or `customers`) with its own array and routes (`GET /categories`, `POST /categories`, etc.).
- Keep the code duplicated for now so you can observe what it takes to maintain two parallel sets of handlers.
- Decide how you’ll persist the second resource (another JSON file, or bundled together).

<!-- LEVEL_START -->

## Level 3.12 (Challenge): Refine Error Responses

- Centralize error handling so validation or lookup failures return consistent JSON (e.g., `{ "error": "message" }`).
- Document the possible errors in a short README snippet or inline comment.

