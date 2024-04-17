# System Design: Google Drive (Full Cycle)

Gravação vs leitura.
Consistência vs Disponibilidade.

Main feature: Gravação e Consistência.

## Pricnipais Recursos

- Sincronização Client/Server.
- **Leitura e Gravação** de *chunks* de arquivos.

## Requisitos não funcionais

- Multi-tenancy (múltiplos views, em paralelo, sem compartilhar memória por usuário).
- Baixa latência.
- Resiliência (dados jamais devem ser deletados, sem interação do usuário - perda de arquivo na memória).

## Plano de Capacidade

- DAU (Daily Active Users).
- Picos de acesso (?).
- Quantos usuários utilizam a aplicação por dia?
- Tamanho médio dos arquivos.
- Relação entre Read e Write.
- Replication Factor.
- Quantos arquivos, por usuário?

