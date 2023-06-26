USE hospital_db_vinicius_at3;
-- Especialidades
INSERT INTO especialidade (especialidade) VALUES ("Pediatra"),
("Gastroenterologia"),
("Clinico Geral"),
("Dermatologia"),
("Uncologista"), 
("Psiquiatra"),
("Gerontologia");
-- Convenio
INSERT INTO convenio (nome, cnpj) VALUES ("Medmais", 123456789),
("UniSaude", 123414956),
("ProHealth", 898556789),
("MaisSaude", 435613568);
-- Tipo de quarto
INSERT INTO tipo_quarto (descricao, valor) VALUES ("Enfermaria", 100.00),
("Quarto duplo", 300.99),
("Apartamento", 500.50);
