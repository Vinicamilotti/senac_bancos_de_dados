DELIMITER //
CREATE PROCEDURE venda_por_cliente_e_tempo(param_cliente_id INT, data_inicial DATE, data_final DATE)
BEGIN
	SELECT C.nome AS nome_cliente, V.id AS id_venda, V.valor_total, I.nome_produto, I.quantidade FROM cliente AS C JOIN venda AS V ON V.cliente_id = C.id JOIN item_venda AS I ON I.venda_id = V.id 
    WHERE C.id = param_cliente_id AND V.data BETWEEN data_inicial AND data_final;
END//
DELIMITER ;
CALL venda_por_cliente_e_tempo(1, '2019-01-08', '2020-01-08');