# Week 1 - Day 1

[← Back to Week 1](README.md) / [← Course Index](../../README.md)

---

#### Goal

Start an Express server and return JSON from two GET routes that imitate a public API.

#### Steps

  1. Stand up Express and add a root route that returns JSON.
  2. Pick any public API and model two GET route responses after it.
  3. Extra practice if you want
     * add one POST that returns JSON you define
     * time yourself rebuilding the server from scratch
     * try a tool that speeds your workflow (nodemon or a REST client)

---

# Week 1 - Day 4

[← Back to Week 1](README.md) / [← Course Index](../../README.md)

---

#### Goal

Add validation and consistent errors

#### Steps

  1. Validate incoming data for POST and return 400 on bad input.
  2. Centralize errors in a helper or middleware that returns { "error": "message" }.
  3. Extra practice if you want
     * add a timing log for each request

---

# Week 1 - Day 2

[← Back to Week 1](README.md) / [← Course Index](../../README.md)

---

#### Goal

Add a small resource and handle reads and writes.

#### Steps

  1. Create a data source in your project and return a list from GET /items.
  2. Accept a payload on POST /items and add it to the list. Return 201 on create.
  3. Extra practice if you want
     * GET /items/:id with 404 when not found
     * a logger that prints method and path

---

# Week 1 - Day 4-5 Mini-Project

[← Back to Week 1](README.md) / [← Course Index](../../README.md)

---

#### Objective

Express checkpoint

#### Requirements

  1. Implement GET /items and POST /items.
  2. Use 200 for reads, 201 for create, and 400 or 404 when appropriate.

#### Submission

Git repo link

#### Rubric (20 pts)

  * Routes behave as described 0–5
  * Status codes appropriate 0–5
  * Project runs from README 0–5
  * Code organization 0–5

