Difference between HAVING and WHERE clause
The difference between the HAVING and WHERE clause in SQL is that the WHERE clause can not be used with aggregates but the HAVING clause can. HAVING filters out groups of rows, created by 'GROUP BY' and WHERE filters out rows. Another way to think of it is that the HAVING clause is an additional filter to the WHERE clause.

HAVING supports aggregate functions as it has to work with groups of rows. so for example, if there are multiple integers in a group it can filter out the groups with a low average, a high total (sum) or count how many rows are in the group.

WHERE on the other hand deals with each row individually, so aggregate functions wouldn't work for what would you be aggregating.

Also, note syntax differences:

HAVING is after GROUP BY and WHERE is before GROUP BY changing the order will produce a syntax error.

SELECT
FROM
JOIN
  ON
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT


// ♥ sqlite3 pets_database.db 
SQLite version 3.24.0 2018-06-04 14:10:15
Enter ".help" for usage hints.
sqlite> CREATE TABLE cats (
   ...> id INTEGER PRIMARY KEY,
   ...> name TEXT,
   ...> age INTEGER,
   ...> breed TEXT,
   ...> net_worth INTEGER
   ...> );
sqlite> CREATE TABLE owners (id INTEGER PRIMARY KEY, name TEXT);
sqlite> CREATE TABLE cats_owners (
   ...> cat_id INTEGER,
   ...> owner_id INTEGER
   ...> );
sqlite> INSERT INTO cats (id, name, age, breed, net_worth) VALUES (1, "Maru", 3, "Scottish Fold", 1000000);
sqlite> INSERT INTO cats (id, name, age, breed, net_worth) VALUES (2, "Hana", 1, "Tabby", 21800);
sqlite> INSERT INTO cats (id, name, age, breed, net_worth) VALUES (3, "Grumpy Cat", 4, "Persian", 181600);
sqlite> INSERT INTO cats (id, name, age, breed, net_worth) VALUES (4, "Lil\' Bub", 2, "Tortoiseshell", 2000000);
sqlite> INSERT INTO owners (name) VALUES ("mugumogu");
sqlite> INSERT INTO owners (name) VALUES ("Sophie");
sqlite> INSERT INTO owners (name) VALUES ("Penny");
sqlite> INSERT INTO cats_owners (cat_id, owner_id) VALUES (2, 2);
sqlite> INSERT INTO cats_owners (cat_id, owner_id) VALUES (3, 3);
sqlite> INSERT INTO cats_owners (cat_id, owner_id) VALUES (1, 2);
sqlite> SELECT * FROM cats ORDER BY (net_worth) DESC;
4|Lil\' Bub|2|Tortoiseshell|2000000
1|Maru|3|Scottish Fold|1000000
3|Grumpy Cat|4|Persian|181600
2|Hana|1|Tabby|21800
sqlite> .headers on
sqlite> .mode column
sqlite> SELECT * FROM cats ORDER BY (net_worth) DESC;
id          name        age         breed          net_worth 
----------  ----------  ----------  -------------  ----------
4           Lil\' Bub   2           Tortoiseshell  2000000   
1           Maru        3           Scottish Fold  1000000   
3           Grumpy Cat  4           Persian        181600    
2           Hana        1           Tabby          21800     
sqlite> sqlite> SELECT * FROM cats WHERE net_worth > 0;
id          name        age         breed          net_worth 
----------  ----------  ----------  -------------  ----------
1           Maru        3           Scottish Fold  1000000   
2           Hana        1           Tabby          21800     
3           Grumpy Cat  4           Persian        181600    
4           Lil\' Bub   2           Tortoiseshell  2000000   
sqlite> SELECT * FROM cats ORDER BY(net_worth ) desc limit 1;
id          name        age         breed          net_worth 
----------  ----------  ----------  -------------  ----------
4           Lil\' Bub   2           Tortoiseshell  2000000   
sqlite> 

The GROUP BY() keyword is very similar to ORDER BY(). The only difference is that ORDER BY() sorts the resulting data set of basic queries while GROUP BY() sorts the result sets of aggregate functions.

sqlite> SELECT owners.name, SUM(cats.net_worth)
   ...> FROM owners
   ...> INNER JOIN cats_owners
   ...> ON owners.id = cats_owners.owner_id
   ...> JOIN cats ON cats_owners.cat_id = cats.id
   ...> GROUP BY owners.name;
name        SUM(cats.net_worth)
----------  -------------------
Penny       181600             
Sophie      1021800  