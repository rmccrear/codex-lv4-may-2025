---
title: RESTful Express API with CRUD Operations (graded)
type: assignment
week: 1
order: 1
section: Week 1
source_file: week1/assign_3962.md
due_date: SUN 20:00
allow_submissions_from: SUN 20:00
grading_due_date: SUN 20:00
max_grade: 100
moodle_course_id: 75
cmid: '3997'
moodle_cmid: '3997'
---

# RESTful Express API with CRUD Operations (graded)

[← Back to Week 1](README.md) / [← Course Index](../../README.md)

---

## Overview

Build a RESTful Express API that implements core CRUD operations using in-memory data storage. This project consolidates everything you've learned about Express routes, HTTP status codes, JSON responses, and error handling.

### What You'll Build

- **Core CRUD Operations**: Implement `GET /items`, `POST /items`, and either `GET /items/:id` or `DELETE /items/:id`
- **Error Handling**: Return appropriate status codes (200, 201, 400, 404) with consistent JSON error responses
- **Data Management**: Use in-memory arrays with unique IDs generated using `crypto.randomUUID()`
- **Code Organization**: Clean, well-structured Express application with proper error handling
- **Documentation**: Complete README with setup instructions and API documentation

**⚠️ Important:** Choose your own resource name (e.g., `cats`, `baseball-cards`, `videos`, `books`) instead of using "items" throughout your project.

### Get Started

👉 **[View Complete Project Guide: Server Mini-Project](server-mini-project.md)**

The full project guide includes detailed requirements, step-by-step phases, helpful resources, and a complete checklist to ensure your submission is complete.

#### Rubric (100 pts)

- **Chosen operations work** (0-25 pts)
  - All implemented routes function correctly
  - Data persists during server session
  - IDs are generated and used properly

- **Errors and statuses consistent** (0-25 pts)
  - Correct HTTP status codes (200, 201, 400, 404)
  - Consistent JSON error format
  - Appropriate error messages

- **Project runs from README** (0-25 pts)
  - Clear setup instructions
  - Dependencies install correctly
  - Server starts without errors

- **Code organization** (0-25 pts)
  - Clean, readable code structure
  - Proper use of Express patterns
  - Meaningful naming conventions
  - Helpful comments