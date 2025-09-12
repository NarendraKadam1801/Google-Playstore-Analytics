SELECT 
    a.AppName,
    a.Rating,
    a.RatingCount,
    a.MinInstalls,
    (a.RatingCount * 1.0 / NULLIF(a.MinInstalls,0)) AS RatingPerInstall
FROM apps a
WHERE (a.RatingCount * 1.0 / NULLIF(a.MinInstalls,0)) > 1
ORDER BY RatingPerInstall DESC;
