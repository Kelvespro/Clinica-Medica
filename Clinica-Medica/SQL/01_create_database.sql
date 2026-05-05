-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS clinica_medica;
USE clinica_medica;

-- Tabela de especialidades
CREATE TABLE especialidade (
    id_especialidade INT PRIMARY KEY AUTO_INCREMENT,
    nome_especialidade VARCHAR(100) NOT NULL,
    descricao TEXT
);

-- Tabela de médicos
CREATE TABLE medico (
    id_medico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    crm VARCHAR(20) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    id_especialidade INT,
    FOREIGN KEY (id_especialidade) REFERENCES especialidade(id_especialidade)
);

-- Tabela de pacientes
CREATE TABLE paciente (
    id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    sexo CHAR(1),
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(255),
    cpf VARCHAR(14) UNIQUE
);

-- Tabela de consultas
CREATE TABLE consulta (
    id_consulta INT PRIMARY KEY AUTO_INCREMENT,
    data_hora DATETIME NOT NULL,
    status ENUM('agendada', 'realizada', 'cancelada') DEFAULT 'agendada',
    motivo TEXT,
    diagnostico TEXT,
    id_paciente INT,
    id_medico INT,
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
);

-- Tabela de exames
CREATE TABLE exame (
    id_exame INT PRIMARY KEY AUTO_INCREMENT,
    nome_exame VARCHAR(100) NOT NULL,
    data_realizacao DATE,
    resultado TEXT,
    arquivo_url VARCHAR(255),
    id_consulta INT,
    FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta)
);

-- Tabela de prescrições
CREATE TABLE prescricao (
    id_prescricao INT PRIMARY KEY AUTO_INCREMENT,
    medicamento VARCHAR(100) NOT NULL,
    dosagem VARCHAR(50),
    instrucoes TEXT,
    data_prescricao DATE,
    id_consulta INT,
    FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta)
);
