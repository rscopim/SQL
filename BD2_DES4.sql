REATE FUNCTION SomCliCad (dataCadastro DATE)
RETURNS INT
BEGIN
	DECLARE cliTot int;
	SET cliTot = (SELECT COUNT(*) FROM clientes WHERE data_cadastro = dataCadastro);
RETURN cliTot;
END: