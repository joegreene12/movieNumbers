CREATE DATABASE movienumbers;

\c movienumbers

CREATE TABLE movienumbers (id SERIAL PRIMARY KEY, title VARCHAR(255), yearRelease INTEGER, productionBudget MONEY, worldwideGross MONEY);
