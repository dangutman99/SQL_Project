-- 2. Películas con clasificación por edades 'R'
select "rating", "title"  
from film 
where rating = 'R';

-- 3. Actores con actor_id entre 30 y 40
select "actor_id", concat("first_name", ' ', "last_name") as nombre
from actor 
where actor_id between 30 and 40;

-- 4. Películas cuyo idioma coincide con el idioma original
select "title"
from film
where original_language_id = language_id;

-- 5. Películas ordenadas por duración ascendente
select "title", "length" 
from film
order by length ASC;

-- 6. Actores que tengan 'Allen' en su apellido
select concat("first_name", ' ', "last_name") as last_name_allen
from actor
where last_name = 'ALLEN';

-- 7. Cantidad total de películas por clasificación
select "rating", count(*) as total_peliculas
from film
group by "rating";

-- 8. Películas que son PG-13 o duran más de 3 horas
select "rating", "title"
from film
where "rating" = 'PG-13' or "length" > 180;
	
-- 9. Variabilidad de lo que costaría reemplazar las películas
select 
	AVG("replacement_cost") as media,
	MIN("replacement_cost") as minimo,
	MAX("replacement_cost") as maximo,
	stddev("replacement_cost") as desviacion_estander
from film;

-- 10. Mayor y menor duración de una película
select 
	MAX("length") as maximo,
	MIN("length") as minimo	
from film;

-- 11. Coste del antepenúltimo alquiler ordenado por día
select "amount"
from payment  
order by "payment_date" desc
limit 1 offset 2;

-- 12. Películas que no sean ni NC-17 ni G
select "title", "rating"
from film
where "rating" not in ('NC-17', 'G');

-- 13. Promedio de duración por clasificación
select "rating", Round(AVG("length"), 0) as promedio_duracion
from film
group by rating; 

-- 14. Películas con duración mayor a 180 minutos
select "title", "length"
from film
where "length" > 180;

-- 15. Total de dinero generado por la empresa
select SUM("amount") as total_generado
from payment;

-- 16. Los 10 clientes con mayor id
select "customer_id", concat("first_name", ' ', "last_name") as nombre
from customer
order by "customer_id" desc
limit 10;

-- 17. actores que aparecen en la película 'egg igby'
select actor.first_name, actor.last_name
from actor
join film_actor on actor.actor_id = film_actor.actor_id
join film on film_actor.film_id = film.film_id
where film.title = 'EGG IGBY';

-- 18. nombres de películas únicos
select distinct title
from film;


-- 19. películas de comedia con duración mayor a 180 minutos
select film.title, film.length
from film
join film_category on film.film_id = film_category.film_id
join category on film_category.category_id = category.category_id
where category.name = 'COMEDY'
  and film.length > 180;

-- 20. categorías con promedio de duración mayor a 110 minutos
select category.name, round(avg(film.length), 2) as promedio_duracion
from category
join film_category on category.category_id = film_category.category_id
join film on film_category.film_id = film.film_id
group by category.name
having avg(film.length) > 110;


-- 21. media de duración del alquiler (películas)
select avg(rental_duration) as media_duracion_alquiler
from film;


-- 22. nombre completo de actores y actrices
select concat(first_name, ' ', last_name) as nombre_completo
from actor;


-- 23. número de alquileres por día (orden descendente)
select date(rental_date) as dia, count(*) as total_alquileres
from rental
group by dia
order by total_alquileres desc;


-- 24. películas con duración superior al promedio
select title, length
from film
where length > (select avg(length) from film);


-- 25. número de alquileres por mes
select date_trunc('month', rental_date) as mes, count(*) as total_alquileres
from rental
group by mes
order by mes;


-- 26. promedio, desviación estándar y varianza del total pagado
select
    avg(amount) as promedio,
    stddev(amount) as desviacion_estandar,
    variance(amount) as varianza
from payment;


-- 27. películas que se alquilan por encima del precio medio
select title, rental_rate
from film
where rental_rate > (select avg(rental_rate) from film);


-- 28. actores que han participado en más de 40 películas
select actor_id, count(film_id) as total_peliculas
from film_actor
group by actor_id
having count(film_id) > 40;


-- 29. todas las películas y cantidad disponible en inventario
select film.title, count(inventory.inventory_id) as cantidad_disponible
from film
left join inventory on film.film_id = inventory.film_id
group by film.title;


-- 30. actores y número de películas en las que han actuado
select actor.first_name, actor.last_name, count(film_actor.film_id) as total_peliculas
from actor
left join film_actor on actor.actor_id = film_actor.actor_id
group by actor.actor_id, actor.first_name, actor.last_name;


-- 31. todas las películas y sus actores (aunque no tengan actores)
select film.title, actor.first_name, actor.last_name
from film
left join film_actor on film.film_id = film_actor.film_id
left join actor on film_actor.actor_id = actor.actor_id;


-- 32. todos los actores y las películas en las que han actuado (aunque no tengan películas)
select actor.first_name, actor.last_name, film.title
from actor
left join film_actor on actor.actor_id = film_actor.actor_id
left join film on film_actor.film_id = film.film_id;

-- 33. todas las películas y todos los registros de alquiler
select film.title, rental.rental_id, rental.rental_date, rental.return_date
from film
full join inventory on film.film_id = inventory.film_id
full join rental on inventory.inventory_id = rental.inventory_id;

-- 34. los 5 clientes que más dinero han gastado
select customer.customer_id, customer.first_name, customer.last_name, sum(payment.amount) as total_gastado
from customer
join payment on customer.customer_id = payment.customer_id
group by customer.customer_id, customer.first_name, customer.last_name
order by total_gastado desc
limit 5;

-- 35. actores cuyo primer nombre es 'johnny'
select concat("first_name", ' ', "last_name") as primer_nombre_johnny
from actor
where first_name = 'JOHNNY';

-- 36. renombrar columnas first_name y last_name
select first_name as nombre, last_name as apellido
from actor;

-- 37. id más bajo y más alto en actor
select min(actor_id) as id_mas_bajo, max(actor_id) as id_mas_alto
from actor;

-- 38. cuántos actores hay en actor
select count(*) as total_actores
from actor;

-- 39. actores ordenados por apellido ascendente
select *
from actor
order by last_name asc;

-- 40. primeras 5 películas
select *
from film
limit 5;

-- 41. actores agrupados por nombre y nombre más repetido
select first_name, count(*) as total
from actor
group by first_name
order by total desc
limit 1;

-- 42. todos los alquileres y los clientes que los realizaron
select rental.rental_id, rental.rental_date, customer.first_name, customer.last_name
from rental
join customer on rental.customer_id = customer.customer_id;

-- 43. clientes y sus alquileres, aunque no tengan alquileres
select customer.customer_id, customer.first_name, customer.last_name, rental.rental_id, rental.rental_date
from customer
left join rental on customer.customer_id = rental.customer_id;

-- 44. cross join entre film y category
select film.title, category.name as categoria
from film
cross join category;

-- 45. actores que han participado en películas de la categoría 'action'
select distinct actor.first_name, actor.last_name
from actor
join film_actor on actor.actor_id = film_actor.actor_id
join film_category on film_actor.film_id = film_category.film_id
join category on film_category.category_id = category.category_id
where category.name = 'Action';

-- 46. actores que no han participado en películas
select actor.first_name, actor.last_name
from actor
left join film_actor on actor.actor_id = film_actor.actor_id
where film_actor.film_id is null;

-- 47. actores y cantidad de películas en las que han participado
select actor.first_name, actor.last_name, count(film_actor.film_id) as total_peliculas
from actor
left join film_actor on actor.actor_id = film_actor.actor_id
group by actor.actor_id, actor.first_name, actor.last_name;

-- 48. crear vista actor_num_peliculas
select *
from actor_num_peliculas;

-- 49. número total de alquileres por cliente
select customer.customer_id, customer.first_name, customer.last_name, count(rental.rental_id) as total_alquileres
from customer
left join rental on customer.customer_id = rental.customer_id
group by customer.customer_id, customer.first_name, customer.last_name;

-- 50. duración total de las películas de la categoría 'action'
select sum(film.length) as duracion_total
from film
join film_category on film.film_id = film_category.film_id
join category on film_category.category_id = category.category_id
where category.name = 'Action';

-- 51. crear tabla temporal cliente_rentas_temporal
drop table if exists cliente_rentas_temporal;
create temp table cliente_rentas_temporal as
select customer_id, count(rental_id) as total_alquileres
from rental
group by customer_id;

-- 52. crear tabla temporal peliculas_alquiladas
drop table if exists peliculas_alquiladas;
create temp table peliculas_alquiladas as
select film.film_id, film.title, count(rental.rental_id) as total_alquileres
from film
join inventory on film.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id
group by film.film_id, film.title
having count(rental.rental_id) >= 10;

-- 53. películas alquiladas por tammy sanders y no devueltas
select film.title
from customer
join rental on customer.customer_id = rental.customer_id
join inventory on rental.inventory_id = inventory.inventory_id
join film on inventory.film_id = film.film_id
where customer.first_name = 'TAMMY'
  and customer.last_name = 'SANDERS'
  and rental.return_date is null
order by film.title asc;

-- 54. actores en películas de categoría 'sci-fi'
select distinct actor.first_name, actor.last_name
from actor
join film_actor on actor.actor_id = film_actor.actor_id
join film_category on film_actor.film_id = film_category.film_id
join category on film_category.category_id = category.category_id
where category.name = 'Sci-Fi'
order by actor.last_name asc;

-- 55. actores en películas alquiladas después de 'spartacus cheaper'
select distinct actor.first_name, actor.last_name
from actor
join film_actor on actor.actor_id = film_actor.actor_id
join inventory on film_actor.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id
where rental.rental_date > (
    select min(rental.rental_date)
    from film
    join inventory on film.film_id = inventory.film_id
    join rental on inventory.inventory_id = rental.inventory_id
    where film.title = 'SPARTACUS CHEAPER'
)
order by actor.last_name asc;

-- 56. actores que no han actuado en películas de categoría 'music'
select actor.first_name, actor.last_name
from actor
where actor.actor_id not in (
    select film_actor.actor_id
    from film_actor
    join film_category on film_actor.film_id = film_category.film_id
    join category on film_category.category_id = category.category_id
    where category.name = 'music'
);


-- 57. películas alquiladas por más de 8 días
select distinct film.title
from film
join inventory on film.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id
where rental.return_date is not null
  and rental.return_date - rental.rental_date > interval '8 days';


-- 58. películas de la misma categoría que 'animation'
select distinct film.title
from film
join film_category on film.film_id = film_category.film_id
join category on film_category.category_id = category.category_id
where category.name = 'Animation';


-- 59. películas con la misma duración que 'dancing fever'
select title, length
from film
where length = (
    select length
    from film
    where title = 'DANCING FEVER'
)
order by title asc;


-- 60. clientes que han alquilado al menos 7 películas distintas
select customer.first_name, customer.last_name, count(distinct inventory.film_id) as peliculas_distintas
from customer
join rental on customer.customer_id = rental.customer_id
join inventory on rental.inventory_id = inventory.inventory_id
group by customer.customer_id, customer.first_name, customer.last_name
having count(distinct inventory.film_id) >= 7
order by customer.last_name asc;


-- 61. total de películas alquiladas por categoría
select category.name as categoria, count(rental.rental_id) as total_alquileres
from category
join film_category on category.category_id = film_category.category_id
join inventory on film_category.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id
group by category.name;


-- 62. número de películas por categoría estrenadas en 2006
select category.name as categoria, count(film.film_id) as total_peliculas
from category
join film_category on category.category_id = film_category.category_id
join film on film_category.film_id = film.film_id
where film.release_year = 2006
group by category.name;


-- 63. combinaciones posibles de trabajadores con tiendas
select staff.staff_id, staff.first_name, staff.last_name, store.store_id
from staff
cross join store;


-- 64. cantidad total de películas alquiladas por cliente
select customer.customer_id, customer.first_name, customer.last_name, count(rental.rental_id) as cantidad_peliculas_alquiladas
from customer
left join rental on customer.customer_id = rental.customer_id
group by customer.customer_id, customer.first_name, customer.last_name
order by cantidad_peliculas_alquiladas desc;






