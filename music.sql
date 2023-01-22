-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music


CREATE TABLE producers
(
	id SERIAL PRIMARY KEY,
	producer TEXT NOT NULL
);

INSERT INTO producers
 	(producer)
VALUES
	('Dust Brothers'),
	('Stephen Lironi'),
	('Roy Thomas Baker'),
	('Walter Afanasieff'),
	('Benjamin Rice'),
	('Rick Parashar'),
	('Al Shux'),
	('Max Martin'),
	('Cirkut'),
	('Shellback'),
	('Benny Blanco'),
	('The Matrix'),
	('Darkchild');

CREATE TABLE artists
(
	id SERIAL PRIMARY KEY,
	artist TEXT NOT NULL
);

INSERT INTO artists
  	(artist)
VALUES
	('Hanson'),
	('Queen'),
	('Mariah Cary'),
	('Boyz II Men'),
	('Lady Gaga'),
	('Bradley Cooper'),
	('Nickelback'),
	('Jay Z'),
	('Alicia Keys'),
	('Katy Perry'),
	('Juicy J'),
	('Maroon 5'),
	('Christina Aguilera'),
	('Avril Lavigne'),
	('Destiny''s Child');


CREATE TABLE albums
(
	id SERIAL PRIMARY KEY,
	album TEXT NOT NULL,
	release_date DATE NOT NULL
);

INSERT INTO albums
  	(release_date, album)
VALUES
	('04-15-1997', 'Middle of Nowhere'),
	('10-31-1975', 'A Night at the Opera'),
	('11-14-1995', 'Daydream'),
	('09-27-2018', 'A Star Is Born'),
	('08-21-2001', 'Silver Side Up'),
	('10-20-2009', 'The Blueprint 3'),
	('12-17-2013', 'Prism'),
	('06-21-2011', 'Hands All Over'),
	('05-14-2002', 'Let Go'),
	('11-07-1999', 'The Writing''s on the Wall');







CREATE TABLE songs
(
	id SERIAL PRIMARY KEY,
	title TEXT NOT NULL,
	duration_in_seconds INTEGER NOT NULL,
	album int NOT NULL references albums(id)
);

INSERT INTO songs
  	(title, duration_in_seconds, album)
VALUES
	('MMMBop', 					238, 1),
	('Bohemian Rhapsody', 		355, 2),
	('One Sweet Day', 			282, 3),
	('Shallow', 				216, 4),
	('How You Remind Me', 		223, 5),
	('New York State of Mind', 	276, 6),
	('Dark Horse', 				215, 7),
	('Moves Like Jagger', 		201, 8),
	('Complicated', 			244, 9),
	('Say My Name', 			240, 10);


create table producers_albums(
	id SERIAL PRIMARY KEY,
	producer int references producers(id),
	album int references albums(id)

);


INSERT INTO producers_albums
  	(producer, album)
VALUES
	(1, 1),
	(2, 1),
	(3, 2),
	(4, 3),
	(5, 4),
	(6, 5),
	(7, 6),
	(8, 7),
	(9, 7),
	(10, 8),
	(11, 8),
	(12, 9),
	(13, 10);



create table artists_songs(
	id SERIAL PRIMARY KEY,
	artist int references artists(id),
	song int references songs(id)

);


INSERT INTO artists_songs
  	(artist, song)
VALUES
	(1, 	1),
	(2, 	2),
	(3, 	3),
	(4, 	3),
	(5, 	4),
	(6, 	4),
	(7, 	5),
	(8, 	6),
	(9, 	6),
	(10, 	7),
	(11, 	7),
	(12, 	8),
	(13, 	8),
	(14, 	9),
	(15, 	10);