# task_api_app

## Overview

A simple task management API built with Ruby on Rails (API mode).  
Implements basic CRUD operations on a `Task` model with JSON responses, and includes RSpec-based model and request tests.

---

## Tech Stack

- Ruby 3.1.3
    
- Rails 6.1.7.1 (API mode)
    
- PostgreSQL
    
- RSpec
    
- FactoryBot
    

---

## Getting Started

### 1. Clone this repo

```bash
git clone https://github.com/yourname/task_api_app.git
cd task_api_app
```

### 2. Install dependencies

```bash
bundle install
```

### 3. Set up the database

```bash
rails db:create db:migrate
```

### 4. Run the server

```bash
bundle exec rails s
```

---

## Task Model Structure

|Field|Type|Required|Default|
|---|---|---|---|
|title|string|Yes|-|
|description|text|No|-|
|due_date|date|No|-|
|completed|boolean|No|false|

---

## Running Tests

```bash
bundle exec rspec --format documentation
```

Tests include:

- Model validations
    
- Request specs for all CRUD actions
    

---

## API Endpoints Overview

|Method|Endpoint|Description|
|---|---|---|
|GET|/api/v1/tasks|List all tasks|
|GET|/api/v1/tasks/:id|Retrieve a task|
|POST|/api/v1/tasks|Create a task|
|PATCH|/api/v1/tasks/:id|Update a task|
|DELETE|/api/v1/tasks/:id|Delete a task|

---

## Notes

- Built as part of a learning project to understand Rails API and TDD practices.
    
- Authentication is **not implemented**.
    
- Focused on clarity and testability.
    

---

## History

- 2025-08-01: Initial implementation complete