-- List the users ids who are Male and complimented at least one female friend
-- Old Answer
-- SELECT u.id FROM User u WHERE u.gender LIKE "M" AND EXISTS(SELECT * FROM Compliment c, User r WHERE u.id=c.makerID AND c.recipientID=r.id AND r.gender LIKE "F");

SELECT DISTINCT u.id FROM User u, User r, Compliment c WHERE u.id=c.makerID AND c.recipientID=r.id AND u.gender LIKE "M" AND r.gender LIKE "F";