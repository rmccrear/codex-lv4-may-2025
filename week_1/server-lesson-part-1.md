---
title: Server Lesson Part 1
type: guide
week: 1
order: 101
section: Week 1
source_file: server-lesson-overview.md
---

<!-- LEVEL_START -->

## Level 1: Why Build an Express Server?

Over this week you will grow a simple Express project into a well-structured API. Each level maps to a daily assignment, building confidence as you layer on new responsibilities for your routes.

At the core sits the web server: a program that listens for incoming HTTP requests, processes them, and sends back responses. Requests are structured messages that include a verb (like `GET` or `POST`), a path, headers, and optionally a body [^mdn-methods]. The server examines those pieces, decides what work to perform, and then constructs a response containing a status line, headers, and a body.

Status codes communicate the outcome of each request—`200` means “OK”, `201` indicates a resource was created, `400` flags invalid input, and `500` signals something went wrong on the server. Matching the right status to each scenario helps clients understand what happened without reading the full payload, and resources like [http.cat](https://http.cat/) make the full catalog easy (and fun) to scan.

The response body can take many forms, but two you’ll use often are HTML and JSON. HTML (`text/html`) is perfect for returning full web pages that a browser can render. JSON (`application/json`) shines when you want to send structured data to another program or frontend. These formats are part of the broader MIME (Multipurpose Internet Mail Extensions) type system, which labels response payloads so clients know how to parse them [^mdn-mime]. Choosing the correct MIME type—communicated through the `Content-Type` header—is critical for interoperability as your API evolves.

[^mdn-mime]: [Media types (MIME types) — MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/MIME_types)
[^mdn-methods]: [HTTP request methods — MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Methods)

