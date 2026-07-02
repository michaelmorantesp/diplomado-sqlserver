USE comercio;
GO
 
SELECT
    categoria, producto, valor,
    ROW_NUMBER() OVER (
        PARTITION BY categoria
        ORDER BY valor DESC
    ) AS posicion
FROM ventas
ORDER BY categoria, posicion;
GO
 
WITH ranking AS (
    SELECT
        categoria, producto, valor,
        ROW_NUMBER() OVER (
            PARTITION BY categoria
            ORDER BY valor DESC
        ) AS posicion
    FROM ventas
)
SELECT categoria, producto, valor, posicion
FROM ranking
WHERE posicion <= 3
ORDER BY categoria, posicion;
GO