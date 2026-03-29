# StatusNeo Fullstack Assignment

This repository contains:

- **Flutter Mobile App** → `statusneo_assign`
- **Node.js BFF Backend** → `statusneo_backend`

---

## Tech Stack

### Flutter App
- Flutter (version 3.38.7)
- Riverpod
- Dio
- Hive
- GoRouter
- Shimmer

### Backend
- Node.js (v25.8.2)
- Express
- TypeScript (strict)
- Zod
- Vitest
- Swagger
- Docker

---

## Features

### Flutter
- Pet onboarding form
- Form validation
- API integration with Node BFF
- Recommendation screen
- Skeleton/shimmer loading
- Error and offline handling
- Local persistence with Hive
- Widget tests

### Backend
- Create pet API
- Get pet API
- Recommendation API
- Structured error responses
- Validation on all endpoints
- Recommendation engine in domain layer
- Unit tests
- Swagger docs
- Docker support

---

# Project Structure

## Backend
```bash
cd statusneo_backend
```

## Flutter

```bash
cd statusneo_assign
```

## Run Backend

```bash
cd statusneo_backend
npm install
npm run dev
```

## Swagger Docs

http://localhost:3000/api/docs

## Docker

```bash
docker compose up --build
```

## Run Flutter

```bash
cd statusneo_assign
flutter pub get
flutter run
```
For Android emulator, base URL uses http://10.0.2.2:3000

## Tests

```bash
Backend tests
cd statusneo_backend
npm test
```

## Flutter widget tests

```bash
cd statusneo_assign
flutter test
```

## API Endpoints

### Backend Base URL

http://localhost:3000

### Health

> GET /health

### Create Pet

> POST /api/pets

### Get Pet

> GET /api/pets/:id

### Get Recommendation

> GET /api/pets/:id/recommendation