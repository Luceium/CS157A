-- Find all the business IDs whose ALL reviewers have at least 1 friend in their friend list.
-- Order by number of reviews (decreasing), break ties by business ID (increasing).

SELECT b.bid, COUNT(1) AS bCount
FROM Review r
INNER JOIN Business b ON r.bid=b.bid
WHERE EXISTS (SELECT 1 FROM Friends f WHERE f.uid1=r.author)
GROUP BY b.bid
HAVING COUNT(1) = (SELECT COUNT(1) FROM Review rr WHERE rr.bid=b.bid)
ORDER BY bCount DESC, b.bid;
