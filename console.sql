-- select distinct
SELECT DISTINCT first_name, last_name, email FROM customer;
SELECT DISTINCT release_year FROM film;
SELECT DISTINCT(release_year) FROM film;
SELECT DISTINCT(rental_rate) FROM film;
SELECT DISTINCT(rental_rate) FROM film ORDER BY rental_rate;

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

--order by
SELECT * FROM customer ORDER BY store_id, first_name;
SELECT store_id, first_name, last_name, customer_id FROM customer ORDER BY store_id;
SELECT store_id, first_name, last_name, customer_id FROM customer ORDER BY store_id DESC, first_name;

--limit
SELECT * FROM payment ORDER BY payment_date DESC LIMIT 5;
SELECT * FROM payment WHERE amount != 0.00 ORDER BY payment_date DESC LIMIT 5;
SELECT * FROM payment LIMIT 0;

--limit and order by challenge
SELECT (customer_id), amount, payment_date FROM payment WHERE amount > 0.00 ORDER BY payment_date ASC LIMIT 10;
SELECT COUNT(*) FROM film WHERE length <= 50;

--between
