SELECT 
    CategoryName,
    AppName,
    Rating,
    RankInCategory
FROM (
    SELECT 
        c.CategoryName,
        a.AppName,
        a.Rating,
        RANK() OVER (PARTITION BY a.CategoryID ORDER BY a.Rating DESC, a.RatingCount DESC) AS RankInCategory
    FROM apps a
    JOIN categories c ON a.CategoryID = c.CategoryID
    WHERE a.Rating IS NOT NULL
) ranked
WHERE RankInCategory <= 3;
