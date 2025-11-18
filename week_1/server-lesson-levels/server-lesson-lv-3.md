Level Navigation: [1](./server-lesson-lv-1.md) | [2](./server-lesson-lv-2.md) | **3** | [(4ℹ️)](./server-lesson-lv-4.md) | [5](./server-lesson-lv-5.md) | [6](./server-lesson-lv-6.md) | [7](./server-lesson-lv-7.md) | [8](./server-lesson-lv-8.md) | [9](./server-lesson-lv-9.md) | [10](./server-lesson-lv-10.md) | [11](./server-lesson-lv-11.md) | [12](./server-lesson-lv-12.md) | [13](./server-lesson-lv-13.md) | [14⚡](./server-lesson-lv-14.md) | [15⚡](./server-lesson-lv-15.md) | [(16ℹ️)](./server-lesson-lv-16.md) | [17](./server-lesson-lv-17.md) | [18](./server-lesson-lv-18.md) | [19](./server-lesson-lv-19.md) | [20](./server-lesson-lv-20.md) | [21](./server-lesson-lv-21.md) | [22](./server-lesson-lv-22.md) | [23](./server-lesson-lv-23.md) | [24](./server-lesson-lv-24.md) | [25](./server-lesson-lv-25.md) | [26⚡](./server-lesson-lv-26.md) | [27⚡](./server-lesson-lv-27.md) | [28⚡](./server-lesson-lv-28.md) | [29](./server-lesson-lv-29.md) | [30](./server-lesson-lv-30.md) | [31](./server-lesson-lv-31.md) | [32](./server-lesson-lv-32.md) | [33](./server-lesson-lv-33.md) | [34](./server-lesson-lv-34.md) | [35](./server-lesson-lv-35.md) | [36](./server-lesson-lv-36.md) | [37](./server-lesson-lv-37.md) | [38](./server-lesson-lv-38.md) | [39⚡](./server-lesson-lv-39.md) | [40⚡](./server-lesson-lv-40.md)

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