USE comercio;
GO
 
SELECT TOP (5) venta_id, categoria, producto, valor
FROM ventas
ORDER BY valor DESC;
GO

SELECT venta_id, categoria, producto, valor
FROM ventas
ORDER BY valor DESC
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;
GO