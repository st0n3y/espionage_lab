DROP TABLE operations;
DROP TABLE countries;
DROP TABLE spies;

CREATE TABLE countries (
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE spies (
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE operations (
  id SERIAL4 primary key,
  country_id INT4 REFERENCES countries( id ),
  spy_id INT4 REFERENCES spies( id )
);