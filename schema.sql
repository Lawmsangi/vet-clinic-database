/* Database schema to keep the structure of entire database. */

 CREATE TABLE animals(
    id INTEGER PRIMARY KEY,
    name TEXT,
    date_of_birth DATE, 
    escape_attempts INTEGER, 
    neutered BOOLEAN, 
    weight_kg DECIMAL,
    species VARCHAR(255) NOT NULL,
);

-- Add the "species" column to the "animals" table
ALTER TABLE animals
ADD COLUMN species VARCHAR(150);


--Create a table named owners with the following columns:
CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    age INTEGER
);

--Create a table named species with the following columns
CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

--Modify your inserted animals so it includes the species_id value
ALTER TABLE animals
RENAME COLUMN id TO animal_id;

ALTER TABLE animals
ADD id SERIAL;

UPDATE animals
SET id = animal_id;

ALTER TABLE animals
DROP COLUMN animal_id;

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INTEGER;

ALTER TABLE animals
ADD CONSTRAINT fk_1
FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals
ADD COLUMN owner_id INTEGER;

ALTER TABLE animals
ADD CONSTRAINT fk_2
FOREIGN KEY (owner_id) REFERENCES owners (id);