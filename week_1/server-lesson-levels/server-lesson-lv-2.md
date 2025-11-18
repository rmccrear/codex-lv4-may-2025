Level Navigation: [1](./server-lesson-lv-1.md) | **2** | [3](./server-lesson-lv-3.md) | [(4ℹ️)](./server-lesson-lv-4.md) | [5](./server-lesson-lv-5.md) | [6](./server-lesson-lv-6.md) | [7](./server-lesson-lv-7.md) | [8](./server-lesson-lv-8.md) | [9](./server-lesson-lv-9.md) | [10](./server-lesson-lv-10.md) | [11](./server-lesson-lv-11.md) | [12](./server-lesson-lv-12.md) | [13](./server-lesson-lv-13.md) | [14⚡](./server-lesson-lv-14.md) | [15⚡](./server-lesson-lv-15.md) | [(16ℹ️)](./server-lesson-lv-16.md) | [17](./server-lesson-lv-17.md) | [18](./server-lesson-lv-18.md) | [19](./server-lesson-lv-19.md) | [20](./server-lesson-lv-20.md) | [21](./server-lesson-lv-21.md) | [22](./server-lesson-lv-22.md) | [23](./server-lesson-lv-23.md) | [24](./server-lesson-lv-24.md) | [25](./server-lesson-lv-25.md) | [26⚡](./server-lesson-lv-26.md) | [27⚡](./server-lesson-lv-27.md) | [28⚡](./server-lesson-lv-28.md) | [29](./server-lesson-lv-29.md) | [30](./server-lesson-lv-30.md) | [31](./server-lesson-lv-31.md) | [32](./server-lesson-lv-32.md) | [33](./server-lesson-lv-33.md) | [34](./server-lesson-lv-34.md) | [35](./server-lesson-lv-35.md) | [36](./server-lesson-lv-36.md) | [37](./server-lesson-lv-37.md) | [38](./server-lesson-lv-38.md) | [39⚡](./server-lesson-lv-39.md) | [40⚡](./server-lesson-lv-40.md)

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