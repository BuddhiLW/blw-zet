# Projeto Portifólio estilo Netflix - Formação d3vr

## General view

### Deployment in

`buddhilw.dev`

### Tecnologias

#### AI

For the workflow: `n8n`

#### DB 
- Supabase

## Development notes

### Changing entrypoint for Fullstack apps using Nest


`nest start --entryFile <path>/<to>/main`

solves this type of error:

```
꧂ (λ) npm run start

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

Q: how to do it with other migrations technology, such that it swiftly goes into a cloud. Just like you can do with this prisma command related to supabase?

