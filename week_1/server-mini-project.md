---
title: Server Mini-Project: CRUD API in Memory
type: assignment
week: 1
order: 4
section: Week 1
source_file: server-mini-project.md
---

# Server Mini-Project: CRUD API in Memory

Build a RESTful Express API that implements core CRUD operations using in-memory data storage. This project consolidates everything you've learned about Express routes, HTTP status codes, JSON responses, and error handling.

**Focus on just ONE resource** for this project—choose something you're interested in like `cats`, `baseball-cards`, `videos`, or any other single collection. This keeps the scope manageable while you master the fundamentals.

---

## 📚 Instructions

**📖 Start Here:** Review the server lesson guides (Parts 1-5) to understand Express fundamentals, route handling, and testing patterns.

**⚠️ Important:** Please change "items" to a resource of your choosing throughout this project. Examples: `cats`, `baseball-cards`, `videos`, `books`, `pokemon`, or any other collection you're interested in. This makes your API more personal and helps you think about real-world use cases.

**Additional Resources:**
- [Express.js Documentation](https://expressjs.com/)
- [HTTP Status Codes Reference](https://http.cat/)
- [MDN HTTP Methods Guide](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Methods)
- [MDN MIME Types Guide](https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/MIME_types)

---

## ✅ Requirements

Your Express API must include:

1. **Core CRUD Operations**
   - `GET /items` - Return all items (status 200)
   - `POST /items` - Create a new item (status 201)
   - `GET /items/:id` OR `DELETE /items/:id` - Retrieve or remove a specific item
   - Proper JSON responses for all endpoints
   - *Note: Replace "items" with your chosen resource name (e.g., `/cats`, `/baseball-cards`, `/videos`)*

2. **Error Handling**
   - Return `404` with JSON error body when item not found: `{ "error": "message" }`
   - Return `400` with JSON error body for invalid input
   - Consistent error response format across all endpoints

3. **Data Management**
   - Use in-memory array to store items
   - Generate unique IDs for each item (use `crypto.randomUUID()`)
   - Seed initial data with at least 2-3 sample items

4. **Code Organization**
   - Export Express app for testing
   - Clean, readable code structure
   - Meaningful variable and function names
   - Comments explaining key sections

5. **Testing (Optional but Recommended)**
   - Set up Vitest with Supertest
   - Write at least 3 test cases covering happy paths and error cases
   - Run tests with `npm run test`

6. **Documentation**
   - README.md with setup instructions
   - Description of endpoints and their behaviors
   - Example requests/responses
   - List of technologies used

---

## 🎓 Deliverable

**Submit:** GitHub repository URL containing:
- All source code organized in proper structure
- Express app with CRUD routes
- `package.json` with dependencies
- `README.md` with:
  - Project description
  - Setup instructions (`npm install`, `npm run dev`)
  - API endpoint documentation
  - Example requests using Postman or cURL
  - Testing instructions (if tests included)
- Clear Git commit history (commit after each milestone)

**Before submitting, verify:**
- [ ] App runs with `npm run dev` without errors
- [ ] All required CRUD operations implemented
- [ ] Status codes are appropriate (200, 201, 400, 404)
- [ ] Error responses use consistent JSON format
- [ ] README is complete with all sections
- [ ] Code is clean and commented
- [ ] Tests pass (if included)

---

## 📝 Project Phases

**Phase 1: Setup & Basic Routes**
- Initialize Express project
- Set up `express.json()` middleware
- Choose your resource name (e.g., `cats`, `baseball-cards`, `videos`) and replace "items" throughout
- Create in-memory data array with seed data
- Implement `GET /items` route

**Phase 2: Create Operation**
- Implement `POST /items` route
- Add validation for required fields
- Generate unique IDs for new items
- Return 201 status with created item

**Phase 3: Read/Delete by ID**
- Choose either `GET /items/:id` or `DELETE /items/:id`
- Implement route parameter handling
- Add 404 error handling for missing items
- Return appropriate status codes

**Phase 4: Error Handling & Polish**
- Centralize error responses
- Add validation for POST requests
- Test all endpoints with Postman
- Write README documentation

**Phase 5: Testing (Optional)**
- Set up Vitest and Supertest
- Write tests for each endpoint
- Test both success and error cases
- Run coverage report

---

## 🆘 Need Help?

- Review the server lesson guides (Parts 1-5)
- Check Express documentation for route examples
- Use Postman to test your endpoints
- Use `console.log()` to debug request/response data
- Post questions in the discussion forum

---

## 📊 Rubric (100 pts)

- **Chosen operations work** (0-25 pts)
  - All implemented routes function correctly
  - Data persists during server session
  - IDs are generated and used properly

- **Errors and statuses consistent** (0-25 pts)
  - Correct HTTP status codes (200, 201, 400, 404)
  - Consistent JSON error format
  - Appropriate error messages

- **Project runs from README** (0-25 pts)
  - Clear setup instructions
  - Dependencies install correctly
  - Server starts without errors

- **Code organization** (0-25 pts)
  - Clean, readable code structure
  - Proper use of Express patterns
  - Meaningful naming conventions
  - Helpful comments

---

**Good luck building your API!** 🚀✨

---

*This mini-project consolidates concepts from Week 1 server lessons and prepares you for database integration in future weeks.*

