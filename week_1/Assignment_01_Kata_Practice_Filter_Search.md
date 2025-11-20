---
title: 'Kata Practice (suggested: Fetch Pokemon)'
type: assignment
week: 1
order: 1
section: Week 1
moodle_course_id: 75
max_grade: 100
cmid: '4002'
moodle_cmid: '4002'
completion_conditions: 'Make a submission'
allow_submissions_from: "MON"
due_date: "2025-11-30T21:59:00"
cutoff_date: "2025-12-07T21:59:00"
---

# Kata Practice (suggested: Fetch Pokemon)

[← Back to Week 1](README.md) / [← Course Index](../../README.md)

---

## Overview

Practice your React and JavaScript skills by completing any kata from the kata collection. **We suggest Kata 12: Fetch and Display Pokemon**, which focuses on promises with the fetch API and data transformation. However, you may choose any kata that interests you or challenges your current skill level.

## Instructions

### Step 1: Choose and Complete a Kata

1. **Choose a kata** from the [kata collection](https://rmccrear.github.io/codex-lv4-may-2025/kata/README.html). We suggest starting with **[Kata 12: Fetch and Display Pokemon](https://rmccrear.github.io/codex-lv4-may-2025/kata/kata-12-fetch-pokemon.html)** if you're unsure which to pick.

2. **Read the kata instructions** for your chosen kata.

3. **Practice the kata** using CodeSandbox or your local development environment:
   - Follow the requirements specified in your chosen kata
   - Implement the solution according to the kata's instructions
   - Test your solution thoroughly

4. **If you choose Kata 12 (Fetch Pokemon), key requirements:**
   - Create a `PokemonDisplay` component
   - Use `useState` to store a simplified pokemon object
   - Use `useEffect` to fetch a pokemon when the component loads
   - Fetch from: `https://pokeapi.co/api/v2/pokemon/pikachu`
   - Transform the pokemon data to a simpler object: `{ name, height, weight, imgUrl }`
   - Use a callback function defined **outside** the component in the `.then()` chain
   - Display the pokemon's **name**, **weight**, **height**, and **image**

### Step 2: Prepare for Presentation

Practice your kata solution so you can **present it live** during Week 2. You will demonstrate:
- Your working solution
- How your solution works (the logic/approach you used)
- Your code implementation

**Note:** No recording is required—this will be a live presentation.

## Submission

Submit a link to your CodeSandbox or GitHub repository with your completed kata solution.

---

**💡 Tip:** If you choose Kata 12 (Fetch Pokemon), focus on understanding promises, the fetch API, and how to transform complex API responses into simpler objects your component needs. This will help you understand async operations and data transformation patterns. For other katas, focus on the core concepts and patterns they teach.


