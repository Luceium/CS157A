-- Find every business (business id, business name) in California that has the word “Coffee” (case-sensitive) in its
-- name but is not classified as a coffee place (i.e. has no word “Coffee” in any of its categories). List the business
-- id, and name in ascending bid

SELECT b.bid, b.name
FROM Business b, BusinessCategory bc
WHERE b.state LIKE "CA" AND b.name LIKE "%Coffee%" AND bc.bcid=b.bcid AND bc.name NOT LIKE "%Coffee%"
ORDER BY b.bid;

-- TEST
-- select b.bid, b.name, c.name from Business b, BusinessCategory c WHERE (b.bid LIKE "B4" OR b.bid LIKE "B8") AND b.bcid=c.bcid;