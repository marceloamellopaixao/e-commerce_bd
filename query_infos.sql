USE ecommerce;

SHOW TABLES;

-- Inserção de dados fictícios na tabela clients
INSERT INTO clients (Fname, Minitial, Lname, CPF, Address, dtBirth)
VALUES
    ('João', 'A.', 'Silva', '12345678901', 'Rua da Esperança, 123', '1990-05-15'),
    ('Maria', 'B.', 'Santos', '98765432101', 'Avenida das Flores, 456', '1985-09-10'),
    ('Pedro', 'C.', 'Ferreira', '65432198701', 'Praça Central, 789', '2000-02-20'),
    ('Ana', 'D.', 'Oliveira', '78901234501', 'Rua das Palmeiras, 567', '1998-07-08'),
    ('Carlos', 'E.', 'Almeida', '54321098701', 'Avenida Principal, 345', '1992-12-18'),
    ('Luciana', 'F.', 'Rocha', '78945612301', 'Travessa da Paz, 678', '1995-03-25'),
    ('Rafael', 'G.', 'Gomes', '98701234501', 'Rua das Estrelas, 901', '1987-11-30'),
    ('Isabela', 'H.', 'Melo', '67890123401', 'Avenida da Liberdade, 234', '2002-06-12'),
    ('Marcos', 'I.', 'Barros', '43210987601', 'Praça da Vitória, 567', '1993-08-28'),
    ('Laura', 'J.', 'Nunes', '89012345601', 'Rua das Margaridas, 890', '2001-04-05');

-- Inserção de dados fictícios na tabela product
INSERT INTO product (Pname, Classification_kids, Category, productDescription, avaliation, size, Pvalue)
VALUES
    ('Smartphone X', FALSE, 'Eletrônicos', 'Smartphone top de linha', 4.5, '5.7 polegadas', 1500.00),
    ('Camisa Casual', FALSE, 'Vestimentas', 'Camisa de algodão para uso diário', 3.8, 'M', 50.00),
    ('Boneca de Pelúcia', TRUE, 'Brinquedos', 'Boneca fofinha para crianças', 4.2, 'Pequeno', 25.00),
    -- Adicione mais produtos fictícios aqui
    ('Óculos de Sol', FALSE, 'Acessórios', 'Óculos de sol estilosos', 4.7, 'Único', 80.00),
    ('Chocolate ao Leite', TRUE, 'Alimentos', 'Tablete de chocolate cremoso', 4.0, '50g', 5.00),
    ('Sofá Reclinável', FALSE, 'Móveis', 'Sofá confortável com função reclinável', 4.9, 'Grande', 800.00),
    ('Livro de Aventura', TRUE, 'Livros', 'História emocionante cheia de ação', 4.6, 'Médio', 30.00),
    ('Fone de Ouvido Bluetooth', FALSE, 'Eletrônicos', 'Fone de ouvido sem fio de alta qualidade', 4.3, 'Único', 100.00),
    ('Sandália de Praia', TRUE, 'Vestimentas', 'Sandália confortável para a praia', 3.5, '38', 20.00),
    ('Bicicleta Infantil', TRUE, 'Brinquedos', 'Bicicleta colorida para crianças', 4.1, 'Pequeno', 70.00);

-- Inserir dados fictícios na tabela payments
INSERT INTO payments (idClient, typePayment, limitAvailable)
VALUES
    (1, 'Cartão de Crédito', 5000),
    (2, 'PIX', 300),
    (3, 'Boleto', 100),
    (4, 'PIX', 100),
    (5, 'Boleto', 100),
    (6, 'Cartão de Crédito', 100),
    (7, 'Cartão de Débito', 100),
    (8, 'Boleto', 100),
    (9, 'PIX', 100),
    (10, 'PIX', 100)
    
;

-- Inserir dados fictícios na tabela orders
INSERT INTO orders (idOrderClient, orderStatus, orderDescription, VlProduct)
VALUES
    (1, 'Confirmado', 'Pedido 1', 1500),
    (2, 'Processando', 'Pedido 2', 280),
    (3, 'Enviado', 'Pedido 3', 75),
    (4, 'Confirmado', 'Pedido 1', 1500),
    (5, 'Processando', 'Pedido 2', 280),
    (6, 'Enviado', 'Pedido 3', 75),
    (7, 'Confirmado', 'Pedido 1', 1500),
    (8, 'Processando', 'Pedido 2', 280),
    (9, 'Enviado', 'Pedido 3', 75),
    (10, 'Confirmado', 'Pedido 1', 1500)
;

-- Inserindo dados fictícios na tabela productStorage
INSERT INTO productStorage (storageLocation, quantity) VALUES
('Warehouse A', 100),
('Warehouse B', 50),
('Warehouse C', 75),
('Warehouse D', 120),
('Warehouse E', 90),
('Warehouse F', 30),
('Warehouse G', 85),
('Warehouse H', 60),
('Warehouse I', 110),
('Warehouse J', 40);

-- Inserindo dados fictícios na tabela supplier
INSERT INTO supplier (socialName, CNPJ, contact, localSupplier) VALUES
('Tech Inc.', '12345678901234', '9876543210', 'City A'),
('Fashion Ltd.', '98765432109876', '1234567890', 'City B'),
('Food Distributors', '65432101239876', '2345678901', 'City C'),
('Toy Manufacturers', '78901234560123', '3456789012', 'City D'),
('Furniture Emporium', '98765432106543', '4567890123', 'City E'),
('Book Publishers', '54321098760123', '5678901234', 'City F'),
('Gadget Innovations', '10987654321098', '6789012345', 'City G'),
('Sports Gear Co.', '87654321098765', '7890123456', 'City H'),
('Jewelry Creations', '54321098765432', '8901234567', 'City I'),
('Art Supplies Inc.', '87654321098765', '9012345678', 'City J');

-- Inserindo dados fictícios na tabela seller
INSERT INTO seller (socialName, fantasyName, CNPJ, CPF, location, contact) VALUES
('Electronics Seller', 'ElecSeller', '98765432101234', '12345678901', 'City C', '9876543210'),
('Clothing Seller', 'ClothSeller', '12345678909876', '98765432101', 'City D', '1234567890'),
('Toy Vendor', 'ToyShop', '54321098765432', '10987654321', 'City E', '8765432109'),
('Sports Shop', 'SportyStore', '21098765432109', '43210987654', 'City F', '7654321098'),
('Furniture Retailer', 'FurnitureMart', '43210987654321', '76543210987', 'City G', '6543210987'),
('Tech Gadgets', 'TechWizard', '76543210987654', '87654321098', 'City H', '5432109876'),
('Bookstore', 'BookHaven', '10987654321098', '76543210987', 'City I', '4321098765'),
('Jewelry Boutique', 'GemGalore', '43210987654321', '54321098765', 'City J', '3210987654'),
('Art Supplies Shop', 'ArtisticHues', '76543210987654', '65432109876', 'City K', '2109876543'),
('Food Market', 'FoodFiesta', '21098765432109', '98765432101', 'City L', '1098765432');

-- Inserindo dados fictícios na tabela productSeller
INSERT INTO productSeller (idPseller, idProduct, Quantity) VALUES
(1, 1, 10),
(1, 2, 15),
(2, 3, 8),
(2, 4, 12),
(3, 5, 25),
(3, 6, 18),
(4, 7, 30),
(4, 8, 22),
(5, 9, 40),
(5, 10, 35);

-- Inserindo dados fictícios na tabela storageLocation
INSERT INTO storageLocation (idLproduct, idLstorage, location) VALUES
(1, 1, 'Rack A'),
(1, 2, 'Rack B'),
(2, 3, 'Shelf A'),
(2, 4, 'Shelf B'),
(3, 5, 'Cabinet A'),
(3, 6, 'Cabinet B'),
(4, 7, 'Drawer A'),
(4, 8, 'Drawer B'),
(5, 9, 'Box A'),
(5, 10, 'Box B');

-- Inserindo dados fictícios na tabela productSupplier
INSERT INTO productSupplier (idPsSupplier, idPsProduct, quantity) VALUES
(1, 1, 100),
(1, 2, 150),
(2, 3, 80),
(2, 4, 120),
(3, 5, 250),
(3, 6, 180),
(4, 7, 300),
(4, 8, 220),
(5, 9, 400),
(5, 10, 350);

-- Mostrando os dados de cada tabela
SELECT * FROM clients;
SELECT * FROM product;
SELECT * FROM payments;
SELECT * FROM orders;
SELECT * FROM productStorage;
SELECT * FROM supplier;
SELECT * FROM seller;
SELECT * FROM productSeller;
SELECT * FROM storageLocation;
SELECT * FROM productSupplier;