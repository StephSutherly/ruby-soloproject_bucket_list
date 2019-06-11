-- DROP TABLE languages_countries;
DROP TABLE attractions;
DROP TABLE cities;
DROP TABLE countries;
DROP TABLE languages;

CREATE TABLE languages
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  can_speak BOOLEAN
);

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

CREATE TABLE attractions
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null,
  city_id INT8 REFERENCES cities(id),
  review TEXT
);

-- CREATE TABLE languages_countries
-- (
--   id SERIAL8 PRIMARY KEY,
--   language_id INT8 REFERENCES languages(id),
--   country_id INT8 REFERENCES countries(id)
-- );
