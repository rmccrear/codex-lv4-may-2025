# SQL Setup & Initialization Cheatsheet

Packages to install and boilerplate to get connections running in Node.js.

---

## Prerequisites: Environment Variables (`.env`)

Before writing code, set your connection strings.

```bash
# For Pure SQL & Drizzle
DATABASE_URL="postgresql://user:password@host:5432/dbname"

# For Supabase Client
SUPABASE_URL="https://xyz.supabase.co"
SUPABASE_SERVICE_ROLE_KEY="eyJhbGciOiJIUzI1Ni..." # server-side only
```

---

## 1. Pure SQL (using `pg`)

The standard, no-frills driver for Postgres in Node.js.

### Installation

```bash
npm install pg
npm install -D @types/pg
```

### Setup Code (`db.ts`)

```ts
import { Pool } from 'pg';

// Use a Pool for server apps to manage connections efficiently
export const db = new Pool({
  connectionString: process.env.DATABASE_URL,
  max: 20, // Max clients in the pool
  idleTimeoutMillis: 30000,
});
```

---

## 2. Drizzle ORM

Drizzle runs on top of a driver. Here we use `pg`; `postgres.js` is also popular.

### Installation

```bash
npm install drizzle-orm pg
npm install -D drizzle-kit @types/pg
```

### Setup Code (`db.ts`)

```ts
import { drizzle } from 'drizzle-orm/node-postgres';
import { Pool } from 'pg';
// Import your schema to get type inference
import * as schema from './schema';

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

// Pass the schema to get strictly typed query results
export const db = drizzle(pool, { schema });
```

---

## 3. Supabase Client

For server-side usage, initialize with the Service Role Key to bypass RLS.

### Installation

```bash
npm install @supabase/supabase-js
```

### Setup Code (`supabase.ts`)

```ts
import { createClient } from '@supabase/supabase-js';
import { Database } from './types/supabase'; // Generated via Supabase CLI

const supabaseUrl = process.env.SUPABASE_URL!;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY!;

// Initialize with Service Role for Admin access
export const supabase = createClient<Database>(supabaseUrl, supabaseKey, {
  auth: {
    autoRefreshToken: false, // Not needed for server-side admin tasks
    persistSession: false,   // Do not save sessions on the server
  },
});
```