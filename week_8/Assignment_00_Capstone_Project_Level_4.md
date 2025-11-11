---
title: Capstone Project - Level 4
type: assignment
week: 8
order: 0
section: 'Week 8 '
source_file: week8/assign_3993.md
due_date: FRI 17:59
allow_submissions_from: WED 22:00
max_grade: 100
---

# Capstone Project - Level 4

[← Back to Week 8 ](README.md) / [← Course Index](../../README.md)

---

You’ll build a **small full-stack web app** and present it on Friday in an interview-style session. You are **not graded on theme or visuals**. Focus on **getting your stack wired up** and **showing one working user flow** from front to back.

* * *

## What you are building

  * A **React frontend** on **Netlify**
  * An **Express API** on **Render**
  * A **Supabase** database with at least one table
  * A short, working demo that shows how data moves from **frontend - > backend -> database**

This project is about **functionality and clarity** , not design.

* * *

## Minimum requirements (build checklist)

Make sure your project includes all of the following:

  * **Live frontend** on Netlify and **live API** on Render.
  * **Public GitHub repo** (or mono-repo with client/server folders).
  * **Supabase database** with at least one working table.
  * At least **two API routes** that read/write data from Supabase.
  * One **React page** that fetches and displays data from your API.
  * One **form or button** that creates or updates data in Supabase.
  * Basic **error handling** (display a friendly message if something fails).
  * **README** with setup instructions, live links, and short architecture notes.

> Optional: simple auth using Supabase or JWT. Not required to pass.

* * *

## Friday presentation (10–12 minutes total)

  1. **Live demo** (≈2 min) Show your working flow: how data moves from UI -> API -> DB -> back.
  2. **Code walkthrough** (≈3–4 min) Open one React file and one Express route; explain how they connect.
  3. **Q &A** (≈2–3 min) Be ready to explain your API endpoints and data structure.
  4. **Live coding** (≈3–4 min, no AI) A short Level-4 task chosen by your instructor.

* * *

## Live-coding demonstration (what to expect)

You’ll perform one small coding task related to this course, such as:

  * Creating a **new API route** that returns or filters data from Supabase.
  * Adding a **POST** or **PATCH** endpoint with basic validation.
  * Writing a **React function** to fetch and render a list from the API.
  * Showing how you handle **loading and error states**.
  * Explaining a **database query** and how it connects to your endpoint.

Keep it small, clear, and testable.

* * *

## What to submit

  * **Frontend URL (Netlify)**
  * **API URL (Render)**
  * **Repo URL (GitHub)**
  * **README** that includes:
    * One-paragraph product description (what it does and why).
    * Quick setup instructions for both client and server.
    * Architecture overview:
      * How React calls the API
      * How the API calls Supabase
      * Table name(s) and fields
    * `.env.example` showing needed keys (no real secrets).

* * *

## Student rubric (100 points)

**1) Live coding - 50 pts**

  * Correct, runnable code (0–10)
  * Clear understanding of API and database flow (0–10)
  * Handles a simple edge case or validation (0–10)
  * Idiomatic JS and organized logic (0–10)
  * Explains thinking clearly while coding (0–10)

**2) Code explanation - 30 pts**

  * Clear architecture (frontend -> backend -> DB) (0–10)
  * Explains how data is fetched and updated (0–10)
  * Understands auth, keys, or config basics (0–10)

**3) Presentation & professionalism - 20 pts**

  * Live demo works and is shown first (0–5)
  * Clear communication and timing (0–5)
  * Organized repo and README (0–5)
  * Confident handling of Q&A (0–5)

**Total:** __/100

* * *

## Tips for success

  * Keep it **small and stable**. One clean flow > several unfinished ones.
  * **Test your deployment early** (Render and Netlify often need minor config fixes).
  * Use **environment variables** for Supabase keys; don’t hardcode them.
  * Make sure you can **run a full demo without editing code**.
  * **Practice your demo** : show the live app, then the key files.
  * Have **your .env.example** ready so the instructor can clone and test it.