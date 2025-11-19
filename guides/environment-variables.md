```
╔═══════════════════════════════════════════════════════════════╗
║                                                               ║
║    🌍  Environment Variables  🌍                             ║
║                                                               ║
║    ┌─────────────────────────────────┐                       ║
║    │ $ export PORT=3000              │                       ║
║    │ $ export API_KEY=secret123      │                       ║
║    │ $ echo $PORT                    │                       ║
║    │ 3000                            │                       ║
║    └─────────────────────────────────┘                       ║
║                                                               ║
║         Your app's secret configuration storage! 🎯          ║
║                                                               ║
╚═══════════════════════════════════════════════════════════════╝
```

# All About Environment Variables

Environment variables are configuration values stored outside of your code that can be accessed by your application at runtime. They're useful for keeping sensitive information (like API keys) out of your codebase and for configuring your app differently across environments (development, staging, production).

## Basic Usage

### Setting a Variable

Set an environment variable in your terminal:

```bash
PORT=3000
```

### Exporting a Variable

The `export` command makes the variable available to child processes:

```bash
export PORT=3000
```

This sets the variable for the current session and any processes started from that session.

### Viewing a Variable

Use `echo` to display the value of an environment variable:

```bash
echo $PORT
```

## Persistent Configuration

### Shell Configuration Files

To make environment variables persistent across terminal sessions, add them to your shell configuration file:

- **Bash**: `~/.bashrc`
- **Zsh**: `~/.zshrc`

Add a line like:
```bash
export PORT=3000
```

Then restart your terminal or run `source ~/.bashrc` (or `source ~/.zshrc`) to reload the configuration.

### Project-Specific Files

For project-specific environment variables, use `.env.local` (or `.env`):

In `.env.local` or `.env` for your project.

```bash
PORT=3000
DATABASE_URL=postgresql://localhost:5432/mydb
API_KEY=your-secret-key
```

Then use a package like `dotenv` in Node.js to load these variables automatically.

## Video Resource

For a more in-depth explanation, check out this video: [Environment Variables Explained](https://www.youtube.com/watch?v=aKghi0hI1OA)

## Example: Express App with PORT

Here's a simple Express application that uses the `PORT` environment variable:

```javascript
const express = require('express');
const app = express();

const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
```

### Running the App

To run this app with a custom port, set the `PORT` variable before starting the server:

```bash
PORT=8080 node app.js
```

**Note:** This will set the `PORT` environment variable only for this specific command because we did not use `export`. After the command finishes, the variable won't persist in your terminal session. If you wanted it to persist, you would need to use `export PORT=8080` first.

The server will start on port 8080. If no `PORT` is set, it defaults to 3000.

