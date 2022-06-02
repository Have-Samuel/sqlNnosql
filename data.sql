/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Agumon', '2020-02-03', 10.23, TRUE, 0);
INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Gabumon', '2018-11-15', 8, FALSE, 2);
INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Pikachu', '2021-01-07', 15.04, FALSE, 1 );
INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Devimon', '2017-05-12', 11, TRUE, 5);
INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Charmander', '2020-02-08', -11, FALSE, 0);
INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Plantmon', '2021-11-15', -5.7, TRUE, 2);
INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Squirtle', '1993-04-02', -12.13, FALSE, 3);
INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Angemon', '2005-06-12', -45, TRUE, 1);
INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Boarmon', '2005-06-07', 20.4, TRUE, 7);
INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Blossom', '1998-09-13', 17, TRUE, 3);
INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES (11, 'Ditto', '2022-05-14', 22, TRUE, 4);

INSERT INTO owners (id, full_name, age) 
VALUES(12, 'Sam Smith', 34), (12, 'Jenifer Orwell', 19), (12, 'Bob', 45), (12, 'Meoldy Pond', 77), (12, 'Dean Winchedter', 14), (12, 'Jodie Whittaker', 38);
INSERT INTO species(id, name)
VALUES(13,  'Pokemon',), (13, 'Digimon')

UPDATE animals SET owner_id = 1 WHERE name LIKE 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');

INSERT INTO vets (full_name, age, date_of_graduation) VALUES ('William Tatcher', '45', '2000-04-23');
INSERT INTO vets (full_name, age, date_of_graduation) VALUES ('Maisy Smith', '26', '2019-01-17');
INSERT INTO vets (full_name, age, date_of_graduation) VALUES ('Stephanie Mendez', '64', '1981-05-04');
INSERT INTO vets (full_name, age, date_of_graduation) VALUES ('Jack Harkness', '38', '2008-06-08');

INSERT INTO specialization (species_id, vet_id) VALUES(
  (SELECT id FROM species WHERE name = 'Pokemon'),
  (SELECT id FROM vets WHERE name = 'William Tatcher')),
  ((SELECT id FROM  species WHERE name = 'Digimon'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez')),
  ((SELECT id FROM species WHERE name = 'Pokemon'),
  (SELECT id FROM vets WHERE name  = 'Stephanie Mendez')),
  ((SELECT id FROM species WHERE name = 'Digimon'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness'));

INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES(
  (SELECT id FROM animas WHERE name = 'Agumon'),
  (SELECT id FROM vets WHERE NAME = 'William Tatcher'), 'May 24 2020'),
  ((SELECT id FROM animals WHERE name = 'Agumon'),
  (SELECT id FROM vets WHERE = 'Stephanie Mendaz'), 'July 22, 2020'),
  ((SELECT id FROM animals WHERE name = 'Gabumon'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness'), 'Febuary 2, 2021'),
  ((SELECT id FROM animals WHERE name = 'Pikachu'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'January 5, 2020'),
  ((SELECT id FROM animals WHERE name = 'Pikachu'),
  (SELECT id FROM vets WHERE name = 'Miasy Smith'), 'March 8, 2020'),
  ((SELECT id FROM animals WHERE name = 'Devimon'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 'May 4, 2021'),
  ((SELECT id FROM animals WHERE name = 'Charmander'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness'), 'Febuary 24,2021'),
  ((SELECT id FROM animals WHERE name = 'Plantmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'December 21, 2019'),
  ((SELECT id FROM animals WHERE name = 'Plantmon'),
  (SELECT id FROM vets WHERE name = 'William Tatcher'), 'August 10, 2020'),
  ((SELECT id FROM animals WHERE name = 'Plantmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'April 7, 2021'),
  ((SELECT id FROM animals WHERE name = 'Squirtle'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 'Septermber 29, 2019'),
  ((SELECT id FROM animals WHERE name = 'Agumon'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness'), 'October 3, 2020'),
  ((SELECT id FROM animals WHERE name = 'Agumon'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness'), 'November 4, 2020'),
  ((SELECT id FROM animals WHERE name = 'Boarmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'January 24, 2019'),
  ((SELECT id FROM animals WHERE name = 'Boarmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'May 15, 2019'),
  ((SELECT id FROM animals WHERE name = 'Boarmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'Febuary 27, 2020'),
  ((SELECT id FROM animals WHERE name = 'Boarmon'),
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 'August 3, 2020'),
  ((SELECT id FROM animals WHERE name = 'Blossom'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 'May 24, 2020'), 
  ((SELECT id FROM animals WHERE name = 'Blossom'),
  (SELECT id FROM vets WHERE name = 'Wiliam Tatcher'), 'January 11, 2021')
