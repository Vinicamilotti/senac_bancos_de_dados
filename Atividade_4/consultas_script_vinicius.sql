-- Dados e valor medio SEM convenio
SELECT * FROM consultas WHERE id_convenio IS NULL;
SELECT AVG(valor) FROM consultas WHERE id_convenio IS NULL;
-- Dados e valor medio COM convenio
SELECT * FROM consultas WHERE id_convenio IS NOT NULL;
SELECT AVG(valor) FROM consultas WHERE id_convenio IS NOT NULL;
-- Todas as internações com data_alta > previsao_alta
SELECT * FROM internacao WHERE data_alta > previsao_alta;
-- Primeira consulta com protuário
SELECT * FROM prescricoes WHERE id_consulta = (SELECT MIN(id_consulta) FROM prescricoes); 
-- Consulta sem convenio de maior e menor valor
SELECT MIN(valor) FROM consultas WHERE id_convenio IS NULL;
SELECT MAX(valor) FROM consultas WHERE id_convenio IS NULL;
-- Todos os dados das internações em seus respectivos quartos e total valor
 SELECT Q.id_tipo_quarto, Q.numero, I.id, I.paciente_id, I.medico_id, DATEDIFF(I.data_alta, I.data_entrada), T.valor, (DATEDIFF(I.data_alta, I.data_entrada) * T.valor) FROM quarto AS Q JOIN internacao AS I JOIN tipo_quarto AS T ON Q.id = I.quarto_id ORDER BY (Q.id_tipo_quarto);
 -- TOdos os quartos de tipo "apartamento"
SELECT internacao.paciente_id, internacao.data_entrada, internacao.especialidade_id, quarto.numero, COUNT(quarto.id_tipo_quarto) FROM internacao JOIN quarto ON internacao.quarto_id = quarto.id WHERE quarto.id_tipo_quarto = 3;
-- todos as consultas em pediatria em que agora os pacientes são maiores de 18 anos
SELECT paciente.nome, consultas.data_consulta, consultas.id_especialidade FROM paciente JOIN consultas ON paciente.id = consultas.id_paciente WHERE DATEDIFF('2023-06-26',paciente.data_nascimento) > 6575 AND consultas.id_especialidade = 1 ORDER BY consultas.data_consulta

