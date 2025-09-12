-- Categories TableI
INSERT INTO google_playstore_db.categories (CategoryName)
SELECT DISTINCT Category
FROM google_playstore_db.raw_csv_data
WHERE Category IS NOT NULL AND Category <> '';

-- Developers Table
INSERT INTO Developers (DeveloperName, DeveloperWebsite, DeveloperEmail)
SELECT DISTINCT DeveloperID, DeveloperWebsite, DeveloperEmail
FROM raw_csv_data
WHERE DeveloperID IS NOT NULL;

-- Apps Table
INSERT IGNORE INTO Apps (
    AppName,
    PackageName,
    CategoryID,
    DeveloperID,
    Rating,
    RatingCount,
    Installs,
    MinInstalls,
    MaxInstalls,
    Free,
    Price,
    Currency,
    Size,
    MinAndroid,
    Released,
    LastUpdated,
    ContentRating,
    PrivacyPolicy,
    AdSupported,
    InAppPurchases,
    EditorsChoice,
    ScrapedTime
)
SELECT DISTINCT
    r.AppName,
    r.AppID,
    c.CategoryID,
    d.DeveloperID,
    NULLIF(r.Rating, '') + 0.0,
    CAST(r.RatingCount AS SIGNED),
    r.Installs,
    CAST(r.MinInstalls AS SIGNED),
    CAST(r.MaxInstalls AS SIGNED),
    CASE WHEN LOWER(r.Free) IN ('true','1','yes','free') THEN 1 ELSE 0 END,
    CAST(REPLACE(r.Price, '$','') AS DECIMAL(6,2)),
    r.Currency,
    r.Size,
    r.MinAndroid,

    -- Released
    CASE
        WHEN r.Released = '' THEN NULL
        WHEN r.Released REGEXP '^[0-9]+(\\.[0-9]+)?$' THEN DATE_ADD('1899-12-30', INTERVAL CAST(r.Released AS DECIMAL(10,5)) DAY)
        ELSE STR_TO_DATE(r.Released, '%m/%d/%Y')
    END,

    -- LastUpdated
    CASE
        WHEN r.LastUpdated = '' THEN NULL
        WHEN r.LastUpdated REGEXP '^[0-9]+(\\.[0-9]+)?$' THEN DATE_ADD('1899-12-30', INTERVAL CAST(r.LastUpdated AS DECIMAL(10,5)) DAY)
        ELSE STR_TO_DATE(r.LastUpdated, '%m/%d/%Y')
    END,

    r.ContentRating,
    r.PrivacyPolicy,

    CASE WHEN LOWER(r.AdSupported) IN ('true','1','yes') THEN 1 ELSE 0 END,
    CASE WHEN LOWER(r.InAppPurchases) IN ('true','1','yes') THEN 1 ELSE 0 END,
    CASE WHEN LOWER(r.EditorsChoice) IN ('true','1','yes') THEN 1 ELSE 0 END,

    -- ScrapedTime
    CASE
        WHEN r.ScrapedTime = '' THEN NULL
        WHEN r.ScrapedTime REGEXP '^[0-9]+(\\.[0-9]+)?$' THEN DATE_ADD('1899-12-30', INTERVAL CAST(r.ScrapedTime AS DECIMAL(10,5)) DAY)
        ELSE STR_TO_DATE(r.ScrapedTime, '%m/%d/%Y %H:%i:%s')
    END
FROM raw_csv_data r
LEFT JOIN Categories c ON r.Category = c.CategoryName
LEFT JOIN Developers d ON r.DeveloperID = d.DeveloperName;
