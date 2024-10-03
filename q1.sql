SELECT COUNT(*)
FROM (
        SELECT b.state, bc.name
        FROM Business b INNER JOIN BusinessCategory bc
        ON b.bcid = bc.bcid
        WHERE bc.name = 'National Parks'
    ) AS t
WHERE t.state LIKE "AZ" AND t.name LIKE "National Parks";