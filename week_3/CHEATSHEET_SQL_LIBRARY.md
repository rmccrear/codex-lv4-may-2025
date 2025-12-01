# SQL Library Cheatsheet

Quick reference for common CRUD operations across raw SQL, Drizzle ORM, and Supabase Client.

---

## 1. Create (Insert)

- Scenario: Create a new user and get the created data back.

**SQL**

```sql
INSERT INTO users (name, email)
VALUES ('Alice', 'alice@test.com')
RETURNING *;
```

**Drizzle ORM (TypeScript)**

```ts
await db.insert(users)
  .values({ name: 'Alice', email: 'alice@test.com' })
  .returning();
```

**Supabase Client (TypeScript)**

```ts
const { data, error } = await supabase
  .from('users')
  .insert({ name: 'Alice', email: 'alice@test.com' })
  .select(); // Required to return the new row
```

---

## 2. Read (Select)

### A. Select All
- Scenario: Get all columns for all users.

**SQL**

```sql
SELECT * FROM users;
```

**Drizzle ORM (TypeScript)**

```ts
const allUsers = await db.select().from(users);
```

**Supabase Client (TypeScript)**

```ts
const { data } = await supabase.from('users').select('*');
```

### B. Select with Filter
- Scenario: Get `id` and `name` where email is 'alice@test.com'.

**SQL**

```sql
SELECT id, name FROM users WHERE email = 'alice@test.com';
```

**Drizzle ORM (TypeScript)**

```ts
// Requires: import { eq } from 'drizzle-orm'
await db
  .select({ id: users.id, name: users.name })
  .from(users)
  .where(eq(users.email, 'alice@test.com'));
```

**Supabase Client (TypeScript)**

```ts
const { data } = await supabase
  .from('users')
  .select('id, name')
  .eq('email', 'alice@test.com');
```

---

## 3. Update

- Scenario: Change Alice's name to "Al" where ID is 1.

**SQL**

```sql
UPDATE users SET name = 'Al' WHERE id = 1 RETURNING *;
```

**Drizzle ORM (TypeScript)**

```ts
await db.update(users)
  .set({ name: 'Al' })
  .where(eq(users.id, 1))
  .returning();
```

**Supabase Client (TypeScript)**

```ts
const { data } = await supabase
  .from('users')
  .update({ name: 'Al' })
  .eq('id', 1)
  .select();
```

---

## 4. Delete

- Scenario: Remove user with ID 1.

**SQL**

```sql
DELETE FROM users WHERE id = 1;
```

**Drizzle ORM (TypeScript)**

```ts
await db.delete(users).where(eq(users.id, 1));
```

**Supabase Client (TypeScript)**

```ts
await supabase.from('users').delete().eq('id', 1);
```

---

## Key Takeaways

- **Drizzle:** Verbose but strictly typed; import operators (`eq`, `gt`) instead of strings.
- **Supabase:** Method chaining style (`.eq()`, `.select()`).
- **Returning data:** Explicitly request returned rows (`.returning()` in Drizzle, `.select()` in Supabase).