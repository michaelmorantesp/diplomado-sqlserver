USE comercio;
GO
 
SELECT
    venta_id, categoria, valor,
    IIF(valor >= 1000000, 'Alta', 'Estandar') AS franja
FROM ventas
ORDER BY valor DESC;
GO
 
SELECT
    venta_id, valor,
    CASE
        WHEN valor >= 1500000 THEN 'Premium'
        WHEN valor >= 500000  THEN 'Media'
        ELSE 'Basica'
    END AS clasificacion
FROM ventas
ORDER BY valor DESC;
GO
