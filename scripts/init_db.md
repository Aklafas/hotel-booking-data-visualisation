# Init DB - step-by-step (commands and guidance)

## 1) Create the database
-- Run in SQL Server Management Studio (SSMS) or via sqlcmd:
CREATE DATABASE HotelBooking;
GO

## 2) Apply schema
-- Using sqlcmd (example; replace server and auth as appropriate):
-- Windows Integrated auth:
sqlcmd -S localhost -E -d master -i sql/schema.sql

-- SQL auth:
sqlcmd -S localhost -U SA -P 'YourStrong!Passw0rd' -d master -i sql/schema.sql

## 3) Seed lookup tables
sqlcmd -S localhost -E -d HotelBooking -i sql/seed.sql

## 4) Load CSV into yearly table
-- Option A: Use SSMS Import Wizard (Recommended for beginners)
-- Option B: BULK INSERT (example; adjust path and permissions)
BULK INSERT [dbo].[2018$]
FROM 'C:\path\to\data\sample.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  TABLOCK
);

Notes:
- BULK INSERT requires the SQL Server service account to have file system access.
- If BULK INSERT fails, use SSMS Import Wizard or Azure Data Studio's Import feature.
