CREATE TABLE projects (id INTEGER PRIMARY KEY,
title TEXT,
category TEXT,
funding_goal INT,
start_date TEXT,
end_date TEXT
);

CREATE TABLE users (id INTEGER PRIMARY KEY,
name TEXT,
age INT
);

CREATE TABLE pledges (id INTEGER PRIMARY KEY,
amount INT,
user_id INT,
project_id INT
);