---
title: Badge Interview Week 6
type: assignment
week: 6
order: 4
section: 'Week 6 '
source_file: week6/assign_3987.md
due_date: SAT 20:00
allow_submissions_from: SAT 20:00
grading_due_date: SAT 20:00
max_grade: 100
---

# Badge Interview Week 6

[← Back to Week 6 ](README.md) / [← Course Index](../../README.md)

---

#### Objective

Interview on a JSON API built with Lambda and API Gateway.

#### Requirements

  1. Live session with a TA or instructor.
  2. Open your deployed API URL and the linked Lambda in the console.
  3. Send a request with the required query parameter (for example, ?name=alice) and show a 200 response with JSON.
  4. Send a request without the parameter and show a 400 response with a JSON error message.
  5. Explain where the handler reads the query parameter, how status codes are set, and how API Gateway is configured for the route.

#### Live tasks (perform one or two as requested)

  * Modify the request to use a different parameter value and verify the JSON output updates.
  * Trigger the missing-parameter path and confirm the 400 behavior and error body.
  * Add a quick log statement and show it in CloudWatch logs.
  * Point to the exact endpoint path and required parameter in your README.

#### Submission

Git repo link and API URL.

#### Rubric (20 pts)

  * Lambda and API work end to end 0-5
  * Error handling present 0-5
  * Project runs from README 0-5
  * Configuration clarity 0-5