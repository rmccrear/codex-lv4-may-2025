Level Navigation: [1](./server-lesson-lv-1.md) | [2](./server-lesson-lv-2.md) | [3](./server-lesson-lv-3.md) | [(4ℹ️)](./server-lesson-lv-4.md) | **5** | [6](./server-lesson-lv-6.md) | [7](./server-lesson-lv-7.md) | [8](./server-lesson-lv-8.md) | [9](./server-lesson-lv-9.md) | [10](./server-lesson-lv-10.md) | [11](./server-lesson-lv-11.md) | [12](./server-lesson-lv-12.md) | [13](./server-lesson-lv-13.md) | [14⚡](./server-lesson-lv-14.md) | [15⚡](./server-lesson-lv-15.md) | [16](./server-lesson-lv-16.md) | [17](./server-lesson-lv-17.md) | [18](./server-lesson-lv-18.md) | [19](./server-lesson-lv-19.md) | [20](./server-lesson-lv-20.md) | [21](./server-lesson-lv-21.md) | [22](./server-lesson-lv-22.md) | [23](./server-lesson-lv-23.md) | [24](./server-lesson-lv-24.md) | [25](./server-lesson-lv-25.md) | [26⚡](./server-lesson-lv-26.md) | [27⚡](./server-lesson-lv-27.md) | [28⚡](./server-lesson-lv-28.md) | [29](./server-lesson-lv-29.md) | [30](./server-lesson-lv-30.md) | [31](./server-lesson-lv-31.md) | [32](./server-lesson-lv-32.md) | [33](./server-lesson-lv-33.md) | [34](./server-lesson-lv-34.md) | [35](./server-lesson-lv-35.md) | [36](./server-lesson-lv-36.md) | [37](./server-lesson-lv-37.md) | [38](./server-lesson-lv-38.md) | [39⚡](./server-lesson-lv-39.md) | [40⚡](./server-lesson-lv-40.md)

## Level 5: Kickoff — Start the Server

Focus on spinning up a minimal Express app and verifying that you can return JSON back to a client. This level should feel quick—you only need a root route and confidence that the server responds.

### Understanding Node.js Runtime and Development Tools

Before starting your server, it's helpful to understand the tools you'll use to run your Node.js application:

#### `node` vs `nodemon`

**`node`** is the Node.js runtime itself—the program that executes JavaScript files:
- Run a file directly: `node src/index.js`
- Starts your server once
- If you make code changes, you must manually stop and restart the server (Ctrl+C, then run again)

**`nodemon`** is a development tool that wraps `node` with automatic restarts:
- Watches your files for changes
- Automatically restarts the server when you save changes
- Saves time during development—no need to manually restart after each edit
- Not for production—use `node` instead

**Example:**
```bash
# Using node directly (manual restart required)
node src/index.js

# Using nodemon (auto-restart on file changes)
nodemon src/index.js
```

#### `npm run start` vs `npm run dev`

These are npm scripts defined in your `package.json`. The difference depends on what each script does:

**`npm run start`** (Production/Standard):
- Typically runs your server with `node` (production mode)
- Example: `"start": "node src/index.js"`
- Server runs once; requires manual restart for changes
- Use when you want stable, one-time execution

**`npm run dev`** (Development):
- Typically runs your server with `nodemon` (development mode)
- Example: `"dev": "nodemon src/index.js"`
- Server auto-restarts on file changes
- Use during development for faster iteration

**Why have both?**
- **Development**: Use `npm run dev` for auto-restart convenience while coding
- **Production**: Use `npm run start` for stable, predictable server execution
- **Team Consistency**: Everyone uses the same commands regardless of their setup

**Check your `package.json`:**
```json
{
  "scripts": {
    "start": "node src/index.js",
    "dev": "nodemon src/index.js"
  }
}
```

### Quick Start

1. **Start your server:**
   ```bash
   npm run dev
   ```

2. **Verify it's running:**
   - Look for a message like "Server running on http://localhost:3000"
   - Try accessing `http://localhost:3000` in your browser

3. **Test auto-restart (if using `dev`):**
   - Make a small change to your code (e.g., change a message)
   - Save the file
   - Watch the terminal—nodemon should automatically restart the server

4. **Check your root route:**
   - Visit `http://localhost:3000` in your browser
   - You should see a JSON response or your configured response