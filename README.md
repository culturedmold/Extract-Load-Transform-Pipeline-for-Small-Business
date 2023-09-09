# Small-Business-Database Extract/Load/Transform Project

Cory Hampton

## Overview:
This project was an excercise in creating an extract/load/transform pipeline for a small business. It utilized PostgreSQL as the database and involved the creation of triggers, procedures, and functions to extract and load data into business friendly views, and transform data into consumable chunks of information for stakeholders. 

### Identify a real-world written business report that can be created from the DVD Dataset from the “Labs on Demand Assessment Environment and DVD Database” attachment.

Business problem/need: identify the film actors that have the highest rental price, as well as the actors that have the highest or lowest average rental price. 

### Identify the specific fields that will be included in the detailed table and the summary table of the report.

The report will include “detail_report” and “summary_report” tables. The detail_report table will include a list of all rentals organized by lowest to highest rental price. The summary_report table will display the data as average rental price by actor. 

### Describe the types of data fields used for the report.
			
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

### Identify at least two specific tables from the given dataset that will provide the data necessary for the detailed table section and the summary table section of the report.
			
The tables that will provide the necessary data from the given dataset are as follows: actor, film_actor, inventory, film, rental, payment.

### Identify at least one field in the detailed table section that will require a custom transformation with a user-defined function and explain why it should be transformed (e.g., you might translate a field with a value of N to No and Y to Yes).

We will perform the following transformations on data from the detail_report table to be loaded into the summary_report table: concatenate actorFirstName and actorLastName into a single columns “actorName”, and we will take the rentalPrice for each rental and transform it into an average price by actor. We will take the count of each rentalID and display it as well, to indicate the number of rentals that each actor has that are contributing to the average number. 

### Explain the different business uses of the detailed table section and the summary table section of the report.

The detail_report table would be useful for business leaders to determine precisely which films/rentals are generating the most revenue. This would allow the business to craft campaigns and promotions to promote high-value rentals. This view is more granular and allows business leaders to see more detail at an individual rental level.
The summary_report table would provide a higher-level summary outlining the average rental price by actor. Business leaders could craft business rules around what they consider to be high or low average rental prices and use the data provided to determine which actors’ films need additional promotion or less promotion to meet business goals. Specific campaigns could be crafted around actors and their associated films to encourage more customers to rent high-value films.
			
### Explain how frequently your report should be refreshed to remain relevant to stakeholders.
			
The report should be generated as a business evaluates quarterly performance at a minimum. As specific campaigns are crafted using the data, business leaders would need to see the campaign generated at the start and conclusion of the campaigns to evaluate performance. 
If an actor has a very wide spread of rental prices by film (as indicated by detail_report) but a low average rental price, this would indicate to the business leaders that perhaps the actor’s films need more or less promotion. If the rental amount is low relative to average rental amount, this could indicate that the rental price per film is too high and needs to be lowered to increase the rental amount. The opposite could also be true - a very high number of rentals by actor with a low average rental price could indicate that the films associated with that actor are priced too low, and the business could benefit by increasing the rental price. 

### Provide original code for function(s) in text format that perform the transformation(s) you identified in part A4.

[Transformation Function](https://github.com/culturedmold/Small-Business-Database/blob/main/Small%20Business%20Database/transformation_function.sql)


### Provide original SQL code in a text format that creates the detailed and summary tables to hold your report table sections.

[Create Detail and Summary tables](https://github.com/culturedmold/Small-Business-Database/blob/main/Small%20Business%20Database/detail_and_summary_tables.sql)

### Provide an original SQL query in a text format that will extract the raw data needed for the detailed section of your report from the source database.

[Extract from DB and Load into Detail Report](https://github.com/culturedmold/Small-Business-Database/blob/main/Small%20Business%20Database/extract_and_load.sql)

### Provide original SQL code in a text format that creates a trigger on the detailed table of the report that will continually update the summary table as data is added to the detailed table.

[Trigger to Update Summary Table](https://github.com/culturedmold/Small-Business-Database/blob/main/Small%20Business%20Database/update_trigger.sql)

### Provide an original stored procedure in a text format that can be used to refresh the data in both the detailed table and summary table. The procedure should clear the contents of the detailed table and summary table and perform the raw data extraction from part D.

[Procedure to Refresh/Update Tables](https://github.com/culturedmold/Small-Business-Database/blob/main/Small%20Business%20Database/update_tables_procedure.sql)

### Identify a relevant job scheduling tool that can be used to automate the stored procedure.
			
A job scheduler we could use would be pgAgent. PostgreSQL does not have a built in scheduling tool, and there are many third party add-ons/plugins/etc. that can provide that functionality.

### Provide a Panopto video recording that includes the presenter and a vocalized demonstration of the functionality of the code used for the analysis.

Panopto video link: https://wgu.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=e6a548b9-21b4-4e7e-93cb-b05c01229b7a

### Acknowledge all utilized sources, including any sources of third-party code, using in-text citations and references. If no sources are used, clearly declare that no sources were used to support your submission.

No third party/external sources were used in this project.
