---
title: Badge Interview Week 3
type: assignment
week: 3
order: 5
section: Week 3
source_file: week2/assign_3967.md
due_date: SAT 20:00
allow_submissions_from: SAT 20:00
grading_due_date: SAT 20:00
max_grade: 100
---

# Badge Interview Week 3

[← Back to Week 3](README.md) / [← Course Index](../../README.md)

---

#### Objective

Interview on creating and listing items with Supabase.

#### Requirements

  1. Live session with a TA or instructor.
  2. Run your server locally or show the deployed endpoint.
  3. Show POST /items inserting a row using the Supabase client (env vars only, no secrets in code).
  4. Show GET /items returning rows including the newly inserted item.
  5. Explain where the Supabase client is initialized and which environment variables are required.

#### Live tasks (perform one or two as requested)

  * Insert another item and verify it appears in the GET /items response.
  * Show the exact env vars you use (for example SUPABASE_URL and a server key) and how they are loaded.
  * Trigger and handle an insert error (missing field or bad type) and return a clear JSON error.

#### Submission

Git repo link. Include a README with run steps and the env var names required.

#### Rubric (20 pts)

  * POST inserts through Supabase 0-5
  * GET lists through Supabase 0-5
  * Project runs from README 0-5
  * Code organization 0-5