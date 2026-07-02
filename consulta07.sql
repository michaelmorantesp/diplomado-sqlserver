USE comercio;
GO
 
SELECT
    nombre,
    ciudad                       AS ciudad_original,
    COALESCE(ciudad, 'Sin dato') AS ciudad_corregida
FROM clientes;
GO
 
SELECT
    nombre,
    ISNULL(ciudad, 'No registrada') AS ciudad
FROM clientes
WHERE ciudad IS NULL;
GO
