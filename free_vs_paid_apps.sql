WITH category_stats AS (
    SELECT 
        c.CategoryName,
        CASE WHEN a.Free = 1 THEN 'Free' ELSE 'Paid' END AS AppType,
        AVG(a.Rating) AS AvgRating,
        SUM(a.MaxInstalls) AS TotalInstalls
    FROM apps a
    JOIN categories c ON a.CategoryID = c.CategoryID
    GROUP BY c.CategoryName, AppType
)
SELECT * FROM category_stats
ORDER BY CategoryName, AppType;
