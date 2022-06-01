/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES (1, 'Agumon', '2020-02-03', 10.23, TRUE, 0);
INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES (2, 'Gabumon', '2018-11-15', 8, FALSE, 2);
INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES (3, 'Pikachu', '2021-01-07', 15.04, FALSE, 1 );
INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES (4, 'Devimon', '2017-05-12', 11, TRUE, 5);
INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES (5, 'Charmander', '2020-02-08', -11, FALSE, 0);
INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES (6, 'Plantmon', '2021-11-15', -5.7, TRUE, 2);
INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES (7, 'Squirtle', '1993-04-02', -12.13, FALSE, 3);
INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES (8, 'Angemon', '2005-06-12', -45, TRUE, 1);
INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES (9, 'Boarmon', '2005-06-07', 20.4, TRUE, 7);
INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES (10, 'Blossom', '1998-09-13', 17, TRUE, 3);
INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES (11, 'Ditto', '2022-05-14', 22, TRUE, 4);

/*Transaction*/
/*Add 'Unspecified' as Species for each animal in the entire table then ROLLBACK the change*/
BEGIN;
UPDATE animals SET species = 'unspecified'
ROLLBACK;

/*Set Species to DIGIMON and POKEMON for all named animals with 'mon' in the name. Then sets Species to POKEMON for each remaining animal without a special sset. 
This is a commit Transaction [permanentchange]*/
BEGIN;
UPDATE animals SET species = 'DIGIMON' WHERE name like '%mon%';
UPDATE animals SET species = 'POKEMON' WHERE species is NULL;
COMMIT;

/* Delete All records in the database, then rollback the delete to bring all of the data*/
BEGIN;
DELETE FROM animals;
ROLLBACK;

/*Deletes all animals born after January 1st 2022, 
makes a savepoint after the deletion,
updates all animals to the product of their weight_kg * -1,
rolls-back to the previous savepoint,
multiplies the weight of ONLY animals with negative weight_kg to the product of weightKG * -1.
This is a COMMIT Transaction (permanent change).
RESULT: All remaining animals have positive weight values*/

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;