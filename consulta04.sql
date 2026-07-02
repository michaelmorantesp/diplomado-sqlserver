USE comercio;
GO
 
SELECT
    GETDATE()                              AS ahora,
    DATEADD(DAY, 30, GETDATE())            AS en_30_dias,
    DATEDIFF(DAY, '2026-01-01', GETDATE()) AS dias_del_anio;
GO
 
SELECT
DATENAME(MONTH, fecha_venta) AS mes,
    COUNT(*)                     AS numero_ventas,
    SUM(valor)                   AS total
FROM ventas
GROUP BY DATENAME(MONTH, fecha_venta), MONTH(fecha_venta)
ORDER BY MONTH(fecha_venta);
GO