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

--Create a table named vets
CREATE TABLE vets ( 
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INTEGER NOT NULL,
    date_of_graduation DATE NOT NULL
);

--Create a "join table" called specializations to handle this relationship.
CREATE TABLE specializations (
  vet_id INTEGER,
  species_id INTEGER
);

ALTER TABLE specializations
ADD CONSTRAINT fk_3
FOREIGN KEY (vet_id) REFERENCES vets (id);

ALTER TABLE specializations
ADD CONSTRAINT fk_4
FOREIGN KEY (species_id) REFERENCES species (id);

--Create a "join table" called visits to handle this relationship, it should also keep track of the date of the visit.
CREATE TABLE visits (
    animal_id INTEGER,
    vet_id INTEGER,
    date_of_visit DATE NOT NULL
);

ALTER TABLE visits
ADD CONSTRAINT fk_5
FOREIGN KEY (vet_id) REFERENCES vets (id);

ALTER TABLE visits
ADD CONSTRAINT fk_6
FOREIGN KEY (animal_id) REFERENCES animals (id);

ALTER TABLE animals
ADD PRIMARY KEY (id);