 -- Es la semana del rock a nivel mundial y nuestro gerente de Musimundos 
 -- nos pide crear banners con canciones del género Rock. Debemos hacer 
 -- una consulta a nuestra base de datos que nos devuelva los nombres de las 
 -- canciones que tengan género rock.

-- Seleccioná la cuarta canción que te devuelva la consulta.

-- Balls to the Wall

-- Princess of the Dawn

-- Inject The Venom

-- Restless and Wild

SELECT canciones.nombre FROM musimundos.canciones
INNER JOIN generos
ON canciones.id_genero = generos.id
WHERE generos.nombre= "ROCK";

-- Restless and Wild

*-- En el salón Musimundos tenemos un cliente fanático de Deep Purple, este 
-- quiere comprar todos los álbumes que tengan como "artista" a Deep Purple. 
-- Debemos hacer una consulta a nuestra base de datos que nos traiga el título
-- del álbum y el autor para saber si, lo que le estamos vendiendo, es correcto.

-- Ingresá el título del álbum en la posición número 10.

SELECT albumes.titulo, artistas.nombre  FROM musimundos.albumes
INNER JOIN artistas
ON albumes.id_artista = artistas.id
WHERE artistas.nombre = "Deep Purple";

-- Stormbringer

-- En el departamento de desarrollo de Musimundos están creando la nueva aplicación
--  móvil, en la cual vamos a poder escuchar música online de nuestros artistas 
-- favoritos. Para evitar posibles problemas de compatibilidad, los desarrolladores
-- decidieron que solo van a subir canciones que tengan el tipo de medio "MPEG
-- audio file". Debemos ayudar al equipo y obtener una lista en las cuales tengamos
-- el nombre de las canciones que tengan ese tipo de medio.

-- Seleccioná el nombre de la cuarta canción que obtuviste de la consulta.


-- Let's Get It Up

-- Inject The Venom

-- Dog Eat Dog

-- Night Of The Long Knives

SELECT canciones.nombre, tipos_de_medio.nombre FROM musimundos.canciones
INNER JOIN tipos_de_medio
ON canciones.id_tipo_de_medio = tipos_de_medio.id
WHERE tipos_de_medio.nombre = "MPEG audio file";

-- Inject The Venom

-- Desde el sector de recursos humanos de Musimundos nos están solicitando una lista
-- de todos los cargos que tienen los empleados. Realizá una consulta a nuestra 
-- base de datos que nos brinde el título de los cargos que tengan todos los 
-- empleados sin repetirse medio.

-- Ingresá el título que figura en la posición 4.

SELECT DISTINCT empleados.titulo  FROM musimundos.empleados;

-- IT Manager

-- Genera una consulta a la base Musimundos que cuente todas las canciones por 
-- genero y las agrupe por id_genero. Seleccioná el total del quinto registro.

SELECT COUNT(canciones.id_genero) FROM canciones
GROUP BY canciones.id_genero;

-- 12

-- El área de estrategia de Musimundos está analizando cómo implementar una acción 
-- de marketing en la cual tiene que destinar un presupuesto acorde a la cantidad
-- de clientes que tenga cada país. Por esto nos pide que los ayudemos a
-- identificar la cantidad de clientes que son de Brazil.

-- Generá una consulta en la base de datos que traiga la cuenta de todos los
-- clientes que son de Brazil.

-- Ingresá el número que te dio como resultado.

SELECT COUNT(CLIENTES.id) FROM clientes 
WHERE clientes.pais = "Brazil";

-- 5

-- Es época de balances y en Musimundos quieren saber cuánto es el dinero que la 
-- gente lleva gastado en la empresa.

-- Hacé una consulta a la base de datos que sume el total de todas las facturas 
-- que emitió la empresa.

-- Ingresá el número que obtuviste.

SELECT SUM(facturas.total) FROM facturas;

--2328.60

--En el equipo de desarrollo están mudando de servidor a nuestra aplicación y 
-- quieren saber cuál es el peso de cada archivo de canciones para buscar un 
--servidor adecuado con capacidad suficiente.

-- Hacé una consulta a la base de datos para saber cuál es el archivo con menor
-- peso en bytes.

--Ingresá el número que obtuviste.

SELECT MIN(canciones.bytes) FROM canciones;

-- 38747

-- Se acerca el gerente de Marketing y nos comenta que buscan analizar las facturas
--  que Ingresos está generando por cada país, PERO le interesa los países que 
-- hayan generado un total superior a 100.

-- Ingresá el país correspondiente al segundo registro de la respuesta a la 
-- consulta.

-- TIP: debes utilizar el GROUP BY, el SUM y HAVING para llegar a esta respuesta. Recordá ingresar el país con la primera letra en mayúscula y sin tildes.

SELECT SUM(facturas.total), facturas.pais_de_facturacion
FROM musimundos.facturas
GROUP BY facturas.pais_de_facturacion
HAVING SUM(facturas.total) > 100;

-- Canada

-- En musimundos estamos muy atentos a que nuestros usuarios encuentren una 
-- cantidad apropiada de canciones del estilo que quieran escuchar, es por eso que
--  en esta oportunidad nos están solicitando una lista de cuantas canciones 
-- tenemos por género. Hacé una consulta a la base de datos que traiga el nombre 
-- del género y la cantidad de canciones que posee.

-- ingresá el número que te dio como resultado las canciones de género Blues.

SELECT COUNT(canciones.id), generos.nombre FROM canciones
INNER JOIN generos
ON canciones.id_genero = generos.id
GROUP BY generos.nombre;

-- 81

-- En el sitio web de Musimundos queremos mejorar nuestras vistas de productos 
-- colocando al pie de cada álbum el promedio de duración de cada álbum. Tomemos 
-- como ejemplo a la banda AC/DC y consulta a la base de datos el álbum 'Let There
-- Be Rock' , lista sus canciones , su duración y saca un promedio de duracion de
-- las mismas. 

-- insertá el número que obtuviste 

SELECT  artistas.nombre, albumes.titulo, canciones.nombre, canciones.milisegundos, AVG(canciones.milisegundos) FROM artistas 
INNER JOIN albumes ON artistas.id = albumes.id_artista
INNER JOIN canciones ON canciones.id_album = albumes.id
WHERE artistas.nombre = "AC/DC" AND albumes.titulo = "Let There Be Rock";

-- 306657.3750



-- En el salón de Musimundos, estamos ofreciendo una promoción para los clientes 
-- regulares donde regalamos un 20% de descuento en su compra si alguna vez el 
-- cliente hizo una compra con un total de más de 12. El cliente número 48 acaba 
-- de entrar por la puerta y el vendedor quiere corroborar si el descuento se 
-- aplica.

-- Hacé una consulta a la base de datos que nos traiga el total de la factura más
-- cara que tenga el cliente número 48.

select max(facturas.total) from facturas
WHERE facturas.id_cliente = 48;

--13.86
