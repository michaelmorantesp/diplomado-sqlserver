USE comercio;
GO
 
SELECT
    CAST(valor AS INT)                     AS valor_entero,
    CONVERT(VARCHAR(20), fecha_venta, 103) AS fecha_dd_mm_aaaa
FROM ventas
WHERE venta_id <= 5;
GO
 
SELECT
    TRY_CONVERT(INT, '1500') AS convierte_bien,
    TRY_CONVERT(INT, 'abc')  AS no_convierte;
GO
