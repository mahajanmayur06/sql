USE my_db;

SELECT * FROM table2;
SELECT * FROM table2 ORDER BY col2 DESC;

SELECT DISTINCT col3 FROM table2;

SELECT * FROM table2 LIMIT 2 OFFSET 5; # limit is 5 entries and OFFSET is skip 5 entries

SELECT * FROM table2 ORDER BY col2 DESC LIMIT 1;

SELECT * FROM employees ORDER BY age ;
SELECT * FROM employees ORDER BY age DESC;

