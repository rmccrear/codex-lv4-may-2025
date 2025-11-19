```
╔═══════════════════════════════════════════════════════════════╗
║                                                               ║
║    ☁️   Deploy to DigitalOcean  ☁️                           ║
║                                                               ║
║    ┌─────────────────────────────────┐                       ║
║    │ $ ssh root@your-droplet-ip     │                       ║
║    │ $ nvm install node             │                       ║
║    │ $ git clone your-repo          │                       ║
║    │ $ npm install                  │                       ║
║    │ $ pm2 start app.js             │                       ║
║    └─────────────────────────────────┘                       ║
║                                                               ║
║           Get your app running in the cloud! 🚀            ║
║                                                               ║
╚═══════════════════════════════════════════════════════════════╝
```

# Deploy Your App to DigitalOcean

This guide will walk you through deploying your Node.js application to DigitalOcean. For a detailed video walkthrough, check out this tutorial: [DigitalOcean Deployment Tutorial](https://www.youtube.com/watch?v=SSLhGanxmCg)

## Quick Start Guide

### 1. Create a Droplet

- Log into your DigitalOcean account
- Click "Create" → "Droplets"
- Choose an Ubuntu image (latest LTS version)
- Select a basic plan (the $6/month option is great for getting started)
- Choose a datacenter region
- Click "Create Droplet"

### 2. Access the Console

- Once your droplet is created, you'll receive an IP address and a root password
- You can access the console via:
  - **Web Console**: Click on your droplet → "Access" → "Launch Droplet Console"
  - **SSH**: Use `ssh root@your-droplet-ip` from your terminal

### 3. Install Node.js via NVM

Once you're in the console, install Node Version Manager (nvm) and Node.js:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
nvm install node
nvm use node
```

Verify the installation:
```bash
node --version
npm --version
```

### 4. Clone Your Project

Move to `/var/www` directory - this is the conventional location for web applications on Linux servers:

```bash
cd /var/www
```

Clone your project repository:

```bash
git clone https://github.com/your-username/your-repo.git
cd your-repo
npm install
```

### 5. Run and Test Your Project

Start your application:

```bash
npm run start
```

Test that it's working by visiting `http://your-droplet-ip:PORT` in your browser.

### 6. Set Environment Variables

Set your environment variables, including the `PORT`. See the [Environment Variables Guide](environment-variables.md) for details.

You can set them temporarily:
```bash
export PORT=3000
export DATABASE_URL=your-database-url
export API_KEY=your-api-key
```

Or add them to `~/.bashrc` for persistence:
```bash
echo 'export PORT=3000' >> ~/.bashrc
echo 'export DATABASE_URL=your-database-url' >> ~/.bashrc
source ~/.bashrc
```

Or use a `.env` file with the `dotenv` package in your project.

### 7. Use PM2 to Keep Your App Running

**Important**: Stop your current process (Ctrl+C) and follow the video tutorial to set up PM2. This will keep your app running even after you log out.

Install PM2:
```bash
npm install -g pm2
```

Start your app with PM2:
```bash
pm2 start app.js --name my-app
```

PM2 commands you'll need:
- `pm2 list` - View running processes
- `pm2 stop my-app` - Stop your app
- `pm2 restart my-app` - Restart your app
- `pm2 logs my-app` - View logs
- `pm2 startup` - Set PM2 to start on system boot
- `pm2 save` - Save current process list

Watch the [video tutorial](https://www.youtube.com/watch?v=SSLhGanxmCg) for detailed PM2 setup instructions!

### 8. Bonus: Add a Domain

Once your app is running, you can add a custom domain:
- Point your domain's DNS to your droplet's IP address
- Follow the video for advanced domain configuration with Nginx
- Consider using a reverse proxy (like Nginx) for production setups

## Student Resources

- **Get $200 in DigitalOcean Credits**: [DigitalOcean for GitHub Students](https://www.digitalocean.com/github-students)
- **Get a Free Domain**: [Namecheap for GitHub Students](https://nc.me/landing/github) or [Name.com for GitHub Students](https://www.name.com/partner/github-students)

