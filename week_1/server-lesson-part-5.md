---
title: Server Lesson Part 5
type: guide
week: 1
order: 105
section: Week 1
source_file: server-lesson-overview.md
---

<!-- LEVEL_START -->

## Level 7: Test the Routes You Just Built

With your Express features split across Parts 1–4, it’s time to wrap them in automated tests. Use Vitest and Supertest to exercise the exact behaviors you practiced: text responses, static assets/JSON endpoints, and data persistence.

### Sample App Export (`src/app.ts`)

Adapt your project so the Express instance can be imported directly into tests:

Show Me: sample Express app for testing

```ts
// src/app.ts
import express from 'express';
import { randomUUID } from 'node:crypto';
import itemsStorage from './items.js'; // your in-memory array from Part 3

const app = express();
app.use(express.json());

app.get('/', (req, res) => {
  res.type('text').send('Hello Express');
});

app.get('/items', (req, res) => {
  res.status(200).json(itemsStorage);
});

app.post('/items', (req, res) => {
  const newItem = { id: randomUUID(), ...req.body };
  itemsStorage.push(newItem);
  res.status(201).json(newItem);
});

app.get('/items/:id', (req, res) => {
  const item = itemsStorage.find((entry) => entry.id === req.params.id);
  if (!item) return res.status(404).json({ error: 'Item not found' });
  res.json(item);
});

app.delete('/items/:id', (req, res) => {
  const item = itemsStorage.find((entry) => entry.id === req.params.id);
  if (!item) return res.status(404).json({ error: 'Item not found' });
  
  // Use filter to create a new array without the deleted item
  // The filter pattern keeps all items where id does NOT match
  itemsStorage = itemsStorage.filter((entry) => entry.id !== req.params.id);
  res.status(200).json({ message: 'Item deleted successfully' });
});

export default app;
```

### Vitest + Supertest Checklist (`tests/routes/app.test.ts`)

Show Me: test suite example

```ts
// tests/routes/app.test.ts
import { describe, it, expect } from 'vitest';
import request from 'supertest';
import app from '../../src/app';

describe('Server Lesson Regression', () => {
  it('serves the text/HTML landing route (Part 2.0)', async () => {
    const server = app.listen(0);
    const res = await request(server).get('/');
    server.close();
    expect(res.status).toBe(200);
    expect(res.text).toContain('Hello');
    expect(res.headers['content-type']).toMatch(/text/);
  });

  it('returns seeded items (Part 3.2)', async () => {
    const server = app.listen(0);
    const res = await request(server).get('/items');
    server.close();
    expect(res.status).toBe(200);
    expect(Array.isArray(res.body)).toBe(true);
  });

  it('creates a new item and echoes it back (Part 3.4–3.6)', async () => {
    const server = app.listen(0);
    const response = await request(server)
      .post('/items')
      .send({ title: 'Hello Kitty Notebook', price: 6.99 });
    server.close();
    expect(response.status).toBe(201);
    expect(response.body).toMatchObject({ title: 'Notebook', price: 4.99 });
    expect(response.body.id).toBeDefined();
  });

  it('responds 404 for missing ids (Part 3.7)', async () => {
    const server = app.listen(0);
    const res = await request(server).get('/items/not-real');
    server.close();
    expect(res.status).toBe(404);
    expect(res.body.error).toMatch(/not found/i);
  });

  it('deletes an item using filter pattern (Part 3.8)', async () => {
    const server = app.listen(0);
    // First create an item to delete
    const createRes = await request(server)
      .post('/items')
      .send({ title: 'Test Item', price: 9.99 });
    const itemId = createRes.body.id;
    
    // Then delete it
    const deleteRes = await request(server).delete(`/items/${itemId}`);
    server.close();
    expect(deleteRes.status).toBe(200);
    expect(deleteRes.body.message).toMatch(/deleted successfully/i);
  });
});
```



<!-- LEVEL_START -->

## Level 8: Deepen Coverage with Three New Tests

- Write at least three additional `GET`, `POST`, or `DELETE` tests that explore new scenarios (e.g., missing fields, duplicate records, alternate seed data, deleting non-existent items).
- Document what each test covers so classmates or future you can spot coverage gaps quickly.
- After each test, reset or reseed your in-memory arrays to keep the suite deterministic.



<!-- LEVEL_START -->

## Level 9 (Challenge): Bulletproof the Suite

- Expand coverage to include validation failures (Part 3.5), multi-resource scenarios (Part 3.11), DELETE operations using the filter pattern (Part 3.8), and error helpers (Part 4).
- Add at least three additional `GET`, `POST`, or `DELETE` test cases that explore different happy paths and failure modes.
- Run the suite with `npx vitest` (or `npm run test` if you wired the script) and ensure in-memory data is reset between tests so results stay deterministic.

<!-- LEVEL_START -->

## Level 10 (Challenge): Measure Coverage with Istanbul

- Install `vitest`’s coverage peer dependency (`npm install -D @vitest/coverage-v8`) to enable Istanbul/V8 reporting.
- Add a coverage script to `package.json`, for example:

Show Me: coverage script

```json
{
  "scripts": {
    "test:coverage": "vitest run --coverage"
  }
}
```
- Run `npm run test:coverage` and inspect statements/branches/functions metrics. Set a small goal (e.g., 30%+) and iterate on tests until you hit it. Getting 100% is often an unrealistic goal, but over getting 50%-70% is usually desirable for a project.
