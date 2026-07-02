USE comercio;
GO
 
WITH totales_categoria AS (
    SELECT
        categoria,
        SUM(valor) AS total,
        COUNT(*)   AS numero_ventas
    FROM ventas
    GROUP BY categoria
)
SELECT categoria, total, numero_ventas
FROM totales_categoria
WHERE total > 1000000
ORDER BY total DESC;
GO