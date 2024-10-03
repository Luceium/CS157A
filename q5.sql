-- Find all the business IDs whose ALL reviewers have at least 1 friend in their friend list.
-- Order by number of reviews (decreasing), break ties by business ID (increasing).
SELECT b.bid, COUNT(1)
FROM Business b, Review r
WHERE b.bid = r.bid AND NOT EXISTS(
    SELECT 1
    WHERE NOT EXISTS (
            SELECT 1
            FROM Friends f
            WHERE r.author=f.uid1 OR r.author=f.uid2
        )
)
GROUP BY b.bid
ORDER BY COUNT(1) DESC, b.bid;
