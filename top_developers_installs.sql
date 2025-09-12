CREATE VIEW TopDevelopers AS
SELECT 
    d.DeveloperName,
    SUM(a.MaxInstalls) AS TotalInstalls,
    AVG(a.Rating) AS AvgRating
FROM developers d
JOIN apps a ON d.DeveloperID = a.DeveloperID
GROUP BY d.DeveloperName;

Select * from TopDevelopers
Order by TotalInstalls desc;