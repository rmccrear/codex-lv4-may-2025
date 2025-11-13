<!-- LEVEL_START -->

## Level 2: Kickoff — Start the Server

Focus on spinning up a minimal Express app and verifying that you can return JSON back to a client. This level should feel quick—you only need a root route and confidence that the server responds.

<!-- LEVEL_START -->

## Level 2.0: Serve HTML First

Now that you've tested with plain text, let's serve HTML from your root route. Update your route to use `res.send()` with an HTML snippet so you can see the browser render formatted content. For example, try sending `<h1>Hello Express!</h1><p>Your server is working!</p>` to see HTML rendering in action.

<!-- LEVEL_START -->

## Level 2.1: Set Up Postman for Testing

Download and install Postman (the desktop application, not the website) so you can test your localhost server. Postman allows you to send HTTP requests to `http://localhost:3000` and inspect responses.

**Option 1: Postman Desktop App (Recommended)**
- Download from [postman.com/downloads](https://www.postman.com/downloads/)
- Install the desktop application (not the web version)
- The desktop app can access `localhost` URLs

**Option 2: Postman Extension**
- Install the Postman extension for VS Code or your preferred browser
- Ensure it supports localhost connections

Once installed, you'll use Postman to test your API endpoints throughout this project. Make sure you can access `http://localhost:3000` before moving to the next level.

<!-- LEVEL_START -->

## Level 2.2: Serve Static Assets

Use `app.use(express.static('public'))` (or a directory name you prefer) so the server can return HTML, CSS, images, or other assets directly from disk. Seed the directory with a variety of files (`styles.css`, `sample.json`, `report.csv`, `logo.png`) and hit each one with your browser or Postman.

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

## Level 2.5: Create a JSON Route

Create a new route called "Happy Birthday" that returns JSON. Add a `GET /happy-birthday` route (or similar path) that returns a JSON object with:
- `name`: a person's name
- `age`: their age
- `greeting`: a birthday greeting message

Use `res.json()` to send the response. Test it in Postman to see the JSON formatted response.

Show Me: happy birthday JSON route

```js
app.get('/happy-birthday', (req, res) => {
  res.json({
    name: 'Alice',
    age: 25,
    greeting: 'Happy Birthday! 🎉'
  });
});
```

- Verify in Postman or your browser that the response body and `Content-Type: application/json` header are both correct.

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
