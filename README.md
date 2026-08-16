# Sistema de Banco de Dados para Restaurante

## Sobre o projeto

Este projeto foi desenvolvido como prática de **modelagem e implementação de banco de dados relacional**, com o objetivo de solucionar problemas reais de controle de pedidos em um restaurante em crescimento.

O cenário proposto apresentava dificuldades como:

* Falta de controle sobre os pedidos realizados;
* Dificuldade para identificar para qual mesa cada pedido foi feito;
* Erros no envio dos pratos para a cozinha;
* Ausência de histórico dos pratos solicitados;
* Dificuldade para calcular o tempo de permanência dos clientes nas mesas.

A solução foi desenvolvida desde a análise de requisitos até a implementação e consulta do banco de dados.

## Objetivo

Criar um banco de dados capaz de registrar e relacionar:

* Mesas;
* Atendentes;
* Atendimentos;
* Pedidos;
* Itens dos pedidos;
* Pratos;
* Categorias do cardápio.

Com isso, o sistema permite rastrear cada pedido desde a mesa até os pratos solicitados.

## Tecnologias e ferramentas utilizadas

* **MySQL**
* **SQL**
* **DB Fiddle**
* **Draw.io / diagrams.net**
* **GitHub**

## Etapas desenvolvidas

O projeto foi construído seguindo as seguintes etapas:

1. Análise do problema do cliente
2. Levantamento de requisitos
3. Definição das regras de negócio
4. Construção do Modelo Entidade-Relacionamento (MER)
5. Desenvolvimento do modelo lógico
6. Definição de Primary Keys e Foreign Keys
7. Definição dos tipos de dados
8. Criação das tabelas com DDL
9. Inserção dos dados iniciais com DML
10. Desenvolvimento de consultas SQL

## Entidades do banco de dados

O modelo possui as seguintes entidades:

### Mesa

Armazena informações sobre as mesas do restaurante, como número, capacidade e status.

### Atendente

Armazena os dados dos profissionais responsáveis pelos atendimentos e registros de pedidos.

### Atendimento

Representa o período em que uma mesa está sendo utilizada.

Registra informações como:

* Mesa;
* Atendente responsável;
* Data;
* Horário de início;
* Horário de término;
* Status.

### Pedido

Representa os pedidos realizados durante um atendimento.

Permite identificar:

* Atendimento;
* Atendente que registrou o pedido;
* Data e hora;
* Status;
* Observações.

### Item_Pedido

Relaciona os pedidos aos pratos solicitados.

Armazena:

* prato;
* quantidade;
* observações;
* preço unitário.

### Prato

Armazena os pratos disponíveis no cardápio, incluindo:

* Nome;
* Descrição;
* Preço;
* Disponibilidade;
* Categoria.

### Categoria

Organiza os pratos em categorias como:

* Bebidas
* Entradas
* Pratos Principais
* Sobremesas

## Relacionamentos principais

O banco possui os seguintes relacionamentos:

```text
MESA 1:N ATENDIMENTO

ATENDENTE 1:N ATENDIMENTO

ATENDIMENTO 1:N PEDIDO

ATENDENTE 1:N PEDIDO

PEDIDO 1:N ITEM_PEDIDO

PRATO 1:N ITEM_PEDIDO

CATEGORIA 1:N PRATO
```

## Conceitos de banco de dados praticados

Durante o desenvolvimento foram aplicados conceitos como:

* Modelo Entidade-Relacionamento
* Modelo lógico
* Primary Key (PK)
* Foreign Key (FK)
* Integridade referencial
* Tipos de dados
* DDL
* DML
* SELECT
* JOIN
* GROUP BY
* ORDER BY
* SUM
* TIMEDIFF
* Colunas calculadas

## DDL

As tabelas foram criadas utilizando comandos como:

```sql
CREATE TABLE
```

O arquivo com a estrutura completa do banco está disponível em:

`restaurante.sql`

## DML

Os dados iniciais foram inseridos utilizando:

```sql
INSERT INTO
```

Foram cadastrados dados de exemplo para:

* Mesas;
* Atendentes;
* Categorias;
* Pratos;
* Atendimentos;
* Pedidos;
* Itens dos pedidos.

## Consultas desenvolvidas

As consultas SQL permitem responder questões importantes para a operação do restaurante.

### Visualização das tabelas

```sql
SELECT * FROM mesa;
SELECT * FROM atendente;
SELECT * FROM categoria;
SELECT * FROM prato;
SELECT * FROM atendimento;
SELECT * FROM pedido;
SELECT * FROM item_pedido;
```

### Identificação de pedido, mesa e atendente

Permite identificar:

* Qual pedido foi realizado;
* Para qual mesa;
* Qual atendente registrou;
* Data e hora;
* Status do pedido.

### Pratos solicitados por mesa

A consulta relaciona:

```text
Mesa
→ Atendimento
→ Pedido
→ Item_Pedido
→ Prato
```

Permitindo visualizar os pratos, quantidades, observações e preços associados a cada pedido.

### Tempo de permanência

Foi utilizada a função:

```sql
TIMEDIFF()
```

para calcular a diferença entre o horário de início e de término do atendimento.

### Pratos mais pedidos

Utilizando:

```sql
SUM()
GROUP BY
ORDER BY
```

é possível identificar os pratos com maior quantidade de pedidos.

### Valor total dos pedidos

O valor de cada item é calculado por:

```sql
quantidade * preco_unitario
```
e posteriormente somado para determinar o valor total de cada pedido.

## Problemas resolvidos

Com o modelo desenvolvido, o restaurante consegue:

* Identificar para qual mesa cada pedido pertence;
* Identificar qual atendente registrou o pedido;
* Acompanhar o status dos pedidos;
* Registrar observações específicas dos pratos;
* Consultar quais pratos foram solicitados;
* Verificar quantidades;
* Calcular o tempo de permanência nas mesas;
* Calcular o valor dos pedidos;
* Identificar os pratos mais solicitados;
* Manter histórico dos atendimentos.

## Estrutura do repositório

```text
projeto-banco-dados-restaurante/
│
├── README.md
├── restaurante.sql
├── consultas.sql
├── MER_Restaurante.pdf
└── MER_Restaurante.drawio
```

## Arquivos

* `restaurante.sql` — criação das tabelas e inserção dos dados
* `consultas.sql` — consultas desenvolvidas para análise do banco
* `MER_Restaurante.pdf` — representação visual do modelo conceitual
* `MER_Restaurante.drawio` — arquivo editável do MER

## Demonstração

Modelo Entidade-Relacionamento

O diagrama abaixo representa a estrutura conceitual desenvolvida para o sistema do restaurante.

![Modelo Entidade-Relacionamento do Restaurante](MER_Restaurante.png)


O modelo apresenta as principais entidades e seus relacionamentos, permitindo visualizar como mesas, atendimentos, pedidos, pratos e atendentes se conectam dentro do sistema.

# Sistema de Banco de Dados para Restaurante

## Exemplo de consulta

Uma das consultas desenvolvidas permite identificar o pedido, a mesa e o atendente responsável:

```sql
SELECT
    p.id_pedido,
    m.numero AS mesa,
    a.nome AS atendente,
    p.data_hora,
    p.status
FROM pedido p
JOIN atendimento at
    ON p.id_atendimento = at.id_atendimento
JOIN mesa m
    ON at.id_mesa = m.id_mesa
JOIN atendente a
    ON p.id_atendente = a.id_atendente
ORDER BY p.id_pedido;
```

Essa consulta ajuda a resolver um dos principais problemas apresentados no cenário: identificar corretamente **para qual mesa cada pedido foi realizado e qual atendente o registrou**.

---

## Exemplo de resultado

| Pedido | Mesa | Atendente   | Status     |
| -----: | ---: | ----------- | ---------- |
|      1 |    2 | Ana Souza   | Entregue   |
|      2 |    2 | Ana Souza   | Entregue   |
|      3 |    3 | Carlos Lima | Em preparo |
|      4 |    1 | Maria Silva | Entregue   |

---

## Outras análises realizadas

Também foram desenvolvidas consultas para:

* Identificar os pratos pedidos em cada mesa;
* Calcular o tempo de permanência dos clientes;
* Identificar os pratos mais pedidos;
* Calcular o valor total de cada pedido;
* Visualizar quantidade, observações e preço de cada item.

---

## DB Fiddle

O banco de dados foi implementado e testado utilizando o **DB Fiddle**.

**Link do projeto:**
https://www.db-fiddle.com/f/rQaGrdpR79FRVasKNDAhCo/0

---

## Resultado

O projeto demonstra o fluxo completo de desenvolvimento de um banco de dados relacional:

```text
Problema do cliente
        ↓
Análise de requisitos
        ↓
Regras de negócio
        ↓
Modelo conceitual (MER)
        ↓
Modelo lógico
        ↓
DDL
        ↓
DML
        ↓
Consultas SQL
        ↓
Informações para tomada de decisão
```

Com esse desenvolvimento foi possível transformar um problema real de controle de pedidos em uma solução estruturada utilizando banco de dados relacional.

O projeto permitiu praticar conceitos de:

* Modelagem de dados;
* Modelo Entidade-Relacionamento (MER);
* Modelo lógico;
* Primary Keys (PK);
* Foreign Keys (FK);
* DDL;
* DML;
* Consultas SQL;
* JOIN;
* GROUP BY;
* SUM;
* TIMEDIFF;
* Análise de informações para apoio à tomada de decisão.

---

## Conclusão

A solução desenvolvida permite ao restaurante controlar melhor seus atendimentos e pedidos, identificando:

* Para qual mesa cada pedido foi realizado;
* Qual atendente registrou o pedido;
* Quais pratos foram solicitados;
* A quantidade de cada item;
* O status dos pedidos;
* O tempo de permanência dos clientes nas mesas;
* O valor dos pedidos;
* Os pratos mais solicitados.

Dessa forma, o banco de dados contribui para melhorar a organização das informações e reduzir erros no processo de atendimento.
