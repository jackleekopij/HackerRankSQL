/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
SELECT CITY.Name
    FROM CITY
    LEFT JOIN COUNTRY
    ON CITY.CountryCode = COUNTRY.Code
    WHERE COUNTRY.Continent ='Africa'
