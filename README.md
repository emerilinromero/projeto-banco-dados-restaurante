# projeto-banco-dados-restaurante
Projeto conceitual e lógico de banco de dados para gerenciamento de pedidos de um restaurante.
# Sistema de Banco de Dados para Restaurante

## Sobre o projeto

Este projeto foi desenvolvido como prática de modelagem e banco de dados.

O objetivo foi solucionar problemas de controle de pedidos de um restaurante em crescimento, permitindo identificar:

- qual mesa realizou cada pedido;
- qual atendente registrou o pedido;
- quais pratos foram solicitados;
- quantidade de cada item;
- status dos pedidos;
- tempo de permanência dos clientes nas mesas.

## Tecnologias utilizadas

- MySQL
- DB Fiddle
- SQL
- Draw.io
- GitHub

## Modelagem

O banco possui as seguintes entidades:

- Mesa
- Atendente
- Atendimento
- Pedido
- Item_Pedido
- Prato
- Categoria

## Conceitos praticados

- Modelo Entidade-Relacionamento (MER)
- Modelo lógico
- Primary Keys (PK)
- Foreign Keys (FK)
- DDL
- DML
- SELECT
- JOIN
- GROUP BY
- SUM
- TIMEDIFF

## Consultas desenvolvidas

O projeto permite consultar:

- pedidos por mesa;
- atendente responsável;
- pratos solicitados;
- tempo de permanência nas mesas;
- pratos mais pedidos;
- valor total de cada pedido.

## Arquivos

- `restaurante.sql` — criação e população do banco
- `consultas.sql` — consultas SQL
- `MER_Restaurante.pdf` — modelo entidade-relacionamento
- `MER_Restaurante.drawio` — arquivo editável do MER
