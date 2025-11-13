<!-- LEVEL_START -->

## Level 7: Test the Hello Express Route

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

## Level 8: Test the Happy Birthday Route

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

## Level 9: Test a GET JSON Route

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

## Level 10: Test a POST Route

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

## Level 11: Set Up Code Coverage

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

## Level 12: Achieve 50% Code Coverage

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

## Level 13: Deepen Coverage with Additional Tests

- Write at least three additional `GET`, `POST`, or `DELETE` tests that explore new scenarios (e.g., missing fields, duplicate records, alternate seed data, deleting non-existent items).
- Document what each test covers so classmates or future you can spot coverage gaps quickly.
- After each test, reset or reseed your in-memory arrays to keep the suite deterministic.

<!-- LEVEL_START -->

## Level 14 (Challenge): Bulletproof the Suite

- Expand coverage to include validation failures (Part 3.5), multi-resource scenarios (Part 3.11), DELETE operations using the filter pattern (Part 3.8), and error helpers (Part 4).
- Add at least three additional `GET`, `POST`, or `DELETE` test cases that explore different happy paths and failure modes.
- Run the suite with `npx vitest` (or `npm run test` if you wired the script) and ensure in-memory data is reset between tests so results stay deterministic.
