CREATE database CountryDB;
use CountryDB;

-- Create the Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population INT,
    Area INT
);

-- Insert rows into Country table
INSERT INTO Country (Id, Country_name, Population, Area)
VALUES
(1, 'India', 1400000000, 3287263),
(2, 'USA', 331000000, 9833517),
(3, 'China', 1440000000, 9596961),
(4, 'Brazil', 213000000, 8515770),
(5, 'Canada', 38000000, 9984670),
(6, 'Australia', 25600000, 7692024),
(7, 'Russia', 146000000, 17098246),
(8, 'Japan', 125800000, 377975),
(9, 'Germany', 83100000, 357022),
(10, 'France', 67000000, 551695);


-- Create the Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);



-- Insert rows into Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id)
VALUES
(1, 'John', 'Doe', 1000, 4.5, 1),
(2, 'Alice', 'Smith', 2000, 4.2, 2),
(3, 'Bob', 'Brown', 1500, 4.7, 3),
(4, 'Emma', 'Jones', 3000, 4.1, 4),
(5, 'Liam', 'Taylor', 2500, 4.6, 5),
(6, 'Sophia', 'Davis', 1800, 4.4, 6),
(7, 'Oliver', 'Wilson', 2200, 4.3, 7),
(8, 'Charlotte', 'Garcia', 1700, 4.8, 8),
(9, 'James', 'Martinez', 1200, 4.0, 9),
(10, 'Mia', 'Rodriguez', 1600, 4.9, 10);


# 1. Write an SQL query to print the first three characters of Country_name from the Country table.

select left(Country_name, 3) AS first_three_chrcts from country;


# 2. Write an SQL query to concatenate first name and last name from Persons table.

select concat(Fname, ' ',Lname) as concat_names from Persons;


# 3. Write an SQL query to count the number of unique country names from Persons table.

SELECT COUNT(DISTINCT Country_Id) AS Unique_Countries FROM Persons;

 # 4. Write a query to print the maximum population from the Country table.
 SELECT MAX(Population) AS Max_Population FROM Country;



# 5. Write a query to print the minimum population from Persons table. 
 SELECT min(Population) AS MIN_Population FROM Persons;

# 6. . Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id)
VALUES (11, 'Ella', NULL, 1900, 4.3, 1),
       (12, 'Noah', NULL, 2100, 4.4, 2);

SELECT COUNT(Lname) AS Non_Null_Lnames FROM Persons;


# 7. Write a query to find the number of rows in the Persons table.
SELECT COUNT(*) AS Total_Rows FROM Persons;

# 8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 
SELECT Population FROM Country LIMIT 3;

# 9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT)
SELECT * FROM Country ORDER BY RAND() LIMIT 3;

#10 . List all persons ordered by their rating in descending order. 
select * FROM Persons order by Rating desc;

#11.  Find the total population for each country in the Persons table
SELECT Country_Id, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_Id;

# 12. Find countries in the Persons table with a total population greater than 50,000 
SELECT Country_Id
FROM Persons
GROUP BY Country_Id
HAVING SUM(Population) > 1000;

# 13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.
SELECT Country_Id, COUNT(*) AS Total_Persons, AVG(Rating) AS Avg_Rating
FROM Persons
GROUP BY Country_Id
HAVING COUNT(*) > 1
ORDER BY Avg_Rating ASC;




