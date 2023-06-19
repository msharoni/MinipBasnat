SELECT id, firstname, lastname, cost,
  NTILE(10) OVER (ORDER BY percent) AS group_number
FROM (
  SELECT id, firstname, lastname, cost,
    (cost / (SELECT AVG(cost) FROM bed B WHERE B.zip = Bed.zip)) * 100 AS percent
  FROM ((Human NATURAL JOIN Student) INNER JOIN Rent ON Id = Studentid) NATURAL JOIN Bed
  WHERE cost > (SELECT AVG(cost) FROM bed B WHERE B.zip = Bed.zip)
) subquery
WHERE percent BETWEEN 100 AND 140;
