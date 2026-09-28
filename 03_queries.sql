-- ============================================
-- 6 queries sobre a loja
-- ============================================

-- 1) Total gasto por cliente (considerando preço * quantidade de cada item)
SELECT
    c.nome AS cliente,
    SUM(pr.preco * ip.quantidade) AS total_gasto
FROM clientes c
JOIN pedidos pe ON pe.cliente_id = c.id
JOIN itens_pedido ip ON ip.pedido_id = pe.id
JOIN produtos pr ON pr.id = ip.produto_id
GROUP BY c.id, c.nome
ORDER BY total_gasto DESC;

-- 2) Produto mais vendido (em quantidade total)
SELECT
    pr.nome AS produto,
    SUM(ip.quantidade) AS quantidade_total
FROM itens_pedido ip
JOIN produtos pr ON pr.id = ip.produto_id
GROUP BY pr.id, pr.nome
ORDER BY quantidade_total DESC
LIMIT 1;

-- 3) Número de pedidos por cliente (inclui quem nunca comprou, com 0)
SELECT
    c.nome AS cliente,
    COUNT(pe.id) AS numero_pedidos
FROM clientes c
LEFT JOIN pedidos pe ON pe.cliente_id = c.id
GROUP BY c.id, c.nome
ORDER BY numero_pedidos DESC;

-- 4) Valor total de cada pedido
SELECT
    pe.id AS pedido_id,
    SUM(pr.preco * ip.quantidade) AS valor_pedido
FROM pedidos pe
JOIN itens_pedido ip ON ip.pedido_id = pe.id
JOIN produtos pr ON pr.id = ip.produto_id
GROUP BY pe.id;

-- 5) Clientes que nunca fizeram pedido (útil para campanhas de reengajamento)
SELECT c.nome
FROM clientes c
LEFT JOIN pedidos pe ON pe.cliente_id = c.id
WHERE pe.id IS NULL;

-- 6) Ticket médio geral da loja (média do valor dos pedidos, reaproveitando a query 4)
SELECT AVG(valor_pedido) AS ticket_medio
FROM (
    SELECT SUM(pr.preco * ip.quantidade) AS valor_pedido
    FROM pedidos pe
    JOIN itens_pedido ip ON ip.pedido_id = pe.id
    JOIN produtos pr ON pr.id = ip.produto_id
    GROUP BY pe.id
) AS valores;
