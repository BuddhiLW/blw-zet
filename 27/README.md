# Configuração do Github Actions

O Github Actions é configurado por meio de `workflows`. O local onde residem é `.github/workflows`.

Todo `workflow` utiliza de especificações de:
- Quando: palavra-chave `on`, e.g., `on: [push, workflow_dispatch]`.
- O que: palavra-chave `run`, e.g., `- run: bash scrip-que-faz-tudo.sh`.
- Onde: palavra-chave `runs-on`, e.g., `runs-on: imagem-docker-preconfigurada`.
- Quem: palavra-chave `name`, e.g., `name: teste-funcional`.
- Para que: palavra-chave `job:`, e.g., `job: test:`.

Exemplo de um script mínimo: Um script que printa "Olá, mundo".
```yaml
# Em .github/workflows/test.yml
name: Test

on: [push, workflow_dispatch]

jobs:
  test:
    name: Test
    runs-on: ubuntu-latest

    steps:
      - run: echo "Olá, mundo!"
```

A sacada é: escrever um script que roda, nos passos, cada tipo de teste.

Exemplo, um script chamado `teste-X.sh`
```bash
#!/bin/bash

## Muda para o diretório atual, para a pasta X
cd X

## Executa os arquivos com terminação .js
mocha *.js

## Retorna ao diretório raiz
cd 
```

No `yaml`, ele entraria no passo `steps`:
```
steps:
  - run: echo "teste X"
  - run: bash scripts/teste-X.sh
  - run: echo "teste Y"
  - run: bash scripts/teste-Y.sh
  - run: echo "teste Z"
  - run: bash scripts/teste-Z.sh
```

