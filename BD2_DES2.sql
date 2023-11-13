CREATE DATABASE Mercado;

-- Utilização do Banco de Dados "Mercado"
USE Mercado;

-- Criação da Tabela "Seções"
CREATE TABLE Secoes (
    IDSecao INT PRIMARY KEY AUTO_INCREMENT,
    NomeSecao VARCHAR(50) NOT NULL,
    SalarioMedio DECIMAL(10, 2)
);

-- Criação da Tabela "Funcionarios"
CREATE TABLE Funcionarios (
    IDFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    NomeFuncionario VARCHAR(50) NOT NULL,
    IDSecao INT,
    Salario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (IDDepartamento) REFERENCES Departamentos(IDDepartamento)
);

-- Criação do Trigger
DELIMITER //
CREATE TRIGGER CalculaSalarioMedio
AFTER INSERT ON Funcionarios
FOR EACH ROW
BEGIN
    DECLARE totalSalario DECIMAL(10, 2);
    DECLARE totalFuncionarios INT;
    DECLARE novoSalarioMedio DECIMAL(10, 2);
    
    -- Calcula o total do salário do setor do novo funcionário
    SELECT SUM(Salario) INTO totalSalario
    FROM Funcionarios
    WHERE IDSecao = NEW.IDSecao;
    
    -- Conta o número de funcionários no seção
    SELECT COUNT(*) INTO totalFuncionarios
    FROM Funcionarios
    WHERE IDSecao = NEW.IDSecao;
    
    -- Calcula o novo salário médio
    IF totalFuncionarios > 0 THEN
        SET novoSalarioMedio = totalSalario / totalFuncionarios;
    ELSE
        SET novoSalarioMedio = 0;
    END IF;
    
    -- Atualiza a tabela "Departamentos" com o novo salário médio
    UPDATE Setores
    SET SalarioMedio = novoSalarioMedio
    WHERE IDSecao = NEW.IDSecao;
END;
//
DELIMITER ;

-- Exemplo de Inserção de Funcionário
INSERT INTO Funcionarios (NomeFuncionario, IDSecao, Salario) VALUES ('Rafael', 1, 1500.00);