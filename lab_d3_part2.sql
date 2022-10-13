-- 1. In the table actor, which are the actors whose last names are not repeated? F
SELECT last_name FROM actor 
GROUP BY last_name
having count(*) = 1;
-- 2. Which last names appear more than once?
SELECT last_name FROM actor 
GROUP BY last_name
HAVING count(*) > 1
-- 3. Using the rental table, find out how many rentals were processed by each employee.

SELECT staff_id, count(staff_id) as 'processed rentals' FROM rental
GROUP BY staff_id


-- 4. Using the film table, find out how many films were released each year.

SELECT release_year, count(release_year) as 'number of release' from film
GROUP BY release_year; 

-- 5. Using the film table, find out for each rating how many films were there.
-- SELECT distinct(rating) from film
-- ORDER BY rating DESC;
 SELECT rating, COUNT(rating) AS 'number' FROM film 
 GROUP BY rating 

-- 6. What is the mean length of the film for each rating type. 
-- Round off the average lengths to two decimal places

 SELECT rating, round(AVG(length),2) as 'Mean length' FROM film 
 GROUP BY rating 
 
 -- 7. Which kind of movies (rating) have a mean duration of more than two hours?
 SELECT rating, round(AVG(length),2) as Mean FROM film 
 GROUP BY rating
 HAVING Mean > 120;
 
 -- 8. Rank films by length (filter out the rows that have nulls or 0s in length column). 
 -- In your output, only select the columns title, length, and the rank.
 
SELECT title, length, RANK() OVER (ORDER BY length) AS ranking 
FROM film
WHERE length > 0 AND NOT ISNULL(length);




