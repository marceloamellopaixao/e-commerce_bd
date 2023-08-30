DROP DATABASE oficina;

-- cria o banco de dados da oficina
CREATE DATABASE oficina;

-- utiliza o banco de dados da oficina
USE oficina;

-- mostra as tabelas disponíveis
SHOW tables;

-- criar a tabela do cliente
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    cPnome VARCHAR(15) not null,
	cNomeMeio VARCHAR(15) not null,
	cSobrenome VARCHAR(15) not null,
    telefone CHAR(15) not null,
    endereco VARCHAR(255) not null
);

-- criar a tabela do veiculo
CREATE TABLE Veiculo (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    modelo VARCHAR(50) not null,
    ano INT  not null,
    placa CHAR(10) not null,
    CONSTRAINT fk_cliente_veiculo FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- criar a tabela do serviço
CREATE TABLE Servico (
    idServico INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(200) default 'Orçando',
    preco DECIMAL(10, 2) default 0
);

-- criar a tabela do serviço_veiculo
CREATE TABLE ServicoVeiculo (
    idServicoVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    idVeiculo INT,
    idServico INT,
    dataAgendamento DATE not null,
    CONSTRAINT fk_veiculo_servicoVeiculo FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo),
    CONSTRAINT fk_servico_servicoVeiculo FOREIGN KEY (idServico) REFERENCES Servico(idServico)
);

-- criar a tabela da peça
CREATE TABLE Peca (
    idPeca INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(200),
    estoque INT default 1,
    preco DECIMAL(10, 2) default 0
);

-- criar a tabela da peça_serviço
CREATE TABLE ServicoPeca (
    idPecaServico INT AUTO_INCREMENT PRIMARY KEY,
    idServico INT,
    idPeca INT,
    quantidade INT default 0,
    CONSTRAINT fk_servico_pecaServico FOREIGN KEY (idServico) REFERENCES Servico(idServico),
    CONSTRAINT fk_peca_pecaServico FOREIGN KEY (idPeca) REFERENCES Peca(idPeca)
);
