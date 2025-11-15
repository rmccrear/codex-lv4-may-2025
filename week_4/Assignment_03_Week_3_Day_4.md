---
title: Week 4 - Day 4
type: assignment
week: 4
order: 3
section: Week 4
source_file: week3/assign_3971.md
---

# Week 4 - Day 4

[← Back to Week 4](README.md) / [← Course Index](../../README.md)

---

#### Goal

Guard one route and add logs

#### Steps

  1. Add a header-based guard that checks x-api-key for one protected route.
  2. Add a request logger that prints method, path, and elapsed ms.
  3. Extra practice if you want
     * return a clear 401 JSON object on failure