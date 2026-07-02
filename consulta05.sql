USE comercio;
GO
 
SELECT
    nombre,
    UPPER(nombre)                            AS en_mayusculas,
    LEN(nombre)                              AS longitud,
  LEFT(nombre, CHARINDEX(' ', nombre) - 1) AS primer_nombre
FROM clientes;
GO