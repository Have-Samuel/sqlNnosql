/*Queries that provide answers to the questions from all projects.*/

/*return all data for Agumon, Gabumon, & Devimon*/
SELECT * FROM animals WHERE name LIKE '%mon%';

/*return all Gabumon and Devimon who were born btn 2016 - 2019*/
SELECT name FROM animals WHERE '[2016-01-01, 2019-12-31]'::daterange @> date_of_birth;

/*return Agumon and Gabumon*/
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;

/*Return 2020-02-03 & 2021-01-07*/
SELECT name, date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

/*return Pikachu | 1 & Devimon | 5*/
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

/*return all data for Agumon, Gabumon, and Devimon*/
SELECT * FROM animals WHERE neutered = TRUE;

/*return all data of Agumon, Pikachu, and Devimon*/
SELECT * FROM animals not name != 'Gabumon';

/*return all data of Pikachu and Devimon*/
SELECT * FROM animals WHERE weight_kg >=  10.4 AND weight_kg <= 17.3;

/*Return the total number of animals in the database*/
SELECT COUNT(*) FROM animals;

/*counts how many animals have tried to escape*/
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

/*provides the average weight of all animals*/
SELECT AVG(weight_kg) FROM animals;

/*Provides whether neutered or non-neutered animals escape the most and provides the attempts with group that escapes the most*/
SELECT neutered, SUM(escape_attempts) AS Total_Number_of_Escape_Attempts FROM animals WHERE escape_attempts > 0 GROUP BY neutered ORDER BY Total_Number_of_Escape_Attempts DESC LIMMIT 1;

/*provides minimum & maximum weight of each type of animal*/
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;

/*returns average number of escape attempts per animaltype born btn the yrs 1990 & 2000*/
SELECT species, AVG(escape_attempts) as Average_Escape_Attempts FROM animals WHERE date_of_birth > '1990-01-01' AND date_of_birth <= '2000-12-31' GROUP BY species;

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

SELECT 