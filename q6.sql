-- Get the review counts for businesses in each business category. Results should be sorted by the Review counts in descending order.

SELECT bc.name, COUNT(1) AS bc_reviews
FROM BusinessCategory bc, Business b, Review r
WHERE bc.bcid=b.bcid AND b.bid=r.bid
GROUP BY bc.bcid
ORDER BY bc_reviews DESC;

-- TEST
-- SELECT COUNT(1) FROM Review