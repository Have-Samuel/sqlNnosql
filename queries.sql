/*Queries that provide answers to the questions from all projects.*/
Find all animals whose name ends in "mon".
List the name of all animals born between 2016 and 2019.
List the name of all animals that are neutered and have less than 3 escape attempts.
List date of birth of all animals named either "Agumon" or "Pikachu".
List name and escape attempts of animals that weigh more than 10.5kg
Find all animals that are neutered.
Find all animals not named Gabumon.
Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)

SELECT * from animals WHERE name ends in = 'mon';
SELECT * FROM animals WHERE  BETWEEN 2016 AND 2019;
SELECT * FROM animals WHERE escape_attempts < 3;
SELECT * FROM animals WHERE date_of_birth IN ('Agumon', 'Pikachu');
SELECT * FROM animals WHERE weigh BETWEEN > 10.5kg;
SELECT * FROM animals WHERE neutered;
SELECT * FROM animals not named 'Gabumon';
SELECT * FROM animals WHERE weight BETWEEN 10.4kg AND 17.3kg and those => 10.4kg AND 17.3kg;
