-- SQL Script


Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?
	The 4-5 star group tends to have shorter hours then the 2-3 star group.

ii. Do the two groups you chose to analyze have a different number of reviews?
	Yes, 4-5 star group tends to have more reviews        
 
iii. Are you able to infer anything from the location data provided between these two groups? Explain.
	No, every business is in a different zip-code.


SQL code used for analysis:
-- BEGIN SQL CODE
SELECT B.name,
            B.review_count,
            H.hours,
            postal_code,
            CASE
                WHEN hours LIKE "%monday%" THEN 1
                WHEN hours LIKE "%tuesday%" THEN 2
                WHEN hours LIKE "%wednesday%" THEN 3
                WHEN hours LIKE "%thursday%" THEN 4
                WHEN hours LIKE "%friday%" THEN 5
                WHEN hours LIKE "%saturday%" THEN 6
                WHEN hours LIKE "%sunday%" THEN 7
            END AS ord,
            CASE
                WHEN B.stars BETWEEN 2 AND 3 THEN '2-3 stars'
                WHEN B.stars BETWEEN 4 AND 5 THEN '4-5 stars'
            END AS star_rating
        FROM business B INNER JOIN hours H
        ON B.id = H.business_id
        INNER JOIN category C
        ON C.business_id = B.id
        WHERE (B.city == 'Las Vegas'
        AND
        C.category LIKE 'shopping')
        AND
        (B.stars BETWEEN 2 AND 3
        OR
        B.stars BETWEEN 4 AND 5)
        GROUP BY stars,ord
        ORDER BY star_rating, ord ASC
-- END SQL CODE

		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
         The businesses that are open tend to have more reviews than those closed on average.
		
        Open:   AVG(review_count) = 31.757
        Closed: AVG(review_count0 = 23.198

         
ii. Difference 2:
The average star rating is higher for businesses that are open than those closed.
	
        Open:   AVG(stars) = 3.679
        Closed: AVG(stars) = 3.520
	
	
	SQL code used for analysis:
	
		SELECT COUNT(DISTINCT(id)),
            AVG(review_count),
            SUM(review_count),
            AVG(stars),
            is_open
		FROM business
		GROUP BY is_open
         
         
         
SQL code used for analysis:

	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
         Predicting whether a business will stay open or close. 
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
          In order to understand the importance of different factors which will help their business stay open. 
         Some column field may be important such as 
        number of reviews, star rating of business, hours open, and location.
		
        In addition, it would be nice to  gather the latitude and longitude, city, state, 
		postal_code, and address to make processing easier later on. 
        
        Attributes as well as categories is used to better distinguish 
        between different types of businesses. 
		
                  
iii. Output of your finished dataset:
         +--------------------------------+-----------------------------+---------------+-------+-------------+----------+-----------+--------------+-------+--------------+---------------+-----------------+----------------+--------------+----------------+--------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------+
| name                           | address                     | city          | state | postal_code | latitude | longitude | review_count | stars | monday_hours | tuesday_hours | wednesday_hours | thursday_hours | friday_hours | saturday_hours | sunday_hours | categories                                                                                                                                                                                                 | attributes                                                                                                                                                                                                                                                                                                                          | is_open |
+--------------------------------+-----------------------------+---------------+-------+-------------+----------+-----------+--------------+-------+--------------+---------------+-----------------+----------------+--------------+----------------+--------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------+
| Flaming Kitchen                | 3235 York Regional Road 7   | Markham       | ON    | L3R 3P9     |  43.8484 |  -79.3487 |           25 |   3.0 | 12:00-23:00  | 12:00-23:00   | 12:00-23:00     | 12:00-23:00    | 12:00-23:00  | 12:00-23:00    | 12:00-23:00  | Asian Fusion,Restaurants                                                                                                                                                                                   | RestaurantsTableService,GoodForMeal,Alcohol,Caters,HasTV,RestaurantsGoodForGroups,NoiseLevel,WiFi,RestaurantsAttire,RestaurantsReservations,OutdoorSeating,RestaurantsPriceRange2,BikeParking,RestaurantsDelivery,Ambience,RestaurantsTakeOut,GoodForKids,BusinessParking                                                           |       1 |
| Freeman's Car Stereo           | 4821 South Blvd             | Charlotte     | NC    | 28217       |  35.1727 |  -80.8755 |            8 |   3.5 | 9:00-19:00   | 9:00-19:00    | 9:00-19:00      | 9:00-19:00     | 9:00-19:00   | 9:00-17:00     | None         | Electronics,Shopping,Automotive,Car Stereo Installation                                                                                                                                                    | BusinessAcceptsCreditCards,RestaurantsPriceRange2,BusinessParking,WheelchairAccessible                                                                                                                                                                                                                                              |       1 |
| Motors & More                  | 2315 Highland Dr            | Las Vegas     | NV    | 89102       |  36.1465 |  -115.167 |            7 |   5.0 | 7:00-17:00   | 7:00-17:00    | 7:00-17:00      | 7:00-17:00     | 7:00-17:00   | 8:00-12:00     | None         | Home Services,Solar Installation,Heating & Air Conditioning/HVAC                                                                                                                                           | BusinessAcceptsCreditCards,BusinessAcceptsBitcoin,ByAppointmentOnly                                                                                                                                                                                                                                                                 |       1 |
| Baby Cakes                     | 4145 Erie St                | Willoughby    | OH    | 44094       |  41.6399 |  -81.4064 |            5 |   3.5 | None         | 11:00-17:00   | 11:00-17:00     | 11:00-20:00    | 11:00-17:00  | 10:00-17:00    | None         | Bakeries,Food                                                                                                                                                                                              | BusinessAcceptsCreditCards,RestaurantsTakeOut,WheelchairAccessible,RestaurantsDelivery                                                                                                                                                                                                                                              |       1 |
| Snip-its Rocky River           | 21609 Center Ridge Rd       | Rocky River   | OH    | 44116       |  41.4595 |  -81.8587 |           18 |   2.5 | 10:00-19:00  | 10:00-19:00   | 10:00-19:00     | 10:00-19:00    | 10:00-19:00  | 9:00-17:30     | 10:00-16:00  | Beauty & Spas,Hair Salons                                                                                                                                                                                  | BusinessAcceptsCreditCards,RestaurantsPriceRange2,GoodForKids,BusinessParking,ByAppointmentOnly                                                                                                                                                                                                                                     |       1 |
| Standard Restaurant Supply     | 2922 E McDowell Rd          | Phoenix       | AZ    | 85008       |  33.4664 |  -112.018 |           15 |   3.5 | 8:00-18:00   | 8:00-18:00    | 8:00-18:00      | 8:00-18:00     | 8:00-18:00   | 9:00-17:00     | None         | Shopping,Wholesalers,Restaurant Supplies,Professional Services,Wholesale Stores                                                                                                                            | BusinessAcceptsCreditCards,RestaurantsPriceRange2,BusinessParking,BikeParking,WheelchairAccessible                                                                                                                                                                                                                                  |       1 |
| What A Bagel                   | 973 Eglinton Avenue W       | York          | ON    | M6C 2C4     |  43.6999 |  -79.4295 |            8 |   3.0 | 6:00-15:30   | 6:00-15:30    | 6:00-15:30      | 6:00-15:30     | 6:00-15:30   | 6:00-15:30     | None         | Restaurants,Bagels,Breakfast & Brunch,Food                                                                                                                                                                 | NoiseLevel,RestaurantsAttire,RestaurantsTableService,OutdoorSeating                                                                                                                                                                                                                                                                 |       1 |
| Pinnacle Fencing Solutions     |                             | Phoenix       | AZ    | 85060       |  33.4805 |  -111.997 |           13 |   4.0 | 8:00-16:00   | 8:00-16:00    | 8:00-16:00      | 8:00-16:00     | 8:00-16:00   | None           | None         | Home Services,Contractors,Fences & Gates                                                                                                                                                                   | BusinessAcceptsCreditCards,ByAppointmentOnly                                                                                                                                                                                                                                                                                        |       1 |
| Alterations Express            | 17240 Royalton Rd           | Strongsville  | OH    | 44136       |  41.3141 |  -81.8207 |            3 |   4.0 | 8:00-19:00   | 8:00-19:00    | 8:00-19:00      | 8:00-19:00     | 8:00-19:00   | 8:00-18:00     | None         | Shopping,Bridal,Dry Cleaning & Laundry,Local Services,Sewing & Alterations                                                                                                                                 | BusinessParking,BusinessAcceptsCreditCards,RestaurantsPriceRange2,BusinessAcceptsBitcoin,BikeParking,ByAppointmentOnly,WheelchairAccessible                                                                                                                                                                                         |       1 |
| Extra Space Storage            | 2880 W Elliot Rd            | Chandler      | AZ    | 85224       |  33.3496 |  -111.892 |            5 |   4.0 | 8:00-17:30   | 8:00-17:30    | 8:00-17:30      | 8:00-17:30     | 8:00-17:30   | 8:00-17:30     | 10:00-14:00  | Home Services,Self Storage,Movers,Shopping,Local Services,Home Decor,Home & Garden                                                                                                                         | BusinessAcceptsCreditCards                                                                                                                                                                                                                                                                                                          |       1 |
| Gussied Up                     | 1090 Bathurst St            | Toronto       | ON    | M5R 1W5     |  43.6727 |  -79.4142 |            6 |   4.5 | None         | 11:00-19:00   | 11:00-19:00     | 11:00-19:00    | 11:00-19:00  | 11:00-17:00    | 12:00-16:00  | Women's Clothing,Shopping,Fashion                                                                                                                                                                          | BusinessAcceptsCreditCards,RestaurantsPriceRange2,BusinessParking,BikeParking                                                                                                                                                                                                                                                       |       1 |
| Buddy's Muffler & Exhaust      | 1509 Hickory Grove Rd       | Gastonia      | NC    | 28056       |  35.2772 |    -81.06 |            4 |   5.0 | 8:30-17:00   | 8:30-17:00    | 8:30-17:00      | 8:30-17:00     | 8:30-17:00   | 9:00-15:00     | None         | Automotive,Auto Repair                                                                                                                                                                                     | BusinessAcceptsCreditCards                                                                                                                                                                                                                                                                                                          |       1 |
| Five Guys                      | 2641 N 44th St, Ste 100     | Phoenix       | AZ    | 85008       |   33.478 |  -111.986 |           63 |   3.5 | 10:00-22:00  | 10:00-22:00   | 10:00-22:00     | 10:00-22:00    | 10:00-22:00  | 10:00-22:00    | 10:00-22:00  | American (New),Burgers,Fast Food,Restaurants                                                                                                                                                               | RestaurantsTableService,GoodForMeal,Alcohol,Caters,HasTV,RestaurantsGoodForGroups,NoiseLevel,WiFi,RestaurantsAttire,RestaurantsReservations,OutdoorSeating,BusinessAcceptsCreditCards,RestaurantsPriceRange2,BikeParking,RestaurantsDelivery,Ambience,RestaurantsTakeOut,GoodForKids,DriveThru,BusinessParking                      |       1 |
| All Storage - Anthem           | 2620 W Horizon Ridge Pkwy   | Henderson     | NV    | 89052       |  36.0021 |  -115.102 |            3 |   3.5 | 9:00-16:30   | 9:00-16:30    | 9:00-16:30      | 9:00-16:30     | 9:00-16:30   | 9:00-16:30     | None         | Truck Rental,Local Services,Self Storage,Parking,Automotive                                                                                                                                                | BusinessAcceptsCreditCards,BusinessAcceptsBitcoin                                                                                                                                                                                                                                                                                   |       1 |
| Mood                           | 1 Greenside Place           | Edinburgh     | EDH   | EH1 3AA     |   55.957 |  -3.18502 |           11 |   2.0 | None         | None          | None            | 22:30-3:00     | 22:00-3:00   | 22:00-3:00     | 22:30-3:00   | Dance Clubs,Nightlife                                                                                                                                                                                      | Alcohol,OutdoorSeating,BusinessAcceptsCreditCards,RestaurantsPriceRange2,AgesAllowed,Music,Smoking,RestaurantsGoodForGroups,WheelchairAccessible                                                                                                                                                                                    |       0 |
| Starbucks                      | 4605 E Chandler Blvd, Ste A | Phoenix       | AZ    | 85048       |  33.3044 |  -111.984 |           52 |   3.0 | 5:00-20:00   | 5:00-20:00    | 5:00-20:00      | 5:00-20:30     | 5:00-20:00   | 5:00-20:00     | 5:00-20:00   | Coffee & Tea,Food                                                                                                                                                                                          | BusinessParking,Caters,WiFi,OutdoorSeating,BusinessAcceptsCreditCards,RestaurantsPriceRange2,BikeParking,RestaurantsTakeOut                                                                                                                                                                                                         |       1 |
| Big Smoke Burger               | 260 Yonge Street            | Toronto       | ON    | M4B 2L9     |  43.6546 |  -79.3805 |           47 |   3.0 | 10:30-21:00  | 10:30-21:00   | 10:30-21:00     | 10:30-21:00    | 10:30-21:00  | 10:30-21:00    | 11:00-19:00  | Poutineries,Burgers,Restaurants                                                                                                                                                                            | RestaurantsTableService,GoodForMeal,Alcohol,Caters,HasTV,RestaurantsGoodForGroups,NoiseLevel,WiFi,RestaurantsAttire,RestaurantsReservations,OutdoorSeating,BusinessAcceptsCreditCards,RestaurantsPriceRange2,WheelchairAccessible,BikeParking,RestaurantsDelivery,Ambience,RestaurantsTakeOut,GoodForKids,DriveThru,BusinessParking |       1 |
| Subway                         | 2904 Yorkmont Rd            | Charlotte     | NC    | 28208       |  35.1903 |  -80.9288 |            7 |   3.5 | 6:00-22:00   | 6:00-22:00    | 6:00-22:00      | 6:00-22:00     | 6:00-22:00   | 10:00-21:00    | None         | Fast Food,Restaurants,Sandwiches                                                                                                                                                                           | Ambience,RestaurantsPriceRange2,GoodForKids                                                                                                                                                                                                                                                                                         |       1 |
| Red Rock Canyon Visitor Center | 1000 Scenic Loop Dr         | Las Vegas     | NV    | 89161       |  36.1357 |  -115.428 |           32 |   4.5 | 8:00-16:30   | 8:00-16:30    | 8:00-16:30      | 8:00-16:30     | 8:00-16:30   | 8:00-16:30     | 8:00-16:30   | Education,Visitor Centers,Professional Services,Special Education,Local Services,Community Service/Non-Profit,Hotels & Travel,Travel Services,Gift Shops,Shopping,Parks,Hiking,Flowers & Gifts,Active Life | BusinessAcceptsCreditCards,GoodForKids                                                                                                                                                                                                                                                                                              |       1 |
| Scent From Above Company       | 2501 W Behrend Dr, Ste 67   | Scottsdale    | AZ    | 85027       |  33.6656 |  -112.111 |           14 |   4.5 | 6:00-16:00   | 6:00-16:00    | 6:00-16:00      | 6:00-16:00     | 6:00-16:00   | None           | None         | Home Cleaning,Local Services,Professional Services,Carpet Cleaning,Home Services,Office Cleaning,Window Washing                                                                                            | BusinessAcceptsCreditCards,ByAppointmentOnly                                                                                                                                                                                                                                                                                        |       1 |
| The Charlotte Room             | 19 Charlotte Street         | Toronto       | ON    | M5V 2H5     |  43.6466 |  -79.3938 |           10 |   3.5 | 15:00-1:00   | 15:00-1:00    | 15:00-1:00      | 15:00-1:00     | 15:00-2:00   | 18:00-2:00     | None         | Event Planning & Services,Bars,Nightlife,Lounges,Pool Halls,Venues & Event Spaces                                                                                                                          | BusinessParking,HasTV,CoatCheck,NoiseLevel,OutdoorSeating,BusinessAcceptsCreditCards,RestaurantsPriceRange2,Music,WheelchairAccessible,Smoking,Ambience,BestNights,RestaurantsGoodForGroups,HappyHour,GoodForDancing,Alcohol                                                                                                        |       0 |
| PC Savants                     | 11966 W Candelaria Ct       | Sun City      | AZ    | 85373       |  33.6901 |  -112.319 |           11 |   5.0 | 10:00-19:00  | 10:00-19:00   | 10:00-19:00     | 10:00-19:00    | 10:00-19:00  | 11:00-18:00    | 11:00-18:00  | IT Services & Computer Repair,Electronics Repair,Local Services,Mobile Phone Repair                                                                                                                        | BusinessAcceptsCreditCards,BusinessAcceptsBitcoin                                                                                                                                                                                                                                                                                   |       1 |
| Sweet Ruby Jane Confections    | 8975 S Eastern Ave, Ste 3-B | Las Vegas     | NV    | 89123       |   36.015 |  -115.118 |           30 |   4.0 | 10:00-19:00  | 10:00-19:00   | 10:00-19:00     | 10:00-19:00    | 10:00-19:00  | 10:00-19:00    | None         | Food,Chocolatiers & Shops,Bakeries,Specialty Food,Desserts                                                                                                                                                 | BusinessAcceptsCreditCards,RestaurantsPriceRange2,BusinessParking,WheelchairAccessible                                                                                                                                                                                                                                              |       0 |
| Oinky's Pork Chop Heaven       | 22483 Emery Rd              | North Randall | OH    | 44128       |  41.4352 |  -81.5214 |            3 |   3.0 | 6:00-23:00   | 6:00-23:00    | 6:00-23:00      | 6:00-23:00     | 6:00-23:00   | 6:00-23:00     | 6:00-23:00   | Soul Food,Restaurants                                                                                                                                                                                      | RestaurantsAttire,RestaurantsGoodForGroups,GoodForKids,RestaurantsReservations,RestaurantsTakeOut                                                                                                                                                                                                                                   |       1 |
| Sushi Osaka                    | 5084 Dundas Street W        | Toronto       | ON    | M9A 1C2     |  43.6452 |  -79.5324 |            8 |   4.5 | 11:00-23:00  | 11:00-23:00   | 11:00-23:00     | 11:00-23:00    | 11:00-23:00  | 11:00-23:00    | 14:00-23:00  | Sushi Bars,Restaurants,Japanese,Korean                                                                                                                                                                     | RestaurantsTakeOut,WiFi,RestaurantsGoodForGroups,RestaurantsReservations                                                                                                                                                                                                                                                            |       1 |
+--------------------------------+-----------------------------+---------------+-------+-------------+----------+-----------+--------------+-------+--------------+---------------+-----------------+----------------+--------------+----------------+--------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------+
(Output limit exceeded, 25 of 70 total rows shown)

         
iv. Provide the SQL code you used to create your final dataset:
SELECT Bu.name, Bu.address, Bu.city, Bu.state, Bu.postal_code,
			   Bu.latitude, Bu.longitude, Bu.review_count, Bu.stars,
			   MAX(CASE
			   WHEN H.hours LIKE "%monday%" THEN TRIM(H.hours,'%MondayTuesWednesThursFriSatSun|%') 
			   END) AS monday_hours,
			   MAX(CASE
			   WHEN H.hours LIKE "%tuesday%" THEN TRIM(H.hours,'%MondayTuesWednesThursFriSatSun|%') 
			   END) AS tuesday_hours,
			   MAX(CASE
			   WHEN H.hours LIKE "%wednesday%" THEN TRIM(H.hours,'%MondayTuesWednesThursFriSatSun|%') 
			   END) AS wednesday_hours,
			   MAX(CASE
			   WHEN H.hours LIKE "%thursday%" THEN TRIM(H.hours,'%MondayTuesWednesThursFriSatSun|%') 
			   END) AS thursday_hours,
			   MAX(CASE
			   WHEN H.hours LIKE "%friday%" THEN TRIM(H.hours,'%MondayTuesWednesThursFriSatSun|%') 
			   END) AS friday_hours,
			   MAX(CASE
			   WHEN H.hours LIKE "%saturday%" THEN TRIM(H.hours,'%MondayTuesWednesThursFriSatSun|%') 
			   END) AS saturday_hours,
			   MAX(CASE
			   WHEN H.hours LIKE "%sunday%" THEN TRIM(H.hours,'%MondayTuesWednesThursFriSatSun|%') 
			   END) AS sunday_hours,
			   GROUP_CONCAT(DISTINCT(C.category)) AS categories,
			   GROUP_CONCAT(DISTINCT(A.name)) AS attributes,
			   Bu.is_open
		FROM business Bu
		INNER JOIN hours H
		ON Bu.id = H.business_id
		INNER JOIN category C
		ON Bu.id = C.business_id
		INNER JOIN attribute A
		ON Bu.id = A.business_id
		GROUP BY Bu.id
