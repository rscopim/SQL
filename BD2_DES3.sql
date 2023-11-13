DELIMITER $$
CREATE PROCEDURE RelProdPorDia()
BEGIN
    SELECT
        DataCompra,
        COUNT(*) AS QuantProdComp
    FROM
        Compras
    GROUP BY
        DataCompra;
END;
$$
DELIMITER ;

CALL RelProdPorDia();