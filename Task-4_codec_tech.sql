#Selecting the required table from database.
select * from amazon;

#BackUp the data.
SELECT * FROM amazon
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/amazon_backup.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

#Simulate a Failure
DROP TABLE amazon;

#Restoring the table.
CREATE TABLE amazon (
  Order_ID VARCHAR(100),
  Order_Date VARCHAR(50),
  Ship_Date VARCHAR(50),
  EmailID VARCHAR(100),
  Geography VARCHAR(100),
  Category VARCHAR(100),
  Product_Name VARCHAR(255),
  Sales DOUBLE,
  Quantity DOUBLE,
  Profit VARCHAR(50)
);

#Loading the data.
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/amazon_backup.csv'
INTO TABLE amazon
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

#Verify the Recovery.
SELECT COUNT(*) FROM amazon;
SELECT * FROM amazon LIMIT 5;
