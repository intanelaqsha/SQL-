-- SQL Script

Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:

 SELECT COUNT(*)
    FROM table
	
        Table name            Total number of records
-----------------------------------------------------------
i.      Attribute table     = 10000
ii.     Business table      = 10000
iii.    Category table      = 10000
iv.     Checkin table       = 10000
v.      elite_years table   = 10000 
vi.     friend table        = 10000
vii.    hours table         = 10000
viii.   photo table         = 10000
ix.     review table        = 10000
x.      tip table           = 10000
xi.     user table          = 10000



2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

 SELECT COUNT(DISTINCT(key))
    FROM table

i.      Business            = id: 10000
ii.     Hours               = business_id: 1562
iii.    Category            = business_id: 2643
iv.     Attribute           = business_id: 1115
v.      Review              = id:10000, business_id: 8090, user_id: 9581
vi.     Checkin             = business_id: 493
vii.    Photo               = id: 10000, business_id: 6493
viii.   Tip                 = user_id: 537, business_id: 3979
ix.     User                = id: 10000
x.      Friend              = user_id: 11
xi.     Elite_years         = user_id: 2780

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer:"no"
	
	
	SQL code used to arrive at answer:
SELECT COUNT(*) AS NullCount
    FROM user
    WHERE id IS NULL OR 
        name IS NULL OR 
        review_count IS NULL OR 
        yelping_since IS NULL OR
        useful IS NULL OR 
        funny IS NULL OR 
        cool IS NULL OR 
        fans IS NULL OR 
        average_stars IS NULL OR 
        compliment_hot IS NULL OR 
        compliment_more IS NULL OR 
        compliment_profile IS NULL OR 
        compliment_cute IS NULL OR 
        compliment_list IS NULL OR 
        compliment_note IS NULL OR 
        compliment_plain IS NULL OR 
        compliment_cool IS NULL OR 
        compliment_funny IS NULL OR 
        compliment_writer IS NULL OR 
        compliment_photos IS NULL 
	
	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

		 SELECT AVG(column)
		    FROM table

i. Table: Review, Column: Stars

    min: 1      max: 5      avg: 3.7082
    

ii. Table: Business, Column: Stars

    min: 1      max: 5      avg: 3.6549
    

iii. Table: Tip, Column: Likes

    min: 0      max: 2      avg: 0.0144
    

iv. Table: Checkin, Column: Count

    min: 1      max: 53     avg: 1.9414
    

v. Table: User, Column: Review_count

    min: 0      max: 2000   avg: 24.2995
		

	


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
	    SELECT city, SUM(review_count) AS reviews
      	    FROM business
	    GROUP BY city
	    ORDER BY reviews DESC

	
	Copy and Paste the Result Below:
	
+-----------------+---------+
| city            | reviews |
+-----------------+---------+
| Las Vegas       |   82854 |
| Phoenix         |   34503 |
| Toronto         |   24113 |
| Scottsdale      |   20614 |
| Charlotte       |   12523 |
| Henderson       |   10871 |
| Tempe           |   10504 |
| Pittsburgh      |    9798 |
| Montréal        |    9448 |
| Chandler        |    8112 |
| Mesa            |    6875 |
| Gilbert         |    6380 |
| Cleveland       |    5593 |
| Madison         |    5265 |
| Glendale        |    4406 |
| Mississauga     |    3814 |
| Edinburgh       |    2792 |
| Peoria          |    2624 |
| North Las Vegas |    2438 |
| Markham         |    2352 |
| Champaign       |    2029 |
| Stuttgart       |    1849 |
| Surprise        |    1520 |
| Lakewood        |    1465 |
| Goodyear        |    1155 |
+-----------------+---------+
(Output limit exceeded, 25 of 362 total rows shown)


6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

  SELECT stars AS [star rating], SUM(review_count) AS count
    FROM business
    WHERE city == 'Avon'
    GROUP BY stars	


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
+-------------+-------+
| star rating | count |
+-------------+-------+
|         1.5 |    10 |
|         2.5 |     6 |
|         3.5 |    88 |
|         4.0 |    21 |
|         4.5 |    31 |
|         5.0 |     3 |
+-------------+-------+


ii. Beachwood

SQL code used to arrive at answer:
    SELECT stars AS [star rating], SUM(review_count) AS count
    FROM business
    WHERE city == 'Beachwood'
    GROUP BY stars	


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
+-------------+-------+
| star rating | count |
+-------------+-------+
|         2.0 |     8 |
|         2.5 |     3 |
|         3.0 |    11 |
|         3.5 |     6 |
|         4.0 |    69 |
|         4.5 |    17 |
|         5.0 |    23 |
+-------------+-------+


7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
	
    SELECT name AS user, review_count AS reviews
    FROM user
    ORDER BY review_count DESC
    LIMIT 3	

	Copy and Paste the Result Below:
+--------+---------+
| user   | reviews |
+--------+---------+
| Gerald |    2000 |
| Sara   |    1629 |
| Yuri   |    1339 |
+--------+---------+		


8. Does posing more reviews correlate with more fans?
	Yes, posing more reiews correlates with more fans.

	Please explain your findings and interpretation of the results:
	    SELECT name,
              review_count AS reviews,
              fans,
              yelping_since
	    FROM user
	    ORDER BY fans DESC
	
+-----------+---------+------+---------------------+
| name      | reviews | fans | yelping_since       |
+-----------+---------+------+---------------------+
| Amy       |     609 |  503 | 2007-07-19 00:00:00 |
| Mimi      |     968 |  497 | 2011-03-30 00:00:00 |
| Harald    |    1153 |  311 | 2012-11-27 00:00:00 |
| Gerald    |    2000 |  253 | 2012-12-16 00:00:00 |
| Christine |     930 |  173 | 2009-07-08 00:00:00 |
| Lisa      |     813 |  159 | 2009-10-05 00:00:00 |
| Cat       |     377 |  133 | 2009-02-05 00:00:00 |
| William   |    1215 |  126 | 2015-02-19 00:00:00 |
| Fran      |     862 |  124 | 2012-04-05 00:00:00 |
| Lissa     |     834 |  120 | 2007-08-14 00:00:00 |
| Mark      |     861 |  115 | 2009-05-31 00:00:00 |
| Tiffany   |     408 |  111 | 2008-10-28 00:00:00 |
| bernice   |     255 |  105 | 2007-08-29 00:00:00 |
| Roanna    |    1039 |  104 | 2006-03-28 00:00:00 |
| Angela    |     694 |  101 | 2010-10-01 00:00:00 |
| .Hon      |    1246 |  101 | 2006-07-19 00:00:00 |
| Ben       |     307 |   96 | 2007-03-10 00:00:00 |
| Linda     |     584 |   89 | 2005-08-07 00:00:00 |
| Christina |     842 |   85 | 2012-10-08 00:00:00 |
| Jessica   |     220 |   84 | 2009-01-12 00:00:00 |
| Greg      |     408 |   81 | 2008-02-16 00:00:00 |
| Nieves    |     178 |   80 | 2013-07-08 00:00:00 |
| Sui       |     754 |   78 | 2009-09-07 00:00:00 |
| Yuri      |    1339 |   76 | 2008-01-03 00:00:00 |
| Nicole    |     161 |   73 | 2009-04-30 00:00:00 |
+-----------+---------+------+---------------------+
(Output limit exceeded, 25 of 10000 total rows shown)


	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer:There are more reviews with the word "love", with 1780 exisence in review.
    	
	SQL code used to arrive at answer:


        SELECT COUNT(*) AS [love occurrence]
        FROM review							
        WHERE text LIKE "%love%"

+-----------------+
| love occurrence |
+-----------------+
|            1780 |
+-----------------+  

  SELECT COUNT(*) AS [hate occurrence]
        FROM review							
        WHERE text LIKE "%hate%"

+-----------------+
| hate occurrence |
+-----------------+
|             232 |
+-----------------+
	
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
		SELECT name, fans
		FROM user
		ORDER BY fans DESC
		LIMIT 10


Copy and Paste the Result Below:

+-----------+------+
| name      | fans |
+-----------+------+
| Amy       |  503 |
| Mimi      |  497 |
| Harald    |  311 |
| Gerald    |  253 |
| Christine |  173 |
| Lisa      |  159 |
| Cat       |  133 |
| William   |  126 |
| Fran      |  124 |
| Lissa     |  120 |
+-----------+------+
		


