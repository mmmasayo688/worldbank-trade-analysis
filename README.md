# World Bank Trade Analysis - Microsoft Fabric Portfolio

## Overview
A Microsoft Fabric data engineering project that analyzes global merchandise trade (exports and imports) across 266 countries using a modern data warehouse architecture.

### Technology Stack
Microsoft Fabric Warehouse | Data Factory | T-SQL | Power BI

## Objective
To design and implement a scalable trade analytics platform using Microsoft Fabric, covering data ingestion, transformation, dimensional modeling, and reporting.

## Data Source
- World Bank Open Data: Merchandise exports (current US$)
- World Bank Open Data: Merchandise imports (current US$)
- Period: 2000-2024

## Architecture
Medallion Architecture (Bronze / Silver / Gold)

### Bronze
- Raw CSV files from World Bank

### Silver
- T-SQL UNPIVOT: Wide format → Long format
- Data type conversion

### Gold
- dimCountry
- dimYear
- factTrade (ImportValue / ExportValue / TradeBalance)

## Pipeline
- Copy Data × 2 (imports + exports → staging)
- Stored Procedure (MERGE for incremental load)
- Fully automated end-to-end pipeline

## Technical Highlights
* Designed and implemented an end-to-end data platform using Microsoft Fabric, from raw data ingestion to Power BI reporting
* Implemented Medallion Architecture (Bronze / Silver / Gold) in Microsoft Fabric Warehouse
* Built automated data ingestion pipelines using Data Factory Copy Data activities
* Transformed World Bank trade datasets from wide to long format using T-SQL UNPIVOT
* Designed and implemented a star schema data model (dimCountry, dimYear, factTrade)
* Developed incremental loading processes using T-SQL MERGE stored procedures
* Enabled scalable analytical reporting through dimensional modeling and curated Gold-layer datasets

## Visualization
<img src="screenshots/Balance.PNG" width="600">
<img src="screenshots/export.PNG" width="600">
<img src="screenshots/import.PNG" width="600">

## Data Model
<img src="er_diagram.png" width="600">

## Pipeline Design
<img src="pipeline.png" width="600">

## Business Insights
- Arab countries show significant trade dips in 2008, 2015, and 2020, closely reflecting global oil price fluctuations.
- Trade activity in several Arab countries remained below pre-2020 levels in 2024, potentially reflecting ongoing geopolitical uncertainty.
- US exports continued to grow despite geopolitical tensions with China.
- China shows the highest export growth among all countries from 2000 to 2024.
