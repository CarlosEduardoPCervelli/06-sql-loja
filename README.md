# Modelagem + Queries de Loja

Modela um banco simples de loja com `clientes`, `produtos`, `pedidos` e uma
tabela associativa `itens_pedido` (para um pedido poder ter vários produtos).

## Arquivos

- `01_schema.sql`: cria as 4 tabelas e as chaves estrangeiras.
- `02_dados.sql`: popula as tabelas com clientes, produtos e pedidos fictícios.
- `03_queries.sql`: 6 queries de exemplo sobre os dados.

## Modelo

```
clientes (1) ----- (N) pedidos (1) ----- (N) itens_pedido (N) ----- (1) produtos
```

Cada pedido pode ter vários itens, e cada item referencia um produto com sua
quantidade — assim é possível calcular o valor de cada pedido sem duplicar
dados de produto dentro de `pedidos`.

## As 6 queries

1. **Total gasto por cliente** — soma `preco * quantidade` de todos os itens
   de todos os pedidos de cada cliente.
2. **Produto mais vendido** — soma as quantidades vendidas de cada produto e
   pega o maior valor.
3. **Número de pedidos por cliente** — usa `LEFT JOIN` para incluir também
   clientes que nunca fizeram pedido (aparecem com `0`).
4. **Valor de cada pedido** — soma os itens de cada pedido individualmente.
5. **Clientes sem nenhum pedido** — usa `LEFT JOIN` + `WHERE ... IS NULL`
   para achar clientes sem correspondência em `pedidos`.
6. **Ticket médio geral** — tira a média dos valores de pedido calculados
   numa subquery (a mesma lógica da query 4).

## Como executar

Com SQLite:

```bash
sqlite3 loja.db < 01_schema.sql
sqlite3 loja.db < 02_dados.sql
sqlite3 loja.db < 03_queries.sql
```

As chaves estrangeiras no SQLite só são validadas com `PRAGMA foreign_keys = ON;`
(por isso a linha aparece no início de `01_schema.sql` e `02_dados.sql`).

(Ou cole o conteúdo dos três arquivos, na ordem, em qualquer cliente SQL —
Postgres, MySQL etc. — ajustando `AUTOINCREMENT` para `AUTO_INCREMENT`/`SERIAL`
se necessário.)

## Possíveis melhorias futuras
- Adicionar uma coluna `status` em `pedidos` (pendente, enviado, entregue).
- Query extra: produtos que nunca foram vendidos.
