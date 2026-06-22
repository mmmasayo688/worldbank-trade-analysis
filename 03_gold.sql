-- ================================================
-- 03_gold.sql
-- Create star schema and stored procedure
-- ================================================

-- dimCountry作成
CREATE TABLE gold.dimCountry (
    CountryKey BIGINT IDENTITY,
    CountryCode VARCHAR(10),
    CountryName VARCHAR(100)
);

INSERT INTO gold.dimCountry (CountryCode, CountryName)
SELECT DISTINCT CountryCode, CountryName
FROM silver.imports;

-- dimYear作成
CREATE TABLE gold.dimYear (
    YearKey BIGINT IDENTITY,
    Year INT
);

INSERT INTO gold.dimYear (Year)
SELECT DISTINCT Year
FROM silver.imports
ORDER BY Year;

-- factTrade作成
CREATE TABLE gold.factTrade (
    TradeKey BIGINT IDENTITY,
    CountryKey BIGINT,
    YearKey BIGINT,
    ImportValue FLOAT,
    ExportValue FLOAT,
    TradeBalance FLOAT
);

INSERT INTO gold.factTrade (CountryKey, YearKey, ImportValue, ExportValue, TradeBalance)
SELECT 
    c.CountryKey,
    y.YearKey,
    i.ImportValue,
    e.ExportValue,
    e.ExportValue - i.ImportValue AS TradeBalance
FROM silver.imports i
LEFT JOIN silver.exports e 
    ON i.CountryCode = e.CountryCode AND i.Year = e.Year
INNER JOIN gold.dimCountry c ON i.CountryCode = c.CountryCode
INNER JOIN gold.dimYear y ON i.Year = y.Year;

-- ストアドプロシージャ（増分ロード・MERGE）
CREATE PROCEDURE gold.usp_merge_factTrade
AS
BEGIN
    MERGE gold.factTrade AS target
    USING (
        SELECT 
            c.CountryKey,
            y.YearKey,
            i.ImportValue,
            e.ExportValue,
            e.ExportValue - i.ImportValue AS TradeBalance
        FROM silver.imports i
        LEFT JOIN silver.exports e 
            ON i.CountryCode = e.CountryCode AND i.Year = e.Year
        INNER JOIN gold.dimCountry c ON i.CountryCode = c.CountryCode
        INNER JOIN gold.dimYear y ON i.Year = y.Year
    ) AS source
    ON target.CountryKey = source.CountryKey 
    AND target.YearKey = source.YearKey
    WHEN MATCHED THEN
        UPDATE SET 
            target.ImportValue = source.ImportValue,
            target.ExportValue = source.ExportValue,
            target.TradeBalance = source.TradeBalance
    WHEN NOT MATCHED THEN
        INSERT (CountryKey, YearKey, ImportValue, ExportValue, TradeBalance)
        VALUES (source.CountryKey, source.YearKey, source.ImportValue, 
                source.ExportValue, source.TradeBalance);
END;
