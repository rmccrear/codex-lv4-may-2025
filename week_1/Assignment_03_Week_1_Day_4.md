---
title: Week 1 - Day 4
type: assignment
week: 1
order: 3
section: Week 1
source_file: week1/assign_3961.md
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