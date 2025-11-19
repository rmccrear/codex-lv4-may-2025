# Week 3: Supabase Integration - Level Plan

Students have completed the Server Mini-Project with in-memory CRUD operations. This week introduces Supabase as a real database to replace in-memory storage.

---

## Level Titles

**(Informative Only) Understanding CRUD Operations** - Learn what CRUD stands for (Create, Read, Update, Delete) and how these operations map to HTTP methods (POST, GET, PATCH/PUT, DELETE). Understand how CRUD operations relate to database interactions and RESTful API design. See examples of each operation in action.
**Level 1:** Set Up Supabase Account and Project  
**(Informative Only) Understanding Database Schemas** - Learn what a database schema is, how to plan table structures, and see examples with games, food products, and employees. Discuss common data types (text, numbers, dates, booleans) and how to structure your data before creating tables.  
**Level 2:** Create Your First Table in SQL Editor  
**Level 3:** Define Table Schema with Columns  
**Level 4:** Set Up Environment Variables (SUPABASE_URL and SUPABASE_ANON_KEY)  
**Level 5:** Install Supabase JavaScript Client  
**Level 6:** Initialize Supabase Client in Your Express Server  
**Level 7:** Format Data for Database Insertion  
**Level 8:** Insert Data Using Supabase SQL Editor  
**Level 9:** Verify Data in Supabase Table Editor  
**Level 10:** Write Your First SELECT Query in supabase editor
**(Informative Only) Understanding Backends and Secret Protection** - Learn what a backend is and how it differs from frontend code. Understand why backends exist to serve data and protect secrets like API keys, database credentials, and authentication tokens. Learn why sensitive information must stay on the server and never be exposed in client-side code.
**Level 11:** Implement GET /items to Fetch All Rows  
**Level 12:** Handle Success Response with 200 Status  
**Level 13:** Test Your API with Postman (VSCode Extension or App)  
**Level 14:** Test GET /items/:id with Postman  
**Level 15:** Implement GET /items/:id with Route Parameters  
**Level 16:** Return 404 When Item Not Found  
**Level 17:** Test POST /items with Postman  
**Level 18:** Implement POST /items Endpoint  
**Level 19:** Validate POST Request Body  
**Level 20:** Insert New Row Using Supabase Client  
**Level 21:** Return 201 Status with Created Item  
**Level 22:** Test Create and Read Workflow Together  
**Level 23:** Test PATCH /items/:id with Postman  
**Level 24:** Implement PATCH /items/:id to Update Rows  
**Level 25:** Return 404 When Item Not Found for PATCH  
**Level 26:** Test DELETE /items/:id with Postman  
**Level 27:** Implement DELETE /items/:id and Return 204 Status  
**Level 28:** Return 404 When Item Not Found for DELETE  
**Level 29:** Handle Errors with 500 Status and JSON Error Body  
**Level 30:** Review and Reflect - Review all the concepts you've learned this week: CRUD operations, database schemas, Supabase integration, backend security, and full-stack API development. Reflect on how you've transitioned from in-memory storage to a persistent database with proper error handling. Consider what you've accomplished and how these skills apply to real-world applications.
**Level 31 (Challenge):** Fetch Data from an External API - Create an endpoint that fetches data from an external API (e.g., a public REST API) and returns the data to the client. Handle the fetch request using Node's built-in fetch, and return the response with appropriate status codes.
**Level 32 (Challenge):** Transform API Data - Rename Fields - Fetch data from an external API and transform the structure by renaming fields in the response before returning the data to the client.
**Level 33 (Challenge):** Practice Using Array Methods like map() to Reshape Object Properties - Fetch data from an external API and practice using the map() method to reshape object properties before returning the data to the client.

---

## Learning Progression Summary

**Setup (Levels 1-4):** Supabase account, project creation, table setup, environment configuration  
**Client Setup (Levels 5-6):** Installing and initializing Supabase JavaScript client  
**Data Seeding (Levels 7-9):** Formatting and inserting sample data from code.org  
**Read Operations (Levels 10-12):** Querying data, implementing GET endpoints with success responses  
**API Testing Introduction (Level 13):** Learn to test your API with Postman (VSCode extension or app)  
**Read by ID (Levels 14-16):** Test GET /items/:id, implement route, and handle 404 errors  
**Create Operations (Levels 17-22):** Test POST /items, implement endpoint, validation, and test workflow  
**Update Operations (Levels 23-25):** Test PATCH /items/:id, implement update endpoint, and handle 404 errors  
**Delete Operations (Levels 26-28):** Test DELETE /items/:id, implement delete endpoint, and handle 404 errors  
**Error Handling (Level 29):** Handling 500 errors with JSON error body  
**Review and Reflect (Level 30):** Review concepts learned, reflect on the transition from in-memory storage to persistent database storage  
**API Integration Challenge (Level 31):** Fetch data from external APIs and return it to clients  
**API Transformation Challenge (Level 32):** Rename fields in API responses before returning to clients  
**API Transformation Challenge (Level 33):** Practice using map() to reshape object properties in API responses before returning to clients

Each level builds on the previous one, moving from in-memory storage to persistent database storage.
