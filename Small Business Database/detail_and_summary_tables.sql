— Create detail_report table
DROP TABLE IF EXISTS detail_report;
CREATE TABLE IF NOT EXISTS detail_report (
	rentalID INT,
	actorID INT,
	actorFirstName VARCHAR(45),
	actorLastName VARCHAR(45),
	rentalPrice NUMERIC(4, 2)
);

— Create summary_report table
DROP TABLE IF EXISTS summary_report;
CREATE TABLE IF NOT EXISTS summary_report (
	actorID INT,
	actorName VARCHAR(45),
	averageRentalPrice NUMERIC(4, 2),
	totalRentalsByActor INT
);