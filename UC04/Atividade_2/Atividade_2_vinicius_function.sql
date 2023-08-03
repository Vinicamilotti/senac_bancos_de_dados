DELIMITER //
CREATE FUNCTION status_premium_cliente(param_id_cliente INT) RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
	DECLARE total_compras INT DEFAULT 0;
    SET total_compras = (SELECT SUM(valor_total) FROM venda WHERE cliente_id = param_id_cliente);
	IF total_compras > 10000 THEN
		RETURN "Premium";
	ELSE
		RETURN "Regular";
	END IF;
END//
DELIMITER ;
-- A maior soma de valores de compra no banco era de aproximadamente 9400, sendo o id do cliente com esse valor igual a 62, para fins de demonstração inseri mais uma compra para id, afim de gerar ao menos um cliente premium
INSERT INTO venda(data, data_envio, status, valor_total, cliente_id, funcionario_id, tipo_pagamento, numero_parcelas_pagamento, data_pagamento) VALUES('2022-02-12', NULL, 'FINALIZADO', 1000.00, 62, 4, 'P','2022-02-12');
-- Chamando as funções
-- Cliente com menos de 10000 em compras no total
SELECT status_premium_cliente(1);
-- Cliente com mais de 10000 em compras no total
SELECT status_premium_cliente(62)