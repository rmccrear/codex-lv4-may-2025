---
title: Server Lesson Part 4
type: guide
week: 1
order: 104
section: Week 1
source_file: server-lesson-overview.md
---

<!-- LEVEL_START -->

## Level 4: Checkpoint — Confirm Core Behavior

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

## Level 5: Harden — Validate and Handle Errors

### Goal

Add validation and consistent error handling to your API.

### What to Do

1. Validate incoming POST data and return `400` on bad input.
2. Centralize errors in a helper or middleware that responds with `{ "error": "message" }`.
3. Optional booster:
   - Add a timing log for each request.

<!-- LEVEL_START -->

## Level 6: Next Steps and Testing

- Keep refining your Express server as you introduce new features.
- Layer in automated testing with a lightweight runner like Vitest to lock in behavior as the code evolves [^1].
- Revisit logging, validation, and composition patterns to keep the API maintainable.

[^1]: Inspired by the progressive testing workflow outlined in the Vitest project guide [^vitest-guide].

[^vitest-guide]: [Vitest Project Guide](https://rmccrear.github.io/codex-lv3-may-2025/week8/function-practice/vitest-project-guide.md)

