# **Level 4 – Backend Vocabulary**

## Week 1

---

### **API (Application Programming Interface)**

A set of rules that lets software systems communicate — your frontend sends requests, the API sends responses.

---

### **Back end (Backend)**

The behind-the-scenes code that handles data, business logic, databases, and APIs. Not visible to the user.

---

### **Deploy (Deployment)**

Publishing your app to a live server so anyone on the internet can access it.

---

### **DevOps (Development Operations)**

Tools and practices that automate building, testing, deploying, and monitoring software.

---

### **Express server**

A Node.js framework for building APIs and backend routes.

---

### **Full-stack app**

An application that includes both the frontend (UI) and backend (server/database).

---

### **JSON (JavaScript Object Notation)**

A lightweight data format for sending structured data over the web. Looks like JavaScript objects.

---

### **Local host (localhost)**

Your own computer acting as a server — usually accessed at `http://localhost:3000`.

---

### **Middleware**

Functions in an Express server that run *before* your route handler (e.g., parsing JSON, logging requests).

---

### **Port**

A numbered communication channel your server listens on (e.g., port 3000).

---

### **Static assets**

Files served as-is: images, CSS, JS bundles, fonts, etc.

---

### **URL (Uniform Resource Locator)**

The address of a resource on the web. Example: `https://example.com/api/users`.

---

### **Web server**

Software that listens for HTTP requests and responds with data or files.

---

## **HTTP & Networking Basics**

---

### **Body**

The data sent in an HTTP request or response (usually JSON for APIs).

---

### **Content type (MIME type)**

A header describing what kind of data is being sent, such as `application/json` or `text/html`.

---

### **HTTP Methods**

Actions clients can request from a server: GET, POST, PUT, DELETE, etc.

---

### **HTTP Headers**

Extra information added to a request or response (content type, cookies, auth tokens, etc.).

---

### **HTTP**

HyperText Transfer Protocol — the basic system browsers and servers use to communicate.

---

### **POST (Method)**

Used to send data to the server (creating something new).

---

### **GET (Method)**

Used to request data from the server (reading data).

---

### **Request**

The message the client sends to the server — includes method, headers, and optional body.

---

### **Request headers**

Small pieces of metadata the client sends with a request (tokens, content type, cookies).

---

### **Response**

The message the server sends back to the client — includes data, headers, and status code.

---

### **Response headers**

Metadata sent back with a response (content type, caching info, server type).

[📹 Video: Response Headers](https://youtu.be/iYM2zFP3Zn0?si=sKLamZzkjg-GBuhy&t=313)

---

### **Status codes (200, 404, 500, etc.)**

Numbers describing the result of a request: success (200), not found (404), server error (500).

---

## **Data Management & Security**

---

### **Cookie**

Small piece of data stored in the browser and sent with requests — used for sessions, auth, tracking.

---

### **Persist data**

Saving data so it remains after refresh or restart — usually in a database.

---

### **AWS (Amazon Web Services)**

A major cloud provider offering servers, storage, databases, backups, and deployment tools.

---

### **Build command**

A script that prepares your project for deployment — bundles files, optimizes code, outputs to `/dist`.

---

### **Binary file**

A non-text file stored as raw bytes (images, executables, audio, compiled code).

---

### **Bytes**

Smallest unit of digital data — 1 byte = 8 bits. Used to measure file size.

---

### **dist (distribution folder)**

Folder generated after building your project — contains the optimized files that get deployed.

---

### **index.js (Main script)**

The main entry file for a Node.js or Express app. Usually the first file your server runs.

---

### **Module type (module vs commonjs)**

Two ways Node organizes files:

* **module** → `import` / `export`
* **commonjs** → `require` / `module.exports`

---

### **File extension**

The suffix that tells the OS how to interpret a file (`.js`, `.json`, `.md`, `.png`).

---

### **UTF-8 (Unicode)**

A standard text encoding that supports almost every written language and emoji.

