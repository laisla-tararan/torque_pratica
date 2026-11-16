CREATE DATABASE IF NOT EXISTS oficina;
USE oficina;

CREATE TABLE usuarios(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE clientes(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(255) NOT NULL, 
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE veiculos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    placa VARCHAR(10) NOT NULL,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    ano INT

    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE agendamentos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    veiculo_id INT NOT NULL,
    data_agendamento DATETIME NOT NULL,
    servico VARCHAR(100),

    FOREIGN KEY (veiculo_id) REFERENCES veiculos(id)
);

INSERT INTO usuarios(nome, email, senha) VALUES (
    'Administrador', 
    'admin@oficina.com', 
    '$2b$10$RgOEXNrktGOCsLw36rKsleg6HUI/dpiqohS5uEGwHsMmCZAlGmqe2'
), (
    'Carlos Mecânico',
    'carlos@oficina.com',
    '$2b$10$RgOEXNrktGOCsLw36rKsleg6HUI/dpiqohS5uEGwHsMmCZAlGmqe2'
), (
    'Fernanda Atendente',
    'fernanda@oficina.com',
    '$2b$10$RgOEXNrktGOCsLw36rKsleg6HUI/dpiqohS5uEGwHsMmCZAlGmqe2'
);

INSERT INTO clientes(nome, cpf, telefone, email) VALUES (
    'João da Silva',
    'b9332f3140efaf757e4d684975ef3365',
    '11 90000-1111',
    'joao.silva@email.com'
), (
    'Maria Souza', 
    'be4f639df4cd927594a5e3084b540dc1',
    '11 90000-2222',
    'maria.souza@email.com'
), (
    'Pedro Oliveira',
    '65eea67226931d6bc95e431330183923',
    '11 90000-3333',
    'pedro.oliveira@email.com'
);

INSERT INTO veiculos(cliente_id, placa, marca, modelo, ano) VALUES (
    1, 'ABC1D23', 'Volkswagen', 'Gol', 2018
), (
    2, 'DEF4G56', 'Fiat', 'Uno', 1997
), (
    3, 'GHI7J89', 'Chevrolet', 'Onix', 2021
);

INSERT INTO agendamentos(veiculo_id, data_agendamento, servico) VALUES (
    2, '2026-11-05 09:00:00', 'Troca de Óleo'
), (
    1, '2026-11-15 14:00:00', 'Alinhamento e Balanceamento'
), (
    3, '2026-11-16 08:30:00', 'Revisão dos Freios'
);