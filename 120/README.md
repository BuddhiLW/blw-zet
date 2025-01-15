---
title: "QR-Code Supply Management System"
description: "Aplicatico têm tipos of usuários: Administração, Vendedor, e potencialmente Usuário (Cliente)"
published: "2024-04-08"
image: "images/image-post-120.png"
draft: false
---

# QR-Code Supply Management System

Sistema de Gerenciamento de Armazem, mediado por QR-Code.

## Have a set of **qrcodes** holding a `uuid`.

Os QR-Codes transmitem a informação de um `uuid`.

## APP that has the `admin`, `vendor` and potentially `user`

Aplicatico têm os tipos de usuários: Administração, Vendedor, e potencialmente Usuário (Cliente).

### Administração

Consegue cadastrar dados no banco de dado, relativo a um item, o qual se relaciona com um dos QR-Codes

POST:
- Criar item (Preenche formulário);
- Vincular QR-Code (Escaneia com celular).

PUT:
- Escaneia o QR-Code, ou navegar no item do banco de dado, pela interface;
- Salvar as modificações. 

### Vendedor

GET:
- Abre o scaneador de QR-Code;
- Acessa os dados do Item de Estoque.

### Usuário/Cliente?
