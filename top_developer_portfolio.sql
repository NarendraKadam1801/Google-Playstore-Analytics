SELECT 
    d.DeveloperName,
    AVG(a.Rating) AS AvgDevRating,
    COUNT(*) AS AppCount
FROM developers d
JOIN apps a ON d.DeveloperID = a.DeveloperID
GROUP BY d.DeveloperName
HAVING COUNT(*) > 5
ORDER BY AvgDevRating DESC
LIMIT 10;