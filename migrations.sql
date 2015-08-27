CREATE DATABASE movienumbers;

\c movienumbers

CREATE TABLE movies (id SERIAL PRIMARY KEY, title VARCHAR(255), yearRelease INTEGER, productionBudget MONEY, worldwideGross MONEY);
