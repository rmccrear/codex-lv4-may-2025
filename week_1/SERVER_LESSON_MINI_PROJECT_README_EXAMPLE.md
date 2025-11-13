# CRUD API in Memory

A RESTful Express API that implements core CRUD operations using in-memory data storage. This project demonstrates Express route handling, HTTP status codes, JSON responses, and error handling patterns.

## 🚀 Technologies Used

- **Node.js** - JavaScript runtime
- **Express.js** - Web framework for Node.js
- **Vitest** - Testing framework (optional)
- **Supertest** - HTTP assertion library (optional)

## 📋 Prerequisites

- Node.js (v18 or higher)
- npm (v9 or higher)
- Postman or similar REST client (for testing)

## 🛠️ Setup Instructions

1. **Clone or download this repository**

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Start the development server**
   ```bash
   npm run dev
   ```
   
   The server will start on `http://localhost:3000` (or the port specified in your code).

4. **Run tests (if included)**
   ```bash
   npm run test
   ```

## 📚 API Endpoints

### Base URL
```
http://localhost:3000
```

### Endpoints

#### GET /cats
Returns all cats in the collection.

**Response:** `200 OK`
```json
[
  {
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "name": "Fluffy",
    "breed": "Persian",
    "age": 3
  },
  {
    "id": "550e8400-e29b-41d4-a716-446655440001",
    "name": "Whiskers",
    "breed": "Siamese",
    "age": 5
  }
]
```

#### POST /cats
Creates a new cat in the collection.

**Request Body:**
```json
{
  "name": "Mittens",
  "breed": "Maine Coon",
  "age": 2
}
```

**Response:** `201 Created`
```json
{
  "id": "550e8400-e29b-41d4-a716-446655440002",
  "name": "Mittens",
  "breed": "Maine Coon",
  "age": 2
}
```

#### GET /cats/:id
Retrieves a specific cat by ID.

**Response:** `200 OK`
```json
{
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "name": "Fluffy",
  "breed": "Persian",
  "age": 3
}
```

**Error Response:** `404 Not Found`
```json
{
  "error": "Cat not found"
}
```

#### DELETE /cats/:id
Removes a specific cat from the collection.

**Response:** `200 OK`
```json
{
  "message": "Cat deleted successfully"
}
```

**Error Response:** `404 Not Found`
```json
{
  "error": "Cat not found"
}
```

## 🧪 Example Requests

### Using cURL

**GET all cats:**
```bash
curl http://localhost:3000/cats
```

**POST a new cat:**
```bash
curl -X POST http://localhost:3000/cats \
  -H "Content-Type: application/json" \
  -d '{"name": "Mittens", "breed": "Maine Coon", "age": 2}'
```

**GET a specific cat:**
```bash
curl http://localhost:3000/cats/550e8400-e29b-41d4-a716-446655440000
```

**DELETE a cat:**
```bash
curl -X DELETE http://localhost:3000/cats/550e8400-e29b-41d4-a716-446655440000
```

### Using Postman

1. **GET Request:**
   - Method: `GET`
   - URL: `http://localhost:3000/cats`
   - Headers: None required

2. **POST Request:**
   - Method: `POST`
   - URL: `http://localhost:3000/cats`
   - Headers: `Content-Type: application/json`
   - Body (raw JSON):
     ```json
     {
       "name": "Mittens",
       "breed": "Maine Coon",
       "age": 2
     }
     ```

3. **GET by ID:**
   - Method: `GET`
   - URL: `http://localhost:3000/cats/:id`
   - Replace `:id` with an actual ID from your collection

4. **DELETE:**
   - Method: `DELETE`
   - URL: `http://localhost:3000/cats/:id`
   - Replace `:id` with an actual ID from your collection

## ⚠️ Error Responses

All error responses follow a consistent format:

**400 Bad Request** (Invalid input):
```json
{
  "error": "Name is required"
}
```

**404 Not Found** (Resource doesn't exist):
```json
{
  "error": "Cat not found"
}
```

## 🧪 Testing

If you've included tests in your project:

**Run all tests:**
```bash
npm run test
```

**Run tests in watch mode:**
```bash
npm run test -- --watch
```

**Run tests with coverage:**
```bash
npm run test:coverage
```

## 📁 Project Structure

```
.
├── src/
│   ├── app.js          # Express app setup
│   └── data.js         # In-memory data array
├── tests/
│   └── routes/
│       └── cats.test.js # Test file (optional)
├── package.json
├── README.md
└── .gitignore
```

## 🎯 Features

- ✅ CRUD operations (Create, Read, Update/Delete)
- ✅ In-memory data storage
- ✅ Unique ID generation using `crypto.randomUUID()`
- ✅ Consistent error handling
- ✅ Proper HTTP status codes
- ✅ JSON request/response format
- ✅ Input validation

## 📝 Notes

- Data is stored in memory and will be lost when the server restarts
- This is a learning project demonstrating Express fundamentals
- In production, you would use a database (like PostgreSQL) for persistent storage

## 🤝 Contributing

This is a learning project. Feel free to fork and experiment!

## 📄 License

This project is for educational purposes.

---

**Built as part of Week 1 Server Lessons**



