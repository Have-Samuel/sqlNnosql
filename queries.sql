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

How many animals are there?
How many animals have never tried to escape?
What is the average weight of animals?
Who escapes the most, neutered or not neutered animals?
What is the minimum and maximum weight of each type of animal?
What is the average number of escape attempts per animal type of those born between 1990 and 2000?
Remember to add these queries to your queries.sql file.
/*Return the total number of animals in the database*/
SELECT COUNT(*) FROM animals;

/*counts how many animals have tried to escape*/
SELECT COUNT(*) FROM animals WHERE escape_attempts > 0;

/*provides the average weight of all animals*/
SELECT AVG(weight_kg) FROM animals;

/*Provides whether neutered or non-neutered animals escape the most and provides the attempts with group that escapes the most*/
SELECT neutered, SUM(escape_attempts) AS Total_Number_of_Escape_Attempts FROM animals WHERE escape_attempts > 0 GROUP BY neutered ORDER BY Total_Number_of_Escape_Attempts DESC LIMMIT 1;

/*provides minimum & maximum weight of each type of animal*/
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
/*returns average number of escape attempts per animaltype born btn the yrs 1990 & 2000*/
SELECT species, AVG(escape_attempts) as Average_Escape_Attempts FROM animals WHERE date_of_birth > '1990-01-01' AND date_of_birth <= '2000-12-31' GROUP BY species;