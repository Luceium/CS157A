-- Find the users yelp_id who were born in CA but never visited CA

SELECT u.id FROM User u WHERE u.birthPlace LIKE "CA" AND NOT EXISTS (
    SELECT * FROM Checkin c, Business b WHERE c.uid=u.id AND c.bid=b.bid AND b.state LIKE "CA"
);