-- Micro desafío - Paso 1:
-- Utilizando la base de datos de películas queremos conocer, por un lado, los
 --títulos y el nombre del género de todas las series de la base de datos. 

 SELECT series.title, genres.name FROM 
series INNER JOIN genres on series.genre_id = genres.id;

-- Game of Thrones     Fantasia
-- Supernatural        Suspenso
-- The Walking Dead    Terror
-- Person of Interest  Accion
-- The Big Bang Theory Comedia
-- Breaking Bad        Drama

-- Por otro, necesitamos listar los títulos de los episodios junto con el nombre y 
 -- apellido de los actores que trabajan en cadauno de ellos.

 SELECT episodes.title, CONCAT(actors.first_name, " ",actors.last_name) AS "nombre y apellido" FROM episodes
INNER JOIN actor_episode ON episodes.id = actor_episode.episode_id
INNER JOIN actors ON actor_episode.actor_id = actors.id;

-- Micro desafío - Paso 2:
-- Para nuestro próximo desafío necesitamos obtener a todos los actores o actrices
--  (mostrar nombre y apellido) que han trabajado en cualquier película de la saga 
-- de la Guerra de las galaxias, pero ¡cuidado!: debemos asegurarnos de que solo 
-- se muestre una sola vez cada actor/actriz.

SELECT DISTINCT CONCAT(actors.first_name, " ",actors.last_name) as "Nombre y Apellido actor" FROM actors
INNER JOIN actor_movie ON actors.id = actor_movie.actor_id
INNER JOIN movies ON actor_movie.movie_id = movies.id
WHERE movies.title LIKE "%La Guerra de las galaxias%";

-- Mark Hamill
-- Harrison Ford
-- Carrie Fisher

-- Micro desafío - Paso 3:
-- Debemos listar los títulos de cada película con su género correspondiente. En el
-- caso de que no tenga género, mostraremos una leyenda que diga "no tiene género".
-- Como ayuda podemos usar la función COALESCE() que retorna el primer valor no 
-- nulo de una lista. Podemos encontrar más información haciendo click acá.

SELECT movies.title, COALESCE(genres.name, "no tiene género") as "genres" FROM movies
INNER JOIN genres ON movies.genre_id= genres.id;

-- Micro desafío - Paso 4:
-- Necesitamos mostrar, de cada serie, la cantidad de días desde su estreno hasta 
-- su fin, con la particularidad de que a la columna que mostrará dicha cantidad la
-- renombraremos:
-- “Duración”. Por ejemplo:

SELECT title, DATEDIFF(end_date, release_date) AS "Duración" FROM series;

-- Game of Thrones     1889
-- Supernatural        4020
-- The Walking Dead    2194
-- Person of Interest  1464
-- The Big Bang Theory 3290
-- Breaking Bad        1830

-- Micro desafío - Paso 5:
-- Listar los actores ordenados alfabéticamente cuyo nombre sea mayor a 6 
-- caracteres. Debemos mostrar la cantidad total de los episodios guardados en la
-- base de datos. Para el siguiente desafío nos piden que obtengamos el título de
-- todas las series y el total de temporadas que tiene cada una de ellas.
-- Mostrar, por cada género, la cantidad total de películas que posee, siempre que
-- sea mayor o igual a 3.

SELECT actors.first_name FROM actors
WHERE length(actors.first_name) >6
ORDER BY actors.first_name;

-- Alexander
-- Harrison
-- Leonardo
-- Matthew
-- Sigourney

-- Debemos mostrar la cantidad total de los episodios guardados en la base de datos.

SELECT COUNT(episodes.id) AS  FROM episodes;
-- 57

-- Para el siguiente desafío nos piden que obtengamos el título de todas las series
-- y el total de temporadas que tiene cada una de ellas.

SELECT series.title, COUNT(seasons.title) FROM series
INNER JOIN seasons ON series.id = seasons.serie_id
GROUP BY series.title;

-- Breaking Bad         5
-- Game of Thrones      7
-- Person of Interest   5
-- Supernatural         12
-- The Big Bang Theory  10
-- The Walking Dead     7

--ostrar, por cada género, la cantidad total de películas que posee, siempre que
-- sea mayoro igual a 3.

SELECT COUNT(movies.id) FROM movies
INNER JOIN genres ON genre_id = genres.id
GROUP BY genres.name
HAVING COUNT(movies.id) >= 3;

--Animacion       4
--Aventuras       3
--Ciencia Ficcion 5
--Comedia         4