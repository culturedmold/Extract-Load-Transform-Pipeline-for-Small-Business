# Small-Business-Database Extract/Load/Transform Project

## Overview
This project was an excercise in creating an extract/load/transform pipeline for a small business. It utilized PostgreSQL as the database and involved the creation of triggers, procedures, and functions to extract and load data into business friendly views, and transform data into consumable chunks of information for stakeholders. 

### Business problem to solve
Business problem/need: identify the film actors that have the highest rental price, as well as the actors that have the highest or lowest average rental price. 

### Overview of fields used in report
The report will include “detail_report” and “summary_report” tables. The detail_report table will include a list of all rentals organized by lowest to highest rental price. The summary_report table will display the data as average rental price by actor. 

### Data types used in report
			
Fields include the following for detail_report:
- rentalID INT
- actorID INT
- actorFirstName VARCHAR(45)
- actorLastName VARCHAR(45)
- rentalPrice NUMERIC(4, 2)

Fields include the following for summary_report:
- actorID INT
- actorName 
- averageRentalPrice NUMERIC(4, 2)
- totalRentalsByActor INT

### Tables from database that will provide the necessary data for our report
			
The tables that will provide the necessary data from the given dataset are as follows: actor, film_actor, inventory, film, rental, payment.

### Custom transformation used

We will perform the following transformations on data from the detail_report table to be loaded into the summary_report table: concatenate actorFirstName and actorLastName into a single columns “actorName”, and we will take the rentalPrice for each rental and transform it into an average price by actor. We will take the count of each rentalID and display it as well, to indicate the number of rentals that each actor has that are contributing to the average number. 

### Business use case for both detail_report and summary_report

The detail_report table would be useful for business leaders to determine precisely which films/rentals are generating the most revenue. This would allow the business to craft campaigns and promotions to promote high-value rentals. This view is more granular and allows business leaders to see more detail at an individual rental level.
The summary_report table would provide a higher-level summary outlining the average rental price by actor. Business leaders could craft business rules around what they consider to be high or low average rental prices and use the data provided to determine which actors’ films need additional promotion or less promotion to meet business goals. Specific campaigns could be crafted around actors and their associated films to encourage more customers to rent high-value films.
			
### Updating the report for stakeholders
			
The report should be generated as a business evaluates quarterly performance at a minimum. As specific campaigns are crafted using the data, business leaders would need to see the campaign generated at the start and conclusion of the campaigns to evaluate performance. 
If an actor has a very wide spread of rental prices by film (as indicated by detail_report) but a low average rental price, this would indicate to the business leaders that perhaps the actor’s films need more or less promotion. If the rental amount is low relative to average rental amount, this could indicate that the rental price per film is too high and needs to be lowered to increase the rental amount. The opposite could also be true - a very high number of rentals by actor with a low average rental price could indicate that the films associated with that actor are priced too low, and the business could benefit by increasing the rental price. 

### Code for transformation

[Transformation Function](https://github.com/culturedmold/Small-Business-Database/blob/main/Small%20Business%20Database/transformation_function.sql)


### Code to create detail_report and summary_report

[Create Detail and Summary tables](https://github.com/culturedmold/Small-Business-Database/blob/main/Small%20Business%20Database/detail_and_summary_tables.sql)

### Code to extract and load data into reports

[Extract from DB and Load into Detail Report](https://github.com/culturedmold/Small-Business-Database/blob/main/Small%20Business%20Database/extract_and_load.sql)

### Trigger to update reports

[Trigger to Update Summary Table](https://github.com/culturedmold/Small-Business-Database/blob/main/Small%20Business%20Database/update_trigger.sql)

### Procedure to refresh report data

[Procedure to Refresh/Update Tables](https://github.com/culturedmold/Small-Business-Database/blob/main/Small%20Business%20Database/update_tables_procedure.sql)

### A tool that could be used to automate the procedure
			
A job scheduler we could use would be pgAgent. PostgreSQL does not have a built in scheduling tool, and there are many third party add-ons/plugins/etc. that can provide that functionality.

### Acknowledge all utilized sources, including any sources of third-party code, using in-text citations and references. If no sources are used, clearly declare that no sources were used to support your submission.

No third party/external sources were used in this project.
