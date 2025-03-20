# Projeto Portifólio estilo Netflix - Formação d3vr

## General view

### Deployment in

buddhilw.dev

### Tecnologias

#### AI

For the workflow: n8n

#### DB
• Supabase

## Development notes

### Changing entrypoint for Fullstack apps using Nest

nest start --entryFile <path>/<to>/main

solves this type of error:

```
༂ (λ) npm run start

> backend@0.0.1 start
> nest start

node:internal/modules/cjs/loader:1137
  throw err;
  ^

Error: Cannot find module '/home/khawarizmi/PP/portifolio/backend/dist/main'
    at Module._resolveFilename (node:internal/modules/cjs/loader:1134:15)
    at Module._load (node:internal/modules/cjs/loader:975:27)
    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:128:12)
    at node:internal/main/run_main_module:28:49 {
  code: 'MODULE_NOT_FOUND',
  requireStack: []
}
```

### Prisma and Migrations

To add new migrations (remotely!)

``` bash
npx prisma migrate dev
```

#### Q: Migrations Remotely

Q: how to do it with other migrations technology, such that it swiftly goes into a cloud. Just like you can do with this prisma command related to supabase?

#### Q: how to automatically generate data for relationships?

### Typescript

Optional attribute in interface, use ?

#### Notes

• Can’t export enum by default.

### Nest

Create new module:

```
nest g module <name>
```

#### Connecting API Calls to a Remote Database

- Use a provider pattern to manage database connections.
- Example in NestJS:
  - Inject a provider into the controller to fetch data dynamically.
  - Use `@Injectable()` services to handle database queries.
  - Register providers in the `module.ts` file to ensure availability.

#### Dependency Injection in NestJS

- Services (providers) can be injected into controllers using the constructor.
- Example:

``` typescript
constructor(private readonly repo: TecnologiaProvider) {}
```

- This allows for cleaner, modular code and facilitates testing.

#### Removing Hardcoded Data in API Responses

- Instead of returning static values, delegate to a provider:

``` typescript
@Get()
async findAll(): Promise<Tecnologia[]> {
    return this.repo.findAll();
}
```

- This ensures data retrieval is dynamic and fetched from a database.

#### Registering Database Modules in NestJS

- Import required modules in `module.ts`:

``` typescript
import { TecnologiaProvider } from './tecnologia.provider';
import { DbModule } from 'src/db/db.module';
```

- Ensure `DbModule` is properly set up to handle database connections.

### Managing Migrations in Prisma with Supabase

- Use `npx prisma migrate dev` for local development.
- Use `prisma migrate deploy` for production environments.


