DROP DATABASE IF EXISTS ecommerce;

-- Criação do banco de dados para o cenário de E-commerce
CREATE DATABASE ecommerce;
USE ecommerce;

-- criar tabela dos clientes
CREATE TABLE clients (
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10),
    Minitial CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    CONSTRAINT unique_cpf_client UNIQUE(CPF),
    Address VARCHAR(30),
    dtBirth DATE NOT NULL
);

ALTER TABLE clients auto_increment=1;

-- criar tabela de produtos
-- size = dimensão do produto
CREATE TABLE product (
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(45) NOT NULL,
    Classification_kids BOOL DEFAULT FALSE,
    Category ENUM('Eletrônicos','Vestimentas','Brinquedos','Acessórios', 'Alimentos', 'Móveis', 'Livros') NOT NULL,
    productDescription VARCHAR(255),
    avaliation FLOAT DEFAULT 0,
    size VARCHAR(15),
    Pvalue FLOAT
);

-- criar tabela de pagamentos
CREATE TABLE payments (
    idPayment INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    typePayment ENUM('Cartão de Débito', 'Cartão de Crédito', 'PIX', 'Transferência Bancária', 'Boleto') DEFAULT 'PIX',
    limitAvailable FLOAT,
    CONSTRAINT fk_payments_client FOREIGN KEY (idClient) REFERENCES clients(idClient)
);

-- criar tabela de pedidos
CREATE TABLE orders (
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    orderStatus ENUM('Cancelado', 'Confirmado', 'Em andamento', 'Processando', 'Enviado', 'Entregue') DEFAULT 'Processando',
    orderDescription VARCHAR(255),
    Shipping FLOAT DEFAULT 10,
    VlProduct FLOAT,
    paymentCash BOOL DEFAULT FALSE,
    idOrderPayment INT,
    CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES clients(idClient),
    CONSTRAINT fk_orders_payments FOREIGN KEY (idOrderPayment) REFERENCES payments(idPayment)
);

-- criar tabela estoque
CREATE TABLE productStorage (
    idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
    storageLocation VARCHAR(255),
    quantity INT DEFAULT 0
);

-- criar tabela fornecedor
CREATE TABLE supplier (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    socialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    contact CHAR(11) NOT NULL,
    localSupplier VARCHAR(255),
    CONSTRAINT unique_cnpj_supplier UNIQUE(CNPJ)
);

-- criar tabela vendedor
CREATE TABLE seller (
    idSeller INT AUTO_INCREMENT PRIMARY KEY,
    socialName VARCHAR(255) NOT NULL,
    fantasyName VARCHAR(255),
    CNPJ CHAR(15),
    CPF CHAR(11),
    location VARCHAR(255),
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_cnpj_seller UNIQUE(CNPJ),
    CONSTRAINT unique_cpf_seller UNIQUE(CPF)
);

-- criar tabela produtos_vendedor
CREATE TABLE productSeller (
    idPseller INT,
    idProduct INT,
    Quantity INT DEFAULT 1,
    PRIMARY KEY (idPseller, idProduct),
    CONSTRAINT fk_product_seller FOREIGN KEY (idPseller) REFERENCES seller(idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
);

CREATE TABLE storageLocation (
    idLproduct INT,
    idLstorage INT,
    location VARCHAR(255),
    PRIMARY KEY (idLproduct, idLstorage),
    CONSTRAINT fk_storage_location_product FOREIGN KEY (idLproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_storage_location_storage FOREIGN KEY (idLstorage) REFERENCES productStorage(idProdStorage)
);

CREATE TABLE productSupplier (
    idPsSupplier INT,
    idPsProduct INT,
    quantity INT NOT NULL,
    PRIMARY KEY (idPsSupplier , idPsProduct),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier)
        REFERENCES supplier (idSupplier),
    CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPsProduct)
        REFERENCES product (idProduct)
);

desc productSupplier;

show tables;

show databases;

use information_schema;

show tables;

desc REFERENTIAL_CONSTRAINTS;

select * from referential_constraints where constraint_schema = 'ecommerce';