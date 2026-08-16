SELECT * FROM mesa;
SELECT * FROM atendente;
SELECT * FROM categoria;
SELECT * FROM prato;
SELECT * FROM atendimento;
SELECT * FROM pedido;
SELECT * FROM item_pedido;

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

SELECT
    m.numero AS mesa,
    p.id_pedido,
    pr.nome AS prato,
    ip.quantidade,
    ip.observacao,
    ip.preco_unitario
FROM pedido p
JOIN atendimento at
    ON p.id_atendimento = at.id_atendimento
JOIN mesa m
    ON at.id_mesa = m.id_mesa
JOIN item_pedido ip
    ON p.id_pedido = ip.id_pedido
JOIN prato pr
    ON ip.id_prato = pr.id_prato
ORDER BY m.numero, p.id_pedido;

SELECT
    at.id_atendimento,
    m.numero AS mesa,
    at.hora_inicio,
    at.hora_fim,
    TIMEDIFF(at.hora_fim, at.hora_inicio) AS tempo_permanencia
FROM atendimento at
JOIN mesa m
    ON at.id_mesa = m.id_mesa
WHERE at.hora_fim IS NOT NULL;

SELECT
    pr.nome AS prato,
    SUM(ip.quantidade) AS quantidade_total
FROM item_pedido ip
JOIN prato pr
    ON ip.id_prato = pr.id_prato
GROUP BY pr.id_prato, pr.nome
ORDER BY quantidade_total DESC;

SELECT
    p.id_pedido,
    m.numero AS mesa,
    SUM(ip.quantidade * ip.preco_unitario) AS valor_total
FROM pedido p
JOIN atendimento at
    ON p.id_atendimento = at.id_atendimento
JOIN mesa m
    ON at.id_mesa = m.id_mesa
JOIN item_pedido ip
    ON p.id_pedido = ip.id_pedido
GROUP BY p.id_pedido, m.numero
ORDER BY p.id_pedido;

SELECT
    m.numero AS mesa,
    a.nome AS atendente,
    p.id_pedido,
    p.data_hora,
    pr.nome AS prato,
    ip.quantidade,
    ip.observacao,
    ip.preco_unitario,
    (ip.quantidade * ip.preco_unitario) AS valor_item,
    p.status
FROM pedido p
JOIN atendimento at
    ON p.id_atendimento = at.id_atendimento
JOIN mesa m
    ON at.id_mesa = m.id_mesa
JOIN atendente a
    ON p.id_atendente = a.id_atendente
JOIN item_pedido ip
    ON p.id_pedido = ip.id_pedido
JOIN prato pr
    ON ip.id_prato = pr.id_prato
ORDER BY m.numero, p.id_pedido, pr.nome;