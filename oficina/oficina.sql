CREATE DATABASE oficina;

USE oficina;

show tables;

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(15),
    endereco VARCHAR(200)
);

CREATE TABLE Veiculo (
    idVeiculo INT PRIMARY KEY,
    idCliente INT,
    modelo VARCHAR(50),
    ano INT,
    placa VARCHAR(10),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Servico (
    idServico INT PRIMARY KEY,
    descricao VARCHAR(200),
    preco DECIMAL(10, 2)
);

CREATE TABLE ServicoVeiculo (
    idServicoVeiculo INT PRIMARY KEY,
    idVeiculo INT,
    idServico INT,
    dataAgendamento DATE,
    FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo),
    FOREIGN KEY (idServico) REFERENCES Servico(idServico)
);

CREATE TABLE Peca (
    idPeca INT PRIMARY KEY,
    descricao VARCHAR(200),
    estoque INT,
    preco DECIMAL(10, 2)
);

CREATE TABLE PecaServico (
    idPecaServico INT PRIMARY KEY,
    idServico INT,
    idPeca INT,
    quantidade INT,
    FOREIGN KEY (idServico) REFERENCES Servico(idServico),
    FOREIGN KEY (idPeca) REFERENCES Peca(idPeca)
);
