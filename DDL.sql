-- DDL Data Definition Language
/*
comment
*/
DROP TABLE classmates;
CREATE TABLE classmates (
    name TEXT,
    age INT,
    address TEXT
);

CREATE TABLE classmates (
    id INTEGER PRIMARY KEY,
    name TEXT not NULL,
    age INT not NULL,
    address TEXT not NULL
);

CREATE TABLE tests (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);
