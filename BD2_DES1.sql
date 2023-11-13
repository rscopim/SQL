CREATE TABLE Fabricantes (
    id_fabricante INT AUTO_INCREMENT PRIMARY KEY,
    nome_fabricante VARCHAR(50) NOT NULL,
    pais_origem VARCHAR(50)
);

CREATE TABLE Carros (
    id_carro INT AUTO_INCREMENT PRIMARY KEY,
    modelo_carro VARCHAR(50) NOT NULL,
    ano_fabricacao INT,
    preco DECIMAL(10, 2),
    fabricante_id INT,
    FOREIGN KEY (fabricante_id) REFERENCES Fabricantes(id_fabricante)
);

INSERT INTO Fabricantes (nome_fabricante, pais_origem) VALUES
    ('Toyota', 'Japão'),
    ('Ford', 'EUA'),
    ('Volkswagen', 'Alemanha');


INSERT INTO Carros (modelo_carro, ano_fabricacao, preco, fabricante_id) VALUES
    ('Hilux', 2018, 150000.00, 1),
    ('Focus', 2019, 55000.00, 2),
    ('Fox', 2020, 45000.00, 3);


SELECT Carros.modelo_carro, Carros.ano_fabricacao, Carros.preco, Fabricantes.nome_fabricante
FROM Carros
JOIN Fabricantes ON Carros.fabricante_id = Fabricantes.id_fabricante;

SELECT * FROM Fabricantes, Carros;
Comment