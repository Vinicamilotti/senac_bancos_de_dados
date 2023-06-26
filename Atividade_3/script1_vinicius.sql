-- Inserindo 10 medicos
INSERT INTO medico (nome, crm) VALUES ("Júlia Camarinho", "CRM/SP 123456"), 
("José Mourinho", "CRM/SP 654321"), 
("Ronaldo Nazario", "CRM/SP 647890"), 
("Marta Vieira", "CRM/SP 891385"), 
("Suéli Simão Pegado ", "CRM/SP 301359"), 
("Gustavo Vieira", "CRM/SP 587173"), 
("Marilia Prado", "CRM/SP 951384"), 
("Caio Muller", "CRM/SP 235162"), 
("Juliana Silva", "CRM/SP 667123"), 
("Lucas Firmino", "CRM/SP 998844");
-- Atribuindo medicos a especialidades
INSERT INTO especialista (medico_id, especialidade_id) VALUES (1,1), (1,2), (2,3), (3,4), (5,6), (6,6), (7,7), (8,7), (9,5), (4,4);
-- Inserindo 10 pacientes
INSERT INTO paciente (nome, cpf, rg, convenio_id, tempo_carencia, telefone, email) VALUES ("João Prado", 123456789, 31234556, 1, '2015-03-05', 1140233530, "joaoprado@gmail.com"), ('Maria Silva', '987654321', '54321678', 2, '2021-01-15', '1198765432', 'mariasilva@gmail.com'),
('Pedro Santos', 456789123, 87654321, 3, '2016-04-20', 1187654321, 'pedrosantos@gmail.com'),
('Ana Souza', 654321987, 43218765, null, null, 1165432187, 'anasouza@gmail.com'),
('Lucas Oliveira', 789123456, 76543218, null, null, 1154321876, 'lucasoliveira@gmail.com'),
('Carolina Mendes', 321987654, 21876543, 3, '2016-07-25', 1143218765, 'carolinamendes@gmail.com'),
('Ricardo Almeida', 852963741, 54320876, 4, '2016-06-12', 1121876543, 'ricardoalmeida@gmail.com'),
('Patricia Costa', 159753852, 32187654, 2, '2015-03-05', 1115432187, 'patriciacosta@gmail.com'),
('Fernando Ribeiro', 369852147, 87654341, 3, '2017-08-17', 1198763432, 'fernandoribeiro@gmail.com'),
('Juliana Santos', 753951852, 54321876, 1, '2015-12-02', 1187754321, 'julianasantos@gmail.com'),
('Gustavo Lima', 258741369, 21870543, 2, '2016-06-28', 1176543218, 'gustavolima@gmail.com');
-- Inserindo 10 consultas
INSERT INTO consultas (id_medico, id_paciente, id_convenio, carteirinha, data_consulta, valor) VALUES (2, 1, 1, 123456, '2017-05-13', 100),
(1, 3, NULL, NULL, '2017-07-13', 100),
(2, 1, 1, 123456, '2017-08-13', 100),
(1, 3, NULL, NULL, '2017-09-13', 100),
(4, 2, 3, 654321, '2018-01-13', 100),
(5, 4, NULL, NULL, '2018-02-13', 100),
(6, 5, 3, 879080, '2018-04-13', 100),
(7, 6, 4, 642890, '2019-05-13', 100),
(8, 7, 2, 000099, '2020-08-13', 100),
(3, 8, 3, 999900, '2022-11-13', 100);
-- Inserindo 5 receitas com ao menos dois remedios
INSERT INTO prescricoes (remedio, id_consulta) VALUES ("Tilenol", 2);
INSERT INTO prescricoes (remedio, id_consulta) VALUES ("Vick Vapurub", 2);
INSERT INTO prescricoes (remedio, id_consulta) VALUES ("Penicilina", 3);
INSERT INTO prescricoes (remedio, id_consulta) VALUES ("Paracetamol", 3);
INSERT INTO prescricoes (remedio, id_consulta) VALUES ("Xarope Expectorante", 4);
INSERT INTO prescricoes (remedio, id_consulta) VALUES ("Soro fisiológico", 4);
INSERT INTO prescricoes (remedio, id_consulta) VALUES ("Rocuttan", 5);
INSERT INTO prescricoes (remedio, id_consulta) VALUES ("Sabonete esfoliante", 5);
INSERT INTO prescricoes (remedio, id_consulta) VALUES ("Efexor", 6);
INSERT INTO prescricoes (remedio, id_consulta) VALUES ("Ritalina", 6);
-- Inserindo 3 quartos
INSERT INTO quarto (id_tipo_quarto, numero) VALUES (1, 1), (2,2), (3,3);
-- Inserindo 6 enfermeiros
INSERT INTO enfermeiro (nome, cre, cpf) VALUES ("André Calil", 132456, 123445676), 
("Joana Ribeiro", 654321, 123450457), 
("Percefane Maria", 098765, 125676567),
("Ricardo Amado", 7890909,12394871),
("Aldo Meli", 576129,0902938485),
("Alicia Terron", 831943, 831930491);
-- Criando 7 internações com 1 paciente, 1 médico e 1 quarto associados
INSERT INTO internacao (quarto_id, medico_id, paciente_id, data_entrada, previsao_alta, data_alta, especialidade_id) VALUES (1, 2, 9, '2019-04-14', '2019-04-16', '2019-04-16',3),
(1, 2, 10, '2019-05-15', '2021-05-16', '2021-05-17', 3),
(3, 4, 8, '2020-04-20', '2020-04-22', '2020-04-25', 5),
(1, 2, 9, '2020-04-14', '2020-04-16', '2020-04-16', 3),
(2, 5, 3, '2021-03-14', '2021-03-16', '2021-03-16', 6),
(2, 1, 6, '2021-03-14', '2021-03-16', '2021-03-17', 1),
(1, 2, 4, '2021-03-14', '2021-03-16', '2021-04-16', 3);
-- Associando 2 enfermeiros para cada internação
INSERT INTO internacao_enfermeiro (id_internacao, id_enfermeiro) VALUES (1, 1), (1,2);
INSERT INTO internacao_enfermeiro (id_internacao, id_enfermeiro) VALUES (2, 3), (2,4);
INSERT INTO internacao_enfermeiro (id_internacao, id_enfermeiro) VALUES (3, 4), (3,5);
INSERT INTO internacao_enfermeiro (id_internacao, id_enfermeiro) VALUES (4, 6), (4,1);
INSERT INTO internacao_enfermeiro (id_internacao, id_enfermeiro) VALUES (5, 2), (5,3);
INSERT INTO internacao_enfermeiro (id_internacao, id_enfermeiro) VALUES (6, 4), (6,5);
INSERT INTO internacao_enfermeiro (id_internacao, id_enfermeiro) VALUES (7, 6), (7,1);
