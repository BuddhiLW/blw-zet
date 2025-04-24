# Architectures and Design Patterns

## UoW

Transaction for inter-component level. For example, an `UserRepository` and `CategoryRepository`, which should never go out of sync.

## DI (Dependency Injection)

Good rule of thumb for clean Go DI:

> "Construct your dependencies once, inject everywhere, manage lifecycle explicitly."

- Manual constructor chaining
- Dependency Container
- Google's `wire`
- Uber's `fx`

|Project size | Best DI style|
|------|-----|
|<5 dependencies | Manual constructor chaining|
|~5–15 dependencies | Dependency Container|
|>15 dependencies (complex graphs) | wire (compile-time generation)|
|Microservices needing structured lifecycle | fx (Uber)|
