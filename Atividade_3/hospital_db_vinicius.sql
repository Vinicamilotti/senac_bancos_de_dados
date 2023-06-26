CREATE DATABASE hospital_db_vinicius_at3;
USE hospital_db_vinicius_at3;
CREATE TABLE medico (
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255),
    crm VARCHAR(13) UNIQUE NOT NULL,
    PRIMARY KEY (id)
    );
CREATE TABLE especialidade (
	id INT NOT NULL AUTO_INCREMENT,
    especialidade VARCHAR(255) UNIQUE,
	PRIMARY KEY (id)
    );
CREATE TABLE especialista (
	medico_id INT NOT NULL,
    especialidade_id INT NOT NULL,
    PRIMARY KEY (medico_id, especialidade_id),
    FOREIGN KEY (medico_id) REFERENCES medico(id),
    FOREIGN KEY (especialidade_id) REFERENCES especialidade(id)
);

CREATE TABLE convenio (
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL UNIQUE,
    cnpj INT NOT NULL UNIQUE,
    PRIMARY KEY(id)
); 

CREATE TABLE paciente (
	id INT NOT NULL AUTO_INCREMENT,
    cpf INT NOT NULL UNIQUE,
    rg VARCHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(255) NOT NULL,
    convenio_id INT,
    tempo_carencia DATE,
    telefone INT NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY (id),
    FOREIGN KEY (convenio_id) REFERENCES convenio(id)
);

CREATE TABLE consultas (
	id INT NOT NULL AUTO_INCREMENT,
    id_medico INT NOT NULL,
    id_paciente INT NOT NULL,
    id_convenio INT,
    carteirinha INT,
    data_consulta DATETIME NOT NULL,
    valor DECIMAL(9,2) NOT NULL,
    id_especialidade INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (id_medico) REFERENCES medico(id),
    FOREIGN KEY (id_paciente) REFERENCES paciente(id),
    FOREIGN KEY (id_convenio) REFERENCES convenio(id) ON DELETE CASCADE,
	FOREIGN KEY (id_especialidade) REFERENCES especialidade(id) 
);
CREATE TABLE prescricoes (
	id INT NULL AUTO_INCREMENT,
    remedio VARCHAR(255) NOT NULL,
    id_consulta INT NOT NULL,
    PRIMARY KEY (id, id_consulta),
    FOREIGN KEY (id_consulta) REFERENCES consultas(id)
);

CREATE TABLE tipo_quarto (
	id INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(255) NOT NULL,
    valor REAL(9,2) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE quarto (
	id INT NOT NULL AUTO_INCREMENT,
    id_tipo_quarto INT NOT NULL,
    numero INT NOT NULL,
    PRIMARY KEY(id, numero),
    FOREIGN KEY (id_tipo_quarto) REFERENCES tipo_quarto(id)
);

CREATE TABLE enfermeiro (
   	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cre INT NOT NULL UNIQUE,
    cpf INT NOT NULL UNIQUE,
    PRIMARY KEY(id)
);

CREATE TABLE internacao (
 	id INT NOT NULL AUTO_INCREMENT,
    quarto_id INT NOT NULL,
    medico_id INT NOT NULL,
    paciente_id INT NOT NULL,
    data_entrada DATETIME NOT NULL,
    previsao_alta DATETIME NOT NULL,
    data_alta DATETIME,
    especialidade_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (quarto_id) REFERENCES quarto(id),
    FOREIGN KEY (medico_id) REFERENCES medico(id),
    FOREIGN KEY (paciente_id) REFERENCES paciente(id),
    FOREIGN KEY (especialidade_id) REFERENCES especialidade(id)
);
CREATE TABLE internacao_enfermeiro (
	id_internacao INT NOT NULL,
    id_enfermeiro INT NOT NULL,
    PRIMARY KEY(id_internacao, id_enfermeiro),
    FOREIGN KEY (id_internacao) REFERENCES internacao(id),
	FOREIGN KEY (id_enfermeiro) REFERENCES enfermeiro(id)
)