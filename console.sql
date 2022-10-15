-- select distinct
SELECT DISTINCT first_name, last_name, email FROM customer;
SELECT DISTINCT release_year FROM film;
SELECT DISTINCT(release_year) FROM film;
SELECT DISTINCT(rental_rate) FROM film;
SELECT DISTINCT(rental_rate) FROM film ORDER BY rental_rate ASC;

SELECT DISTINCT(rating) FROM film;

-- count function
SELECT COUNT(DISTINCT (rating)) FROM film;
SELECT COUNT(*) FROM film_actor, payment; -- 79 million, do not run a lot
SELECT * FROM film_actor, payment; -- 79 million, do not run a lot

SELECT COUNT(DISTINCT (amount)) FROM payment;

-- select where
SELECT * FROM customer WHERE first_name = 'Jared';
SELECT film_id, title, rental_rate, replacement_cost FROM film WHERE rental_rate > 2 AND replacement_cost >= 19.99;
SELECT COUNT(*) FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';
SELECT film_id, title, rating, description FROM film WHERE rating = 'R';
SELECT COUNT(*) FROM film WHERE rating != 'R';
SELECT COUNT(*) FROM film WHERE rating != 'R' OR rating = 'PG-13';
SELECT film_id, title, rating, description FROM film WHERE rating = 'R' OR rating = 'PG-13';

--select where challenges
SELECT email FROM customer WHERE first_name = 'Nancy' AND last_name = 'Thomas';
SELECT title, description FROM film where title = 'Outlaw Hanky';
SELECT name, phone, address FROM customer_list WHERE address = '259 Ipoh Drive';
