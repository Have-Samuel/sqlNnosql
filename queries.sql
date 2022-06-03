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

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(name) AS animals FROM animals;

SELECT COUNT(name) AS animals_never_tried_to_escape FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) AS Average_weight FROM animals;

SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

SELECT name, owner_id, full_name FROM animals INNER JOIN owners ON owner_id = owner.id WHERE owner_id = 4;

SELECT animals.name, species_id, species.name FROM animals INNER JOIN species ON species_id = species.id WHERE species_id = 1;

SELECT full_name, animals.name, owner_id FROM owners LEFT JOIN animals ON owner_id = owners.id;

SELECT COUNT(animals) as animals, species_id, species.name FROM animals INNER JOIN species ON species_id = species.id GROUP BY species_id, species.name;

SELECT animals.name, species_id, species.name, owner_id, full_name FROM animals INNER JOIN species ON species_id = species.id INNER JOIN owners ON owner_id = owners.id WHERE owner_id = 2 AND species_id = 2;

SELECT animals.name, species_id, escape_attempts, owner_id, full_name, FROM animals INNER JOIN owners ON owner_id = owners.id WHERE owner_id = 5 AND escape_attempts = 0;

SELECT owner_id, full_name, COUNT(animals) AS Number_of_animals FROM animals INNER JOIN owners ON owner_id = owners.id GROUP BY owner_id, full_name ORDER BY Number_of_animals desc;

/*answers*/

SELECT animals.name, visits.date_of_visit FROM visits JOIN animals ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'William Tacther' ORDER BY visits.date_of_visit desc
Limit 1;

SELECT DISTINCT animals.name FROM visits JOIN animals ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name, species.name FROM vets JOIN specialization ON vets.id = specialization.vet OR vets.id != specialization.vet_id JOIN species ON specialization.species_id = species.id;

SELECT animals.name, visits.date_of_visit FROM visits JOIN animals ON animals.id = visits.vet_id JOIN ON vets.id = visits.vets_id WHERE vets.name = 'Stephanie Mendez' AND date_of_visit > 'April_1, 2020' AND date_of_visit < 'August 30, 2020'

SELECT animals.name, COUNT(animals.name) FROM visits JOIN animals ON animals.id = visits.animal_id GROUP BY (animals.name) ORDER BY COUNT(animals.name) desc

SELECT animals.name, visits.date_of_visit FROM visits JOIN animals ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visit ASC LIMIT 1;

SELECT animals.*, nets.*, visits.date_of_visit FROM visits JOIN aniamls ON animals.id = visits.vet_id ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT COUNT(*) FROM visits JOIN animals ON animals.id = visits.animal_id JOIN vets ON vets_id = visits.vet_id WHERE animals.species_id NOT IN (SELECT species_id FROM specialization WHERE vets_id = vets);

SELECT species.name, COUNT(*) FROM visits JOIN animals ON animals.id = species.id JOIN vets ON vets_id = visits.vet_id WHERE vets.name = 'Maisy Smith' GROUP By species.name;
