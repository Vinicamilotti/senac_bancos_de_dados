USE hospital_db_vinicius;
CREATE TABLE medico (
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255),
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
    tempo_carencia DATETIME,
    telefone INT NOT NULL UNIQUE,
    email INT NOT NULL UNIQUE,
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
    receita TEXT,
    PRIMARY KEY(id),
    FOREIGN KEY (id_medico) REFERENCES medico(id),
    FOREIGN KEY (id_paciente) REFERENCES paciente(id),
    FOREIGN KEY (id_convenio) REFERENCES convenio(id)
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
    enfermeiro_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (quarto_id) REFERENCES quarto(id),
    FOREIGN KEY (medico_id) REFERENCES medico(id),
    FOREIGN KEY (paciente_id) REFERENCES paciente(id),
    FOREIGN KEY (enfermeiro_id) REFERENCES enfermeiro(id)
);
