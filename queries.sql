/*Queries that provide answers to the questions from all projects.*/
-- Find all animals whose name ends in "mon".
-- List the name of all animals born between 2016 and 2019.
-- List the name of all animals that are neutered and have less than 3 escape attempts.
-- List date of birth of all animals named either "Agumon" or "Pikachu".
-- List name and escape attempts of animals that weigh more than 10.5kg
-- Find all animals that are neutered.
-- Find all animals not named Gabumon.
-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)

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
