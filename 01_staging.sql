-- ================================================
-- 01_staging.sql
-- Create schemas and staging tables
-- ================================================

CREATE SCHEMA staging;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO

CREATE TABLE staging.imports_raw (
    CountryName VARCHAR(100),
    CountryCode VARCHAR(10),
    IndicatorName VARCHAR(200),
    IndicatorCode VARCHAR(50),
    [2000] VARCHAR(50), [2001] VARCHAR(50), [2002] VARCHAR(50),
    [2003] VARCHAR(50), [2004] VARCHAR(50), [2005] VARCHAR(50),
    [2006] VARCHAR(50), [2007] VARCHAR(50), [2008] VARCHAR(50),
    [2009] VARCHAR(50), [2010] VARCHAR(50), [2011] VARCHAR(50),
    [2012] VARCHAR(50), [2013] VARCHAR(50), [2014] VARCHAR(50),
    [2015] VARCHAR(50), [2016] VARCHAR(50), [2017] VARCHAR(50),
    [2018] VARCHAR(50), [2019] VARCHAR(50), [2020] VARCHAR(50),
    [2021] VARCHAR(50), [2022] VARCHAR(50), [2023] VARCHAR(50),
    [2024] VARCHAR(50)
);

CREATE TABLE staging.exports_raw (
    CountryName VARCHAR(100),
    CountryCode VARCHAR(10),
    IndicatorName VARCHAR(200),
    IndicatorCode VARCHAR(50),
    [2000] VARCHAR(50), [2001] VARCHAR(50), [2002] VARCHAR(50),
    [2003] VARCHAR(50), [2004] VARCHAR(50), [2005] VARCHAR(50),
    [2006] VARCHAR(50), [2007] VARCHAR(50), [2008] VARCHAR(50),
    [2009] VARCHAR(50), [2010] VARCHAR(50), [2011] VARCHAR(50),
    [2012] VARCHAR(50), [2013] VARCHAR(50), [2014] VARCHAR(50),
    [2015] VARCHAR(50), [2016] VARCHAR(50), [2017] VARCHAR(50),
    [2018] VARCHAR(50), [2019] VARCHAR(50), [2020] VARCHAR(50),
    [2021] VARCHAR(50), [2022] VARCHAR(50), [2023] VARCHAR(50),
    [2024] VARCHAR(50)
);
