SELECT id, firstname, lastname, cost, gender,
  NTILE(10) OVER (ORDER BY percent) AS group_number
FROM (
  SELECT id, firstname, lastname, cost, gender,
    (cost / (SELECT AVG(cost) FROM bed B WHERE B.zip = Bed.zip)) * 100 AS percent
  FROM ((Human NATURAL JOIN Student) INNER JOIN Rent ON Id = Studentid) NATURAL JOIN Bed
  WHERE cost BETWEEN 100 AND 140
) subquery
WHERE cost > (SELECT AVG(cost) FROM bed B WHERE B.zip = Bed.zip)
GROUP BY id, firstname, lastname, cost, gender, percent;
