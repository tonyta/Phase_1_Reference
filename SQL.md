SQL

SELECT    field
FROM      table
WHERE     condition
optional(GROUP BY field)
ORDER BY  ASC/DESC

Use SELECT DISTINCT to remove duplicate values from your returned table



Aggregates 
sum,count,max,min,avg
when using aggregates, include GROUP BY to divide results into buckets

TIP: When you use GROUP BY you need to replace WHERE with HAVING



JOINS

SELECT field
FROM table1 JOIN table2
ON table1.field = table2.field

ex. 
SELECT *
FROM artists JOIN albums
ON artists.id = albums.artist_id



NULL 

when comparing to NULL in a WHERE clause, put "value IS NULL" not "value = NULL"


SQLITE3

https://gist.github.com/alycit/340e49a09146231abca5


SUBQUERIES

http://www.1keydata.com/sql/sql-subquery.html



