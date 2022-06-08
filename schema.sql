/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(255),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal,
    PRIMARY KEY (id)
);

/*This adds the species column to the animals table*/

ALTER TABLE animals ADD species TEXT;

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name varchar(240),
    age INT
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name varchar (100),
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE;

ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_owner FOREIGN KEY (owner_id) REFERENCES owners(id) ON DELETE CASCADE;

/*Join Tables*/

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name varchar(100),
    age INT,
    date_of_graduation date
);

CREATE TABLE specialization (
    species_id INT,
    vet_id INT
);

CREATE TABLE visits (
    animal_id INT,
    vet_id INT,
    date_of_visit date
);

BEGIN;
ALTER TABLE visits
RENAME COLUMN animals_id TO animal_id;
ALTER TABLE visits
RENAME COLUMN vets_id TO vet_id;
ALTER TABLE visits
RENAME COLUMN date TO date_of_visit;
COMMIT;

-- Add an email column to your owners table
ALTER TABLE owners
ADD COLUMN email VARCHAR(120);
COMMIT;
