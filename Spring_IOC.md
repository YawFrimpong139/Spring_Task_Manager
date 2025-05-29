# SPRING, IOC AND REST UNDERSTANDING

## `Spring Framework`

Spring is a comprehensive framework for Enterprise Java Development that provides infrastructure support
Key features:
- Dependency Injection (DI)
- Aspect-Oriented Programming (AOP)
- Data Access Support
- Transaction Management
- MVC Framework

### Dependency Injection
This is Spring's core feature that implements Inversion of Control (IoC), where objects
receive their dependencies from an external source rather than creating them internally. This design
pattern promotes loose coupling between components, making code more modular, testable and maintainable.
Spring's DI container manages object creation and wiring them through XML configurations or annotations like @Autowired.

### Aspect-Oriented Programming (AOP)
Spring provides AOP support to separate cross-cutting concerns (like logging, security, transactions) from business logic.
Using proxy patterns, Spring can apply advice (behaviour) to specific join points in the application flow without modifying
the original code. This modular approach keeps business logic clean while handling system-wide concerns consistently.

### Data Access Support
Spring abstracts data access through templates (JDBCTemplate) and integration with popular ORM tools (Hibernate, JPA). It provides 
a consistent exception hierarchy that translates vendor-specific exception into unchecked exceptions. The framework
simplifies transaction management across different data access technologies while reducing boilerplate code.

### Transaction Management
This offers both programmatic and declarative transaction management with a consistent programming model. The @Transactional annotation
enables declarative transactions with configurable propagation behaviours and isolation levels. Spring's transaction abstraction works 
across various transaction APIs (Hibernate, JDBC, JTA) without locking users into specific implementations.

### MVC Framework
This is a robust framework that follows the `Model - View - Controller` pattern that simplifies web application development. It features 
annotation based controllers (@Controller, @RequestMapping), flexible view resolution (supporting JSP, Thymeleaf, etc), and built-in REST 
capabilities through @RestController. The framework handles HTTP requests/responses while providing hooks for customization at every level.


## `Inversion of Control (IOC)`

IOC is a design principle where the control of object creation and lifecycle is inverted from the application
to a container (Spring IoC in this case).
Key Benefits:
- Loose coupling between components
- Easier testing
- More maintainable codes
- Configuration management

In my Task Management API:
- The `TaskController` doesn't create its own `TaskService` - It is injected by Spring.
- The `TaskServiceImpl` doesn't create its own `TaskRepository` - It is also injected by Spring

## `REST (Representational State Transfer)`

REST is an architectural style for designing networked applications that uses HTTP.
Some key principles of REST are:
- Statelessness
- Resourced-based
- Standard HTTP Methods (GET,POST,PUT,DELETE)
- Representations(JSON/XML)

My API follows REST principles by:
- Using proper HTTP methods for CRUD operations
- Returning appropriate HTTP status codes
- Using resource-based URLs
- Supporting JSON for request/response bodies
