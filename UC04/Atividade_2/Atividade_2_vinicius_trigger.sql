DELIMITER //
CREATE TRIGGER criptografar_senha BEFORE INSERT ON usuario FOR EACH ROW
BEGIN
	SET NEW.senha = MD5(NEW.senha);
END//