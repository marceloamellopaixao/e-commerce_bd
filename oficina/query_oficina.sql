
USE oficina;

-- Inserção de dados fictícios na tabela Cliente
INSERT INTO Cliente (idCliente, nome, telefone, endereco)
VALUES
(1, 'João Silva', '(11) 1234-5678', 'Rua A, 123'),
(2, 'Maria Santos', '(22) 9876-5432', 'Avenida B, 456'),
(3, 'Carlos Ferreira', '(33) 5555-1234', 'Rua C, 789'),
(4, 'Ana Oliveira', '(44) 7777-9876', 'Avenida D, 101'),
(5, 'Pedro Almeida', '(55) 9999-5555', 'Rua E, 234'),
(6, 'Lúcia Pereira', '(66) 2222-3333', 'Avenida F, 567'),
(7, 'Fernando Costa', '(77) 8888-4444', 'Rua G, 890'),
(8, 'Mariana Souza', '(88) 1111-6666', 'Avenida H, 123'),
(9, 'Rafael Lima', '(99) 4444-1111', 'Rua I, 456'),
(10, 'Juliana Santos', '(00) 7777-2222', 'Avenida J, 789');

-- Inserção de dados fictícios na tabela Veiculo
INSERT INTO Veiculo (idVeiculo, idCliente, modelo, ano, placa)
VALUES
(1, 1, 'Fusca', 1980, 'ABC1234'),
(2, 1, 'Gol', 2015, 'XYZ5678'),
(3, 2, 'Civic', 2018, 'DEF9876'),
(4, 3, 'Palio', 2005, 'MNO3456'),
(5, 4, 'Corsa', 2010, 'JKL6789'),
(6, 5, 'Focus', 2020, 'PQR5432'),
(7, 6, 'Onix', 2017, 'STU9012'),
(8, 7, 'HB20', 2019, 'VWX7654'),
(9, 8, 'Uno', 2012, 'YZA8765'),
(10, 9, 'Fit', 2016, 'BCD2345');

-- Inserção de dados fictícios na tabela Servico
INSERT INTO Servico (idServico, descricao, preco)
VALUES
(1, 'Troca de óleo', 100.00),
(2, 'Revisão completa', 300.00),
(3, 'Alinhamento e balanceamento', 150.00),
(4, 'Troca de pastilhas de freio', 200.00),
(5, 'Lavagem completa', 50.00),
(6, 'Diagnóstico de motor', 80.00),
(7, 'Troca de filtro de ar', 40.00),
(8, 'Recarga de ar condicionado', 120.00),
(9, 'Polimento', 70.00),
(10, 'Reparo de suspensão', 180.00);

-- Inserção de dados fictícios na tabela ServicoVeiculo
INSERT INTO ServicoVeiculo (idServicoVeiculo, idVeiculo, idServico, dataAgendamento)
VALUES
(1, 1, 1, '2023-08-01'),
(2, 2, 2, '2023-08-05'),
(3, 3, 3, '2023-08-10'),
(4, 4, 4, '2023-08-15'),
(5, 5, 5, '2023-08-20'),
(6, 6, 6, '2023-08-25'),
(7, 7, 7, '2023-08-30'),
(8, 8, 8, '2023-09-02'),
(9, 9, 9, '2023-09-05'),
(10, 10, 10, '2023-09-10');

-- Inserção de dados fictícios na tabela Peca
INSERT INTO Peca (idPeca, descricao, estoque, preco)
VALUES
(1, 'Filtro de óleo', 50, 20.00),
(2, 'Pastilhas de freio', 30, 50.00),
(3, 'Lâmpada do farol', 100, 10.00),
(4, 'Correia dentada', 20, 70.00),
(5, 'Bateria', 40, 120.00),
(6, 'Amortecedor dianteiro', 15, 180.00),
(7, 'Sensor de temperatura', 60, 30.00),
(8, 'Embreagem completa', 10, 300.00),
(9, 'Radiador', 25, 150.00),
(10, 'Junta do cabeçote', 5, 250.00);

-- Inserção de dados fictícios na tabela PecaServico
INSERT INTO PecaServico (idPecaServico, idServico, idPeca, quantidade)
VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 4),
(4, 4, 4, 1),
(5, 5, 5, 1),
(6, 6, 6, 2),
(7, 7, 7, 3),
(8, 8, 8, 1),
(9, 9, 9, 2),
(10, 10, 10, 1);


-- Recuperações simples com SELECT Statement
SELECT nome FROM Cliente;

-- Filtros com WHERE Statement
SELECT modelo, ano FROM Veiculo WHERE ano > 2015;

-- Crie expressões para gerar atributos derivados
SELECT modelo, ano, CONCAT(modelo, ' - ', ano) AS DescricaoVeiculo FROM Veiculo;

-- Defina ordenações dos dados com ORDER BY
SELECT nome, telefone FROM Cliente ORDER BY nome;

-- Condições de filtros aos grupos – HAVING Statement
SELECT idCliente, COUNT(idVeiculo) AS TotalVeiculos
FROM Cliente
GROUP BY idCliente
HAVING TotalVeiculos >= 2;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
SELECT c.nome AS Cliente, v.modelo AS Veiculo, s.descricao AS Servico
FROM Cliente c
JOIN Veiculo v ON c.idCliente = v.idCliente
JOIN ServicoVeiculo sv ON v.idVeiculo = sv.idVeiculo
JOIN Servico s ON sv.idServico = s.idServico;
