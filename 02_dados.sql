-- ============================================
-- Dados fictícios
-- ============================================

-- Reativa as chaves estrangeiras nesta conexão (SQLite). Em Postgres/MySQL, remova.
PRAGMA foreign_keys = ON;

INSERT INTO clientes (nome, email, cidade) VALUES
('Ana Souza', 'ana@email.com', 'São Paulo'),
('Bruno Lima', 'bruno@email.com', 'Rio de Janeiro'),
('Carla Nunes', 'carla@email.com', 'São Paulo'),
('Diego Alves', 'diego@email.com', 'Belo Horizonte');

INSERT INTO produtos (nome, categoria, preco) VALUES
('Teclado Mecânico', 'Periféricos', 250.00),
('Mouse sem fio', 'Periféricos', 90.00),
('Monitor 24"', 'Monitores', 800.00),
('Cadeira Gamer', 'Móveis', 950.00),
('Headset', 'Periféricos', 180.00);

-- pedido 1: Ana comprou teclado (2x) e mouse (1x)
INSERT INTO pedidos (cliente_id, data_pedido) VALUES (1, '2026-01-10');
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade) VALUES
(1, 1, 2),
(1, 2, 1);

-- pedido 2: Bruno comprou monitor
INSERT INTO pedidos (cliente_id, data_pedido) VALUES (2, '2026-02-03');
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade) VALUES
(2, 3, 1);

-- pedido 3: Ana comprou headset e mouse
INSERT INTO pedidos (cliente_id, data_pedido) VALUES (1, '2026-02-20');
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade) VALUES
(3, 5, 1),
(3, 2, 1);

-- pedido 4: Carla comprou cadeira gamer e teclado
INSERT INTO pedidos (cliente_id, data_pedido) VALUES (3, '2026-03-01');
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade) VALUES
(4, 4, 1),
(4, 1, 1);

-- pedido 5: Bruno comprou mouse (2x)
INSERT INTO pedidos (cliente_id, data_pedido) VALUES (2, '2026-03-15');
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade) VALUES
(5, 2, 2);
