/*
 Main MSSQL query for hotel booking analysis
 Combines 2018–2020 booking data with market segment and meal cost lookups.
 Provided by user — formatted and commented.
*/

WITH grouped_table AS (
    SELECT * FROM [dbo].[2018$]
    UNION
    SELECT * FROM [dbo].[2019$]
    UNION
    SELECT * FROM [dbo].[2020$]
)
SELECT 
    g.*,
    m.segment_description,
    mc.cost_per_meal
FROM grouped_table g
LEFT JOIN [dbo].[market_segment$] m
    ON g.market_segment = m.market_segment
LEFT JOIN [dbo].[meal_cost$] mc
    ON mc.meal = g.meal;

/*
Notes to adapt:
- If your yearly tables are named differently, replace [2018$], [2019$], [2020$].
- Consider using UNION ALL if there are no duplicate rows; UNION removes duplicates and is slower.
- For large datasets, replace SELECT * with explicit column lists to improve performance.
*/
