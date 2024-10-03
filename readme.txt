The readme.txt file must have your name, list of tables that your createdb.sql
file generates and execution result of query files (q1.sql…q6.sql). There is 10
points penalty if this file or some required information is missing from your submission.

Name: Mauricio Curiel,

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
+-----+----------+
| bid | COUNT(1) |
+-----+----------+
| B14 |        3 |
| B2  |        3 |
| B4  |        3 |
| B10 |        2 |
| B3  |        2 |
| B11 |        1 |
| B12 |        1 |
| B13 |        1 |
| B5  |        1 |
| B6  |        1 |
| B7  |        1 |
| B8  |        1 |
| B9  |        1 |
+-----+----------+

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