-- ================================================
-- 02_silver.sql
-- Transform staging data to silver (UNPIVOT)
-- ================================================

-- 輸入データを縦持ちに変換
SELECT 
    CountryName,
    CountryCode,
    CAST(Year AS INT) AS Year,
    CAST(REPLACE(Value, ',', '') AS FLOAT) AS ImportValue
INTO silver.imports
FROM staging.imports_raw
UNPIVOT (
    Value FOR Year IN (
        [2000],[2001],[2002],[2003],[2004],[2005],
        [2006],[2007],[2008],[2009],[2010],[2011],
        [2012],[2013],[2014],[2015],[2016],[2017],
        [2018],[2019],[2020],[2021],[2022],[2023],[2024]
    )
) AS unpvt
WHERE Value IS NOT NULL;

-- 輸出データを縦持ちに変換
SELECT 
    CountryName,
    CountryCode,
    CAST(Year AS INT) AS Year,
    CAST(REPLACE(Value, ',', '') AS FLOAT) AS ExportValue
INTO silver.exports
FROM staging.exports_raw
UNPIVOT (
    Value FOR Year IN (
        [2000],[2001],[2002],[2003],[2004],[2005],
        [2006],[2007],[2008],[2009],[2010],[2011],
        [2012],[2013],[2014],[2015],[2016],[2017],
        [2018],[2019],[2020],[2021],[2022],[2023],[2024]
    )
) AS unpvt
WHERE Value IS NOT NULL;
