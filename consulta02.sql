USE comercio;
GO
 
DECLARE @umbral DECIMAL(12,2) = 500000;
 
SELECT venta_id, categoria, producto, valor
FROM ventas
WHERE valor > @umbral
ORDER BY valor DESC;
GO
