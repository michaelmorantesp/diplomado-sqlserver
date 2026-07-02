/* ============================================================
   Diplomado en Estrategias de Datos: Python, SQL Server y Big Data
   Facultad de Estadistica, Universidad Santo Tomas
   Modulo 2, Sesion 2: Conceptos basicos de T-SQL
   Guion de preparacion del entorno: base de datos 'comercio'
 
   AVISO: los datos de este guion son SINTETICOS e ILUSTRATIVOS.
   No corresponden a cifras reales de ninguna entidad.
   ============================================================ */
 
DROP DATABASE IF EXISTS comercio;
GO
CREATE DATABASE comercio;
GO
USE comercio;
GO
 
-- Tabla de clientes: quien compra
CREATE TABLE clientes (
    cliente_id      INT          NOT NULL PRIMARY KEY,
    nombre          NVARCHAR(80) NOT NULL,
    ciudad          NVARCHAR(40) NULL,        -- puede faltar; util para COALESCE
    segmento        NVARCHAR(20) NOT NULL,
    fecha_registro  DATE         NOT NULL
);
GO
 
-- Tabla de ventas: que se vendio, cuando y por cuanto
CREATE TABLE ventas (
    venta_id    INT           NOT NULL PRIMARY KEY,
    cliente_id  INT           NOT NULL REFERENCES clientes(cliente_id),
    categoria   NVARCHAR(30)  NOT NULL,
    producto    NVARCHAR(40)  NOT NULL,
    valor       DECIMAL(12,2) NOT NULL,   -- en pesos, ilustrativo
    cantidad    INT           NOT NULL,
    fecha_venta DATE          NOT NULL
);
GO
 
-- Carga de clientes
INSERT INTO clientes VALUES (1, N'Ana Restrepo', N'Cali', N'Minorista', '2024-11-18');
INSERT INTO clientes VALUES (2, N'Carlos Gómez', NULL, N'Corporativo', '2024-04-15');
INSERT INTO clientes VALUES (3, N'Lucía Martínez', N'Medellín', N'Corporativo', '2025-08-21');
INSERT INTO clientes VALUES (4, N'Andrés Rojas', NULL, N'Corporativo', '2025-08-11');
INSERT INTO clientes VALUES (5, N'Marcela Díaz', NULL, N'Corporativo', '2025-09-04');
INSERT INTO clientes VALUES (6, N'Felipe Naranjo', NULL, N'Minorista', '2025-01-13');
INSERT INTO clientes VALUES (7, N'Diana Quintero', N'Cali', N'Corporativo', '2025-10-22');
INSERT INTO clientes VALUES (8, N'Jorge Patiño', N'Bucaramanga', N'Corporativo', '2025-02-26');
INSERT INTO clientes VALUES (9, N'Paula Castaño', N'Barranquilla', N'Minorista', '2024-02-02');
INSERT INTO clientes VALUES (10, N'Ricardo Vargas', N'Medellín', N'Gobierno', '2024-04-12');
INSERT INTO clientes VALUES (11, N'Sofía Mejía', N'Cartagena', N'Gobierno', '2024-06-14');
INSERT INTO clientes VALUES (12, N'Tomás Herrera', N'Bogotá', N'Minorista', '2024-11-22');
INSERT INTO clientes VALUES (13, N'Valentina Ríos', N'Bucaramanga', N'Gobierno', '2024-09-07');
INSERT INTO clientes VALUES (14, N'Óscar Lozano', N'Bogotá', N'Corporativo', '2025-04-25');
INSERT INTO clientes VALUES (15, N'Camila Suárez', N'Cartagena', N'Corporativo', '2024-08-10');
INSERT INTO clientes VALUES (16, N'Daniel Pérez', N'Cali', N'Minorista', '2025-12-23');
GO
 
-- Carga de ventas
INSERT INTO ventas VALUES (1, 7, N'Hogar', N'Juego de ollas', 733000, 3, '2026-05-21');
INSERT INTO ventas VALUES (2, 8, N'Tecnología', N'Portátil', 1632000, 6, '2026-03-06');
INSERT INTO ventas VALUES (3, 14, N'Moda', N'Bolso', 272000, 6, '2026-01-21');
INSERT INTO ventas VALUES (4, 9, N'Moda', N'Bolso', 177000, 4, '2026-06-10');
INSERT INTO ventas VALUES (5, 9, N'Tecnología', N'Teclado mecánico', 1487000, 1, '2026-01-15');
INSERT INTO ventas VALUES (6, 16, N'Alimentos', N'Miel', 37000, 3, '2026-02-04');
INSERT INTO ventas VALUES (7, 4, N'Hogar', N'Aspiradora', 502000, 4, '2026-05-27');
INSERT INTO ventas VALUES (8, 9, N'Alimentos', N'Café premium', 28000, 5, '2026-05-01');
INSERT INTO ventas VALUES (9, 15, N'Hogar', N'Aspiradora', 890000, 2, '2026-01-21');
INSERT INTO ventas VALUES (10, 9, N'Alimentos', N'Té orgánico', 164000, 1, '2026-01-28');
INSERT INTO ventas VALUES (11, 7, N'Alimentos', N'Miel', 147000, 3, '2026-02-23');
INSERT INTO ventas VALUES (12, 7, N'Moda', N'Bolso', 312000, 5, '2026-05-10');
INSERT INTO ventas VALUES (13, 8, N'Hogar', N'Cafetera', 231000, 1, '2026-06-21');
INSERT INTO ventas VALUES (14, 1, N'Hogar', N'Aspiradora', 352000, 4, '2026-01-21');
INSERT INTO ventas VALUES (15, 8, N'Moda', N'Chaqueta', 443000, 4, '2026-04-05');
INSERT INTO ventas VALUES (16, 13, N'Moda', N'Zapatos', 173000, 1, '2026-05-24');
INSERT INTO ventas VALUES (17, 3, N'Tecnología', N'Disco SSD', 2041000, 2, '2026-02-19');
INSERT INTO ventas VALUES (18, 14, N'Alimentos', N'Aceite de oliva', 96000, 2, '2026-03-12');
INSERT INTO ventas VALUES (19, 5, N'Alimentos', N'Aceite de oliva', 79000, 4, '2026-06-11');
INSERT INTO ventas VALUES (20, 10, N'Hogar', N'Cafetera', 660000, 6, '2026-06-09');
INSERT INTO ventas VALUES (21, 4, N'Hogar', N'Cafetera', 821000, 6, '2026-02-07');
INSERT INTO ventas VALUES (22, 10, N'Tecnología', N'Monitor', 1438000, 4, '2026-05-12');
INSERT INTO ventas VALUES (23, 2, N'Tecnología', N'Teclado mecánico', 2346000, 1, '2026-01-22');
INSERT INTO ventas VALUES (24, 16, N'Tecnología', N'Monitor', 829000, 3, '2026-02-17');
INSERT INTO ventas VALUES (25, 3, N'Alimentos', N'Té orgánico', 162000, 5, '2026-01-15');
INSERT INTO ventas VALUES (26, 9, N'Alimentos', N'Café premium', 56000, 2, '2026-04-26');
INSERT INTO ventas VALUES (27, 5, N'Moda', N'Chaqueta', 679000, 4, '2026-01-17');
INSERT INTO ventas VALUES (28, 1, N'Alimentos', N'Café premium', 111000, 3, '2026-02-21');
INSERT INTO ventas VALUES (29, 1, N'Hogar', N'Aspiradora', 208000, 6, '2026-04-04');
INSERT INTO ventas VALUES (30, 7, N'Alimentos', N'Miel', 96000, 3, '2026-04-09');
INSERT INTO ventas VALUES (31, 9, N'Hogar', N'Aspiradora', 424000, 1, '2026-02-02');
INSERT INTO ventas VALUES (32, 3, N'Alimentos', N'Chocolate', 59000, 6, '2026-02-28');
INSERT INTO ventas VALUES (33, 12, N'Moda', N'Chaqueta', 526000, 6, '2026-04-14');
INSERT INTO ventas VALUES (34, 9, N'Moda', N'Bolso', 198000, 6, '2026-02-10');
INSERT INTO ventas VALUES (35, 12, N'Moda', N'Camisa', 572000, 5, '2026-02-18');
INSERT INTO ventas VALUES (36, 5, N'Hogar', N'Juego de ollas', 805000, 2, '2026-04-13');
INSERT INTO ventas VALUES (37, 11, N'Moda', N'Camisa', 581000, 1, '2026-02-09');
INSERT INTO ventas VALUES (38, 3, N'Tecnología', N'Router', 1536000, 1, '2026-06-22');
INSERT INTO ventas VALUES (39, 4, N'Hogar', N'Juego de ollas', 241000, 4, '2026-02-02');
INSERT INTO ventas VALUES (40, 13, N'Tecnología', N'Teclado mecánico', 1812000, 3, '2026-05-10');
INSERT INTO ventas VALUES (41, 15, N'Hogar', N'Juego de ollas', 95000, 1, '2026-02-03');
INSERT INTO ventas VALUES (42, 9, N'Moda', N'Chaqueta', 325000, 5, '2026-05-22');
INSERT INTO ventas VALUES (43, 8, N'Tecnología', N'Monitor', 1038000, 5, '2026-05-10');
INSERT INTO ventas VALUES (44, 14, N'Alimentos', N'Café premium', 48000, 6, '2026-05-24');
INSERT INTO ventas VALUES (45, 9, N'Tecnología', N'Portátil', 2553000, 4, '2026-05-03');
INSERT INTO ventas VALUES (46, 10, N'Tecnología', N'Portátil', 1213000, 1, '2026-02-05');
INSERT INTO ventas VALUES (47, 8, N'Tecnología', N'Router', 1321000, 5, '2026-05-21');
INSERT INTO ventas VALUES (48, 12, N'Moda', N'Camisa', 185000, 6, '2026-03-20');
GO
 
-- Verificacion rapida de la carga
SELECT 'clientes' AS tabla, COUNT(*) AS filas FROM clientes
UNION ALL
SELECT 'ventas', COUNT(*) FROM ventas;
GO
