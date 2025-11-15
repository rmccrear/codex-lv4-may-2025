<!-- LEVEL_START -->

## Level 1: Why Build an Express Server?

Over this week you will grow a simple Express project into a well-structured API. Each level maps to a daily assignment, building confidence as you layer on new responsibilities for your routes.

### Project Setup

Before diving into the concepts, let's set up your Express project:

1. **Initialize your project:**
   ```bash
   npm init -y
   ```

2. **Install Express and development dependencies:**
   ```bash
   npm install express
   npm install --save-dev nodemon
   ```
   
   **📖 References:**
   - [Express.js Documentation](https://expressjs.com/)
   - [Express Hello World Example](https://expressjs.com/en/starter/hello-world.html)

<!-- LEVEL_START -->

## Level 2: Configure Package.json

3. **Add a dev script to `package.json`:**
   
   Show Me: npm scripts with nodemon and node
   
   ```json
   {
     "type": "module",
     "scripts": {
       "start": "node src/index.js",
       "dev": "nodemon src/index.js"
     }
   }
   ```
   
   **Understanding the scripts:**
   - **`npm start`**: Runs your server with Node.js. Use this for production or when you want to run the server once.
   - **`npm run dev`**: Runs your server with `nodemon`, which automatically restarts the server whenever you save changes to your files. This speeds up your development workflow—no need to manually stop and restart the server after each code change.
   
   **ES6 Modules (`"type": "module"`):**
   - Setting `"type": "module"` in `package.json` enables ES6 module syntax throughout your project.
   - Use `import` and `export` instead of CommonJS `require()` and `module.exports`:
     ```js
     // ES6 Modules (with "type": "module")
     import express from 'express';
     export default app;
     
     // CommonJS (without "type": "module")
     const express = require('express');
     module.exports = app;
     ```
   - ES6 modules are the modern standard and provide better static analysis and tree-shaking capabilities.

<!-- LEVEL_START -->

## Level 3: Create Your First Express Server

4. **Create your project structure:**
   - Create a `src` directory
   - Create `src/index.js` as your main server file
   
   Show Me: starter Express server code
   
   ```js
   // src/index.js
   import express from 'express';
   
   const app = express();
   const port = 3000;
   
   app.get('/', (req, res) => {
     res.send('Hello World!');
   });
   
   app.listen(port, () => {
     console.log(`Server listening on port ${port}`);
   });
   ```
   
   **See:** [Express Hello World Example](https://expressjs.com/en/starter/hello-world.html) for a minimal Express app example.

Now you're ready to start building your Express server!

### Try It!

Test your server setup:

1. **Start the development server:**
   ```bash
   npm run dev
   ```
   - The server should start and display "Server listening on port 3000"
   - Open `http://localhost:3000` in your browser
   - You should see "Hello World!" displayed
   - Try making a change to `src/index.js` (like changing the message) and save—nodemon will automatically restart the server!

2. **Stop the server** (press `Ctrl+C` in your terminal)

3. **Start the production server:**
   ```bash
   npm start
   ```
   - The server starts the same way, but without auto-restart
   - Make a change to your code and save—notice the server doesn't restart automatically
   - Stop the server again (`Ctrl+C`)

**💡 Tip:** Use `npm run dev` during development for the auto-restart feature, and `npm start` when you want to test the production behavior.

<!-- LEVEL_START -->

<!-- INFORMATIVE_ONLY -->

## Level 2: Understanding HTTP Fundamentals

At the core sits the web server: a program that listens for incoming HTTP requests, processes them, and sends back responses. Requests are structured messages that include a verb (like `GET` or `POST`), a path, headers, and optionally a body [^mdn-methods]. The server examines those pieces, decides what work to perform, and then constructs a response containing a status line, headers, and a body.

Status codes communicate the outcome of each request—`200` means "OK", `201` indicates a resource was created, `400` flags invalid input, and `500` signals something went wrong on the server. Matching the right status to each scenario helps clients understand what happened without reading the full payload, and resources like [http.cat](https://http.cat/) make the full catalog easy (and fun) to scan.

The response body can take many forms, but two you'll use often are HTML and JSON. HTML (`text/html`) is perfect for returning full web pages that a browser can render. JSON (`application/json`) shines when you want to send structured data to another program or frontend. These formats are part of the broader MIME (Multipurpose Internet Mail Extensions) type system, which labels response payloads so clients know how to parse them [^mdn-mime]. Choosing the correct MIME type—communicated through the `Content-Type` header—is critical for interoperability as your API evolves.

[^mdn-mime]: [Media types (MIME types) — MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/MIME_types)
[^mdn-methods]: [HTTP request methods — MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Methods)

