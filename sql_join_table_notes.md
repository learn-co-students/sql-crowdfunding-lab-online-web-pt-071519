[21:34:06] (master) sql-join-tables-readme
// ♥ git remote add origin git@github.com:alouiscious/sql-join-tables.git
fatal: remote origin already exists.
[21:34:09] (master) sql-join-tables-readme
// ♥ git push -u origin master
remote: Permission to learn-co-curriculum/sql-join-tables-readme.git denied to alouiscious.
fatal: unable to access 'https://github.com/learn-co-curriculum/sql-join-tables-readme.git/': The requested URL returned error: 403
[21:34:20] (master) sql-join-tables-readme
// ♥ sqlite3 pets_database.db
SQLite version 3.24.0 2018-06-04 14:10:15
Enter ".help" for usage hints.
sqlite> CREATE TABLE cats (id INTEGER PRIMARY KEY, name TEXT, age INT, breed TEXT);
sqlite> CREATE TABLE owners (id INTEGER PRIMARY KEY, name TEXT);
sqlite> INSERT INTO owners (name) VALUES ("mugumogu");
sqlite> INSERT INTO owners (name) VALUES ("Sophie");
sqlite> INSERT INTO owners (name) VALUES ("Penny");
sqlite> INSERT INTO cats (name, age, breed) VALUES ("Maru", 3, "Scottish Fold");
sqlite> INSERT INTO cats (name, age, breed) VALUES ("Hana", 1, "Tabby");
sqlite> INSERT INTO cats (name, age, breed) VALUES ("Nona", 4, "Tortoiseshell");
sqlite> INSERT INTO cats (name, age, breed) VALUES ("Lil' Bub", 2, "perma-kitten");
sqlite> CREATE TABLE cats_owners (cat_id INT, owner_id INT);
sqlite> .SCHEMA
Error: unknown command or invalid arguments:  "SCHEMA". Enter ".help" for help
sqlite> .schema
CREATE TABLE cats (id INTEGER PRIMARY KEY, name TEXT, age INT, breed TEXT);
CREATE TABLE owners (id INTEGER PRIMARY KEY, name TEXT);
CREATE TABLE cats_owners (cat_id INT, owner_id INT);
sqlite> INSERT INTO cats_owners (cat_id, owner
sqlite> INSERT INTO cats_owners (cat_
id, owner_id) VALUES (3, 2);
sqlite> SELECT * FROM cats_owners ;
3|2
sqlite> . headers on
sqlite> .mode column
sqlite> SELECT * FROM cats_owners ;
cat_id      owner_id  
----------  ----------
3           2         
sqlite> INSERT INTO cats_owners (cat_id, owner_id) VALUES (3, 3);
sqlite> SELECT * FROM cats_owners ;  cat_id      owner_id  
----------  ----------
3           2         
3           3         
sqlite> INSERT INTO cats_owners (cat_id, owner_id) VALUES (1, 2);
sqlite> SELECT * FROM cats_owners ; cat_id      owner_id  
----------  ----------
3           2         
3           3         
1           2         
sqlite> SELECT cats_owners.owner_id FROM cats_owners WHERE cat_id = 3;
owner_id  
----------
2         
3         
sqlite> SELECT cats_owners.cat_id FROM cats_owners WHERE owner_id = 2;
cat_id    
----------
3         
1         
sqlite> SELECT owners.name FROM owners INNER JOIN cats_owners ON owners.id = cat_owners.owner_id WHERE cats.owners.cat_id = 3;
Error: no such column: cats.owners.cat_id
sqlite> SELECT owners.name FROM owners INNER JOIN cats_owners ON owners.id = cats_owners.owner_id WHERE cats.owners.cat_id = 3;
Error: no such column: cats.owners.cat_id
sqlite> SELECT owners.name 
   ...> FROM owners 
   ...> INNER JOIN cats_owners 
   ...> ON owners.id = cats_owners.owner_id WHERE cats_owners.cat_id = 3;
name      
----------
Sophie    
Penny     
sqlite> SELECT cats.name
   ...> FROM cats
   ...> INNER JOIN cats_owners
   ...> ON cats.id = cats_owners.cat_id
   ...> WHERE cats_owners.owner_id = 2;
name      
----------
Nona      
Maru      
sqlite> 