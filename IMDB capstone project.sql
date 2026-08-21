--  Get all data about movies

SELECT * 
FROM movies;

-- Get all data about directors

SELECT * 
FROM directors;

-- Check how many movies are present in IMDB

SELECT COUNT(*) AS total_movies 
FROM movies;

-- Find specific directors: James Cameron, Luc Besson, John Woo

SELECT * 
FROM directors 
WHERE name IN ('James Cameron', 'Luc Besson', 'John Woo');

-- Find all directors with name starting with 'S'

SELECT * 
FROM directors 
WHERE name LIKE 'S%';
-- Count female directors (Gender = 1)

SELECT COUNT(*) AS female_directors_count 

FROM directors 
WHERE gender = 1;

-- Find the name of the 10th female director

SELECT name 
FROM directors 
WHERE gender = 1 
ORDER BY id 
LIMIT 1 OFFSET 9;

-- Top 3 most popular movies

SELECT title, popularity 
FROM movies 
ORDER BY popularity DESC 
LIMIT 3;

--  Top 3 most bankable movies (Highest Revenue or Net Profit)

SELECT original_title, revenue 
FROM movies 
ORDER BY revenue DESC 
LIMIT 3;

-- Highest average vote for a movie released since January 1st, 2000

SELECT original_title, vote_average, release_date 
FROM movies 
WHERE release_date >= '2000-01-01' 
ORDER BY vote_average DESC 
LIMIT 1;

-- Movies directed by Brenda Chapman

SELECT m.original_title, m.release_date, d.name AS director_name
FROM movies m
JOIN directors d ON m.director_id = d.id
WHERE d.name = 'Brenda Chapman';

-- Director who made the most movies

SELECT d.name, COUNT(m.id) AS movie_count
FROM directors d
JOIN movies m ON d.id = m.director_id
GROUP BY d.id, d.name
ORDER BY movie_count DESC
LIMIT 1;

--  Most bankable director (Highest Total Revenue)

SELECT d.name, SUM(m.revenue) AS total_revenue
FROM directors d
JOIN movies m ON d.id = m.director_id
GROUP BY d.id, d.name
ORDER BY total_revenue DESC
LIMIT 1;





