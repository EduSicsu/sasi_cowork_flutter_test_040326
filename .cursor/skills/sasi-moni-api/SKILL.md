---
name: sasi-moni-api
description: Consult the SASI Moni mobile API documentation. Use when the user asks about API endpoints, routes, request or response payloads, authentication, HTTP methods, parameters, status codes, or any behavior of the SASI Moni backend. Also use when implementing a Flutter/Dart feature that calls the API, creating models from API responses, or debugging network requests.
---

# SASI Moni Mobile API

## Step 1 — Always fetch the live docs first

Before answering any API-related question, fetch the documentation using the WebFetch tool:

**URL:** `https://stg-api-moni.sasi.io/api/standard/v2/docs-mobile-json`

This is an OpenAPI/Swagger JSON spec. Always retrieve it before answering.

## Step 2 — Answer from the spec

- Find the relevant path(s) and their operations (`GET`, `POST`, `PUT`, `DELETE`, `PATCH`)
- Show the endpoint URL, HTTP method, required headers, path/query parameters, and request/response body schemas
- When implementing Dart/Flutter code, map the response JSON fields to the corresponding model classes following the project's data layer conventions

## Step 3 — Base URL

The base URL for all endpoints (staging environment):

```
https://stg-api-moni.sasi.io
```

Use the `servers` array in the fetched spec to confirm the correct base URL for each environment.
