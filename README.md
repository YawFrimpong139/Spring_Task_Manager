# Task Management REST API

A Spring Boot application for managing tasks with CRUD operations.

## Prerequisites
- Java 17
- Maven
- Docker (optional)

## Setup
1. Clone the repository
2. Build the project: `mvn clean install`
3. Run the application: `mvn spring-boot:run`

## Docker
1. Build the image: `docker build -t task-management-api .`
2. Run the container: `docker run -p 8080:8080 task-management-api`

## API Endpoints
- GET /api/tasks - Get all tasks
- GET /api/tasks/{id} - Get task by ID
- POST /api/tasks - Create new task
- PUT /api/tasks/{id} - Update task
- DELETE /api/tasks/{id} - Delete task
