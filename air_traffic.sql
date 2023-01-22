-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airports
(
	id      SERIAL PRIMARY KEY,
	city    TEXT NOT NULL,
	country TEXT NOT NULL
);

INSERT INTO airports
  	(city, country)
VALUES
	('Washington DC', 	'United States'),
	('Seattle', 		'United States'),
	('Tokyo', 			'Japan'),
	('London', 			'United Kingdom'),
	('Los Angeles', 	'United States'),
	('Las Vegas', 		'United States'),
	('Mexico City', 	'Mexico'),
	('Paris', 			'France'),
	('Casablanca', 		'Morocco'),
	('Dubai', 			'UAE'),
	('Beijing', 		'China'),
	('New York', 		'United States'),
	('Charlotte', 		'United States'),
	('Cedar Rapids', 	'United States'), 
	('Chicago', 		'United States'),
	('New Orleans', 	'United States'),
	('Sao Paolo', 		'Brazil'), 
	('Santiago', 		'Chile');

CREATE TABLE airlines
(
	id 		SERIAL PRIMARY KEY,
	airline 	TEXT NOT NULL
);

INSERT INTO airlines
  	(airline)
VALUES
	('United'),
	('British Airways'),
	('Delta'),
	('TUI Fly Belgium'),
	('Air China'),
	('American Airlines'),
	('Avianca Brasil');

CREATE TABLE customers
(
	id 			SERIAL PRIMARY KEY,
	first_name 	TEXT NOT NULL,
	last_name 	TEXT NOT NULL
);


INSERT INTO customers
 	(first_name, last_name)
VALUES
	('Jennifer', 	'Finch'),
	('Thadeus', 	'Gathercoal'),
	('Sonja', 		'Pauley'),
	('Jennifer', 	'Finch'),
	('Waneta', 		'Skeleton'),
	('Thadeus', 	'Gathercoal'),
	('Berkie', 		'Wycliff'),
	('Alvin', 		'Leathes'),
	('Berkie', 		'Wycliff'),
	('Cory', 		'Squibbes');


CREATE TABLE routes
(
	id SERIAL PRIMARY KEY,
	from_port int NOT NULL references airports(id),
	to_port int NOT NULL references airports(id)
);

INSERT INTO routes
  	(from_port, to_port)
VALUES
	(1, 	2),
	(3, 	4),
	(5, 	6),
	(2, 	7),
	(8, 	9),
	(10, 	11),
	(12, 	13),
	(14, 	15),
	(13, 	16),
	(17, 	18);






CREATE TABLE flights
(
	id SERIAL PRIMARY KEY,
	departure TIMESTAMP NOT NULL,
	arrival TIMESTAMP NOT NULL,
	airline int NOT NULL references airlines(id),
	flight_route int NOT NULL references routes(id),
	aircraft text NOT NULL
);

INSERT INTO flights
  	(departure, arrival, airline, flight_route, aircraft)
VALUES
	('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 	'727'),
	('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2, 	'727'),
	('2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 	'727'),
	('2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 4, 	'747'),
	('2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 5, 	'727'),
	('2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 6, 	'727'),
	('2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 7, 	'727'),
	('2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 8, 	'727'),
	('2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 9, 	'747'),
	('2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 10, 	'777');





CREATE TABLE tickets
(
	id SERIAL PRIMARY KEY,
	customer int  NOT NULL references customers(id),
	seat TEXT NOT NULL,
	flight int NOT NULL references flights(id),
	price float NOT NULL
);

INSERT INTO tickets
  	(customer, seat, flight, price)
VALUES
	(1, 	'33B', 	1, 	'900'),
	(2, 	'8A', 	2, 	'850'),
	(3, 	'12F', 	3, 	'500'),
	(4, 	'20A', 	4, 	'500'),
	(5, 	'23D', 	5, 	'300'),
	(6, 	'18C', 	6, 	'500'),
	(7, 	'9E', 	7, 	'500'),
	(8, 	'1A', 	8, 	'400'),
	(9, 	'32B', 	9, 	'750'),
	(10, 	'10D', 	10, '500');