-- Seed lookup tables (market_segment and meal_cost). Run in HotelBooking DB.

USE HotelBooking;
GO

-- market_segment$
MERGE INTO [dbo].[market_segment$] AS target
USING (VALUES
    ('Online TA', 'Online Travel Agencies'),
    ('Offline TA/TO', 'Offline Travel Agents / Tour Operators'),
    ('Direct', 'Direct Booking'),
    ('Corporate', 'Corporate')
) AS src (market_segment, segment_description)
ON target.market_segment = src.market_segment
WHEN NOT MATCHED THEN
    INSERT (market_segment, segment_description) VALUES (src.market_segment, src.segment_description);

-- meal_cost$
MERGE INTO [dbo].[meal_cost$] AS target
USING (VALUES
    ('BB', 15.00),
    ('HB', 25.00),
    ('FB', 35.00),
    ('SC', 10.00)
) AS src (meal, cost_per_meal)
ON target.meal = src.meal
WHEN NOT MATCHED THEN
    INSERT (meal, cost_per_meal) VALUES (src.meal, src.cost_per_meal);

-- Example: to bulk-load the provided CSV (data/sample.csv) you can use BULK INSERT or the Import Wizard.
-- Example BULK INSERT (Windows; adjust file path):
-- BULK INSERT [dbo].[2018$]
-- FROM 'C:\path\to\sample.csv'
-- WITH (
--   FIRSTROW = 2,
--   FIELDTERMINATOR = ',',
--   ROWTERMINATOR = '\n',
--   TABLOCK
-- );
