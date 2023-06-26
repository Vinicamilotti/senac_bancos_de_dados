ALTER TABLE medico ADD COLUMN em_atividade BIT DEFAULT 1;
UPDATE medico SET em_atividade = 0 WHERE id = 4;
UPDATE medico SET em_atividade = 0 WHERE id = 3;
UPDATE internacao SET data_alta = data_entrada + 3;
UPDATE paciente SET convenio_id = NULL WHERE convenio_id = 4;
DELETE FROM convenio WHERE id = 4;