CREATE DATABASE google_playstore_db;

USE google_playstore_db;

-- Raw Data Table
CREATE TABLE raw_csv_data (
    AppName VARCHAR(255),
    AppID VARCHAR(100),
    Category VARCHAR(100),
    Rating DECIMAL(3,2),
    RatingCount INT,
    Installs VARCHAR(50),
    MinInstalls INT,
    MaxInstalls INT,
    Free BOOLEAN,
    Price DECIMAL(6,2),
    Currency VARCHAR(10),
    Size VARCHAR(20),
    MinAndroid VARCHAR(50),
    DeveloperID VARCHAR(255),
    DeveloperWebsite VARCHAR(255),
    DeveloperEmail VARCHAR(255),
    Released VARCHAR(50),
    LastUpdated VARCHAR(50),
    ContentRating VARCHAR(50),
    PrivacyPolicy VARCHAR(255),
    AdSupported BOOLEAN,
    InAppPurchases BOOLEAN,
    EditorsChoice BOOLEAN,
    ScrapedTime VARCHAR(50)
);

-- Categories Table
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) UNIQUE
);

-- Developers Table
CREATE TABLE Developers (
    DeveloperID INT AUTO_INCREMENT PRIMARY KEY,
    DeveloperName VARCHAR(255),
    DeveloperWebsite VARCHAR(255),
    DeveloperEmail VARCHAR(255)
);

-- Apps Table
CREATE TABLE Apps (
    AppID INT PRIMARY KEY,
    AppName VARCHAR(255),
    CategoryID INT,
    DeveloperID INT,
    Rating DECIMAL(3,2),
    RatingCount INT,
    Installs VARCHAR(50),
    MinInstalls INT,
    MaxInstalls INT,
    Free BOOLEAN,
    Price DECIMAL(6,2),
    Currency VARCHAR(10),
    Size VARCHAR(20),
    MinAndroid VARCHAR(50),
    Released DATE,
    LastUpdated DATE,
    ContentRating VARCHAR(50),
    PrivacyPolicy VARCHAR(255),
    AdSupported BOOLEAN,
    InAppPurchases BOOLEAN,
    EditorsChoice BOOLEAN,
    ScrapedTime DATETIME,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (DeveloperID) REFERENCES Developers(DeveloperID)
);