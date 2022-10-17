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
SELECT * FROM payment WHERE amount BETWEEN 8 AND 12;
SELECT COUNT(*) FROM payment WHERE amount BETWEEN 8 AND 12;
SELECT * FROM payment WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';
SELECT * FROM payment WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-16' ORDER BY payment_date;

--IN
SELECT * FROM payment WHERE amount IN (0.99, 1.98, 1.99) ORDER BY amount;

--LIKE & ILIKE
SELECT * FROM customer WHERE first_name LIKE 'J%';
SELECT * FROM customer WHERE first_name LIKE 'J%' ORDER BY first_name;
SELECT COUNT(*) FROM customer WHERE first_name LIKE 'J%';
SELECT * FROM customer WHERE first_name LIKE 'J%' AND last_name LIKE 'S%' ORDER BY first_name;

--GENERAL CHALLENGE
--1. HOW MANY TRANSACTIONS GREATER THAN $5.00?
SELECT COUNT(amount) FROM payment WHERE amount > 5;

--2. HOW MANY ACTORS WITH FIRST NAME STARTING WITH P?
SELECT COUNT(first_name) FROM actor WHERE first_name LIKE 'P%';

--3. HOW MANY UNIQUE DISTRICTS ARE CUSTOMERS FROM?
SELECT COUNT(DISTINCT(district)) FROM address;

--4. NAME THE DISTINCT DISTRICTS
SELECT DISTINCT(district) FROM address;

--5. HOW MANY FILMS ARE R-RATED AND HAVE REPLACEMENT COST BETWEEN $5 AND $15
SELECT COUNT(*) FROM film WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;

--6. HOW MANY FILMS HAVE THE WORD 'TRUMAN' IN THE TITLE?
SELECT title, description FROM film WHERE title ILIKE '%TRUMAN%';

SELECT COUNT(*) FROM film WHERE description ILIKE '%DATABASE%';

--AGGREGATE FUNCTIONS
-- AGG FX CALLS ONLY HAPPEN IN SELECT OR HAVING CLAUSE
SELECT MIN(replacement_cost) FROM film;
SELECT MAX(replacement_cost) FROM film;
SELECT MAX(replacement_cost), MIN(replacement_cost) FROM film;
SELECT AVG(replacement_cost) FROM film;
SELECT ROUND(AVG(replacement_cost), 3) FROM film;
SELECT SUM(replacement_cost) FROM film;

-- GROUP BY (ALSO AN AGG FX)
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount);

SELECT customer_id, COUNT(amount)
FROM payment
GROUP BY customer_id
ORDER BY COUNT(amount);

SELECT staff_id, customer_id, SUM(amount)
FROM payment
GROUP BY staff_id, customer_id
ORDER BY customer_id, staff_id;

SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount);

--GROUP BY CHALLENGES
--1. WHICH EMPLOYEE GOT MOST NUMBER OF TRANSACTIONS
SELECT staff_id, COUNT(amount) FROM payment
GROUP BY staff_id
ORDER BY COUNT(amount) DESC;

--2. AVERAGE REPLACEMENT COST PER RATING
SELECT rating, AVG(replacement_cost) FROM film
GROUP BY rating;

--3. TOP 5 CUSTOMERS WHO SPENT THE MOST
SELECT customer_id, SUM(AMOUNT) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;

--HAVING
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100
ORDER BY SUM(amount) DESC;

SELECT store_id, COUNT(customer_id) FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 300;

--HAVING CHALLENGES
--1. CUSTOMERS WITH 40 OR MORE TRANSACTIONS
SELECT customer_id, COUNT(amount) FROM payment
GROUP BY customer_id
HAVING COUNT(amount) >= 40
ORDER BY COUNT(amount) DESC;

--2. CUSTOMERS WHO HAVE SPENT $100+ WITH STAFF MEMBER 2
SELECT staff_id, customer_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY staff_id, customer_id
HAVING SUM(amount) > 100;

--ASSESMENT TEST
--1. CUSTOMERS WHO HAVE SPENT AT LEAST $110 WITH STAFF MEMBER 2
SELECT staff_id, customer_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY staff_id, customer_id
HAVING SUM(amount) >= 110;

--2. HOW MANY FILMS BEGIN WITH J?
SELECT COUNT(title) FROM film
WHERE title ILIKE 'J%';

--3. CUSTOMER WITH HIGHEST CUSTOMER ID WHOSE NAME STARTS WITH E AND ADDRESS ID LOWER THAN 500
SELECT customer_id, first_name, last_name FROM customer
WHERE first_name ILIKE 'E%'
AND address_id < 500 ORDER BY customer_id DESC
LIMIT 1;

