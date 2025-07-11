MATCH (e:Estudiante)-[r:INSCRIPTO_EN]->(curso)-[:DICTA]->(materia)
WITH materia, AVG(r.nota) AS promedio
WHERE promedio < 7
RETURN materia, promedio;