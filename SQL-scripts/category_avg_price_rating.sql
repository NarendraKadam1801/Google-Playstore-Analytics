SELECT 
    c.CategoryName,
    AVG(a.Price) AS AvgPrice,
    AVG(a.Rating) AS AvgRating,
    COUNT(*) AS AppCount
FROM apps a
JOIN categories c ON a.CategoryID = c.CategoryID
GROUP BY c.CategoryName
ORDER BY AvgRating DESC;
