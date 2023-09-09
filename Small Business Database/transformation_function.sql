— Transformation function
CREATE OR REPLACE FUNCTION rentals_by_actor()
	RETURNS TRIGGER
	LANGUAGE plpgsql
AS
$$
BEGIN
	DELETE FROM summary_report;
	INSERT INTO summary_report (
	SELECT
		actorID,
		concat(actorFirstName, ‘ ‘, actorLastName) AS actorName,
		avg(rentalPrice) AS averageRentalPrice,
		COUNT(rentalID) AS totalRentalsByActor
	FROM detail_report
	GROUP BY actorID, actorName
	ORDER BY averageRentalPrice DESC
	);
	RETURN NEW;
END;
$$;
