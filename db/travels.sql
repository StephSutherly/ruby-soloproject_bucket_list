DROP TABLE cities;
DROP TABLE countries;

CREATE TABLE countries
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null,
  -- add a flag/picture?
  visits_to_country INT4,
  has_visited_country BOOLEAN
);

CREATE TABLE cities
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null,
  visits_to_city INT4,
  has_visited_city BOOLEAN,
  country_id INT8 REFERENCES countries(id)
);
