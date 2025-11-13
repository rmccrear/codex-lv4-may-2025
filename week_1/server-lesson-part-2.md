---
title: Server Lesson Part 2
type: guide
week: 1
order: 102
section: Week 1
source_file: server-lesson-overview.md
---

<!-- LEVEL_START -->

## Level 2: Kickoff — Start the Server

Focus on spinning up a minimal Express app and verifying that you can return JSON back to a client. This level should feel quick—you only need a root route and confidence that the server responds.

<!-- LEVEL_START -->

## Level 2.0: Serve Text First

Kick things off by returning a simple text or HTML response from your root route so you can confirm Express is listening. Use `res.send('Hello')` or send a small HTML snippet to see the browser render content.

<!-- LEVEL_START -->

## Level 2.1: Ship the Root Route

Start by initializing an Express app and wiring up a root route (`GET /`) that returns JSON. Keep the payload small but descriptive so you can confirm your server responds as expected.

<!-- LEVEL_START -->

## Level 2.2: Serve Static Assets

Use `app.use(express.static('public'))` (or a directory name you prefer) so the server can return HTML, CSS, images, or other assets directly from disk. Seed the directory with a variety of files (`index.html`, `styles.css`, `sample.json`, `report.csv`, `logo.png`) and hit each one with your browser or Postman.

<!-- LEVEL_START -->

## Level 2.3: Inspect MIME Types

- Use Postman, cURL, or your browser dev tools to download the static assets you just exposed.
- Record the `Content-Type` header that comes back for HTML, CSS, JSON, CSV, and image files.
- Check the `Content-Type` header on each response to see how Express advertises different MIME types.
- Adjust file extensions or add `res.type()` calls if any MIME type isn’t what you expect.
- **Note:** HTTP response headers (like `Content-Type`, `Content-Length`, or `Cache-Control`) describe metadata about the payload so clients know how to interpret and handle the data they receive.

<!-- LEVEL_START -->

## Level 2.4: Take Notes

- Capture screenshots of your Postman or browser dev tools views that show the different `Content-Type` headers.
- Jot down a short summary of what each header value indicates and where it came from (file extension vs. manual configuration).
- Consolidate the notes into a single document or README snippet so you can reference these MIME type examples later.

<!-- LEVEL_START -->

## Level 2.5: Most APIs Speak JSON

- Reflect on how many Express projects focus on serving and consuming JSON payloads instead of HTML pages.
- Make a quick list of client types (single-page apps, mobile apps, other services) that depend on consistent JSON responses.
- Note how this informs your route design, validation, and versioning choices.

<!-- LEVEL_START -->

## Level 2.6: Return Your Favorite JSON

- Create a new route (for example `GET /favorite`) that returns a JSON object similar to `{ "pokemon": "Bulbasaur", "height": 0.7, "weight": 6.9, "attacks": ["Vine Whip", "Seed Bomb", "Solar Beam"] }`.
- Add at least one nested property or array to demonstrate structured data.
- Verify in Postman or your browser that the response body and `Content-Type: application/json` header are both correct.

<!-- LEVEL_START -->

## Level 2.7: Mirror a Public API

Add two additional `GET` routes modeled after a public API of your choice. Aim to mirror the shape of real responses so clients can practice consuming them—the JSON doesn’t have to match exactly, or be as complex, just be close enough to capture the intent. Browse the [Public APIs collection](https://github.com/public-apis/public-apis) for inspiration and pick an endpoint whose fields look fun to reproduce.

<!-- LEVEL_START -->

## Level 2.8 (Challenge): Echo Workflow

- Add a `POST` endpoint that echoes or stores JSON you define so you can practice inspecting `req.body`.
- Wire up body parsing (e.g., `express.json()`) if you haven’t already to ensure the payload makes it to your handler.

<!-- LEVEL_START -->

## Level 2.9 (Challenge): Developer Feedback Loop

- Time yourself rebuilding the server from scratch to reinforce muscle memory.
- Introduce a workflow helper such as `nodemon`, `npm run dev`, or a REST client (Insomnia, Postman, VS Code REST) to speed feedback loops and repeat the timed run. For example, add this to `package.json`:

Show Me: npm dev script

```json
{
  "scripts": {
    "dev": "nodemon src/index.js"
  }
}
```

<!-- LEVEL_START -->

## Level 2.10 (Challenge): Stress Test Your Routes

- Use your tool of choice (REST client, small script, or browser tabs) to hit your JSON endpoints in rapid succession.
- Observe logs and confirm status codes stay correct even under quick successive requests.
- Jot down any performance or ergonomics tweaks you might explore next.

