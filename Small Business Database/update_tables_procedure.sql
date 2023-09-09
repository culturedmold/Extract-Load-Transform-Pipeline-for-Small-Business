— Procedure to update/refresh both tables
CREATE OR REPLACE PROCEDURE update_reports()
	LANGUAGE plpgsql
AS
$$
BEGIN
	DELETE FROM detail_report;
	INSERT INTO detail_report (
		rentalID,
		actorID, 
		actorFirstName,
		actorLastName,
		rentalPrice
	)
	SELECT rental.rental_id, film_actor.actor_id, actor.first_name, actor.last_name, 			payment.amount
	FROM film_actor
	INNER JOIN actor ON film_actor.actor_id = actor.actor_id
	INNER JOIN film ON film.film_id = film_actor.film_id
	INNER JOIN inventory ON inventory.film_id = film.film_id
	INNER JOIN rental ON rental.inventory_id = inventory.inventory_id
	INNER JOIN payment ON payment.rental_id = rental.rental_id
	ORDER BY payment.amount DESC;
END;
$$;
