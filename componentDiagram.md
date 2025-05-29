# Spring Task Manager - Component Diagram

```plantuml
@startuml SpringTaskManager

package "Presentation Layer" {
  [TaskController] as Controller <<RestController>> 
  [REST Endpoints] as Endpoints <<Interface>>
  [External Clients] as Clients <<External>>
}

package "Business Layer" {
  interface TaskService <<Interface>> {
    +getAllTasks()
    +getTaskById()
    +createTask()
  }
  [TaskServiceImpl] as Service <<Service>> 
  [Business Rules] as Rules <<Model>>
}

package "Data Access Layer" {
  interface TaskRepository <<Repository>> 
  [Spring Data JPA] as JPA <<Framework>>
  [Database] as DB <<External>>
}

package "Model Layer" {
  [Task] as Entity <<Entity>> {
    -id
    -title
    -description
    -status
  }
  enum TaskStatus <<Enum>> {
    PENDING
    IN_PROGRESS
    COMPLETED
  }
  [Configuration] as Config <<Configuration>>
}

Clients --> Controller : HTTP Requests\n(GET/POST/PUT/DELETE)
Controller --> Service : Invokes\nbusiness methods
Service ..|> TaskService : Implements
Service --> Rules : Enforces
Service --> Entity : Manages
Service --> Repository : Uses
Repository ..|> JPA : Extends
JPA --> DB : Persists
Entity --> TaskStatus : Uses

note right of Config
  application.properties
  Spring Boot Config
end note

legend
  Method Call/Uses -> 
  Dependency/Implements -..>
  Component <<Service>>
  Interface <<Interface>>
  External System <<External>>
endlegend

@enduml
```

## Key Components

### Presentation Layer
- **TaskController**: `@RestController` handling `/api/tasks` endpoints
- **REST Endpoints**: HTTP methods (GET/POST/PUT/DELETE) with JSON payloads
- **External Clients**: Web/mobile applications consuming the API

### Business Layer
- **TaskService**: Interface defining contract for task operations
- **TaskServiceImpl**: `@Service` implementing business logic
- **Business Rules**: Validation, status defaults, timestamp management

### Data Access Layer
- **TaskRepository**: `@Repository` interface extending JpaRepository
- **Spring Data JPA**: Auto-generates queries and CRUD operations
- **Database**: Persistent storage (H2/MySQL/PostgreSQL)

### Model Layer
- **Task**: `@Entity` with core task attributes
- **TaskStatus**: Enum defining possible task states
- **Configuration**: Spring Boot config via `application.properties`

## Interaction Flow
1. Clients make HTTP requests to Controller
2. Controller delegates to Service layer
3. Service enforces business rules and manages entities
4. Repository persists data via Spring Data JPA
5. All layers share the common Task model