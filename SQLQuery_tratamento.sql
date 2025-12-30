-- =============================================
-- Script de Criação da View de Clientes (Dimensão)
-- Objetivo: Normalizar dados geográficos dos clientes para análise por região.
-- =============================================
CREATE VIEW vw_dClientes AS
SELECT 
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix as CEP,
    customer_city as Cidade,
    customer_state as UF
FROM CUSTOMERS;


-- =============================================
-- Script de Criação da View de Produtos (Dimensão)
-- Objetivo: Tratar nomes de categorias nulos e selecionar atributos físicos.
-- =============================================
CREATE VIEW vw_dPRODUCTS AS
SELECT 
    p.product_id,
    ISNULL(p.product_category_name, 'Outros') as Categoria_Original,
    p.product_weight_g as Peso_g,
    p.product_length_cm as Comprimento_cm
FROM PRODUCTS p;


-- =============================================
-- Script de Criação da View de Calendário (Dimensão)
-- Objetivo: Gerar uma linha do tempo contínua (2016-2020) para inteligência temporal (Time Intelligence).
-- =============================================
CREATE VIEW vw_dCalendario AS
WITH Numeros AS (
    SELECT TOP (2000) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS N
    FROM sys.all_objects s1 CROSS JOIN sys.all_objects s2
),
Datas AS (
    SELECT DATEADD(DAY, N, CAST('2016-01-01' AS DATE)) AS Data
    FROM Numeros
    WHERE DATEADD(DAY, N, CAST('2016-01-01' AS DATE)) <= '2020-12-31'
)
SELECT 
    Data,
    YEAR(Data) AS Ano,
    MONTH(Data) AS Mes_Num,

    DATENAME(MONTH, Data) AS Nome_Mes,

    LEFT(DATENAME(MONTH, Data), 3) + '-' + RIGHT(CAST(YEAR(Data) AS VARCHAR), 2) AS Mes_Ano,

    DATEPART(QUARTER, Data) AS Trimestre,

    DATENAME(WEEKDAY, Data) AS Dia_Semana

FROM Datas;

