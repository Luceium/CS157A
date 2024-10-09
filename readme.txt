Name: Mauricio Curiel

Tables created in createdb.sql:
+-------------------+
| Tables_in_yelp    |
+-------------------+
| Business          |
| BusinessCategory  |
| Checkin           |
| Comment           |
| Compliment        |
| ExceptionSchedule |
| Friends           |
| Likes             |
| Multimedia        |
| Review            |
| Schedule          |
| Subcategory       |
| TimeRange         |
| User              |
| Votes             |
+-------------------+

q1.sql results:
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+

q2.sql results:
+----+
| id |
+----+
| Y9 |
+----+

q3.sql results:
+-----+----------------------+
| bid | name                 |
+-----+----------------------+
| B4  | China  Coffee Toffee |
| B8  | Coffee Bar & Bistro  |
+-----+----------------------+

q4.sql results:
+----+
| id |
+----+
| Y4 |
| Y7 |
+----+

q5.sql results:
+-----+--------+
| bid | bCount |
+-----+--------+
| B14 |      3 |
| B2  |      3 |
| B4  |      3 |
| B11 |      1 |
| B13 |      1 |
| B5  |      1 |
| B7  |      1 |
| B9  |      1 |
+-----+--------+

q6.sql results:
+-------------------+------------+
| name              | bc_reviews |
+-------------------+------------+
| Restaurents       |          6 |
| Bars              |          5 |
| National Parks    |          3 |
| Food and More     |          3 |
| Coffee Shops      |          3 |
| Amusement Parks   |          1 |
| Career Counseling |          1 |
| Pool Cleaners     |          1 |
+-------------------+------------+