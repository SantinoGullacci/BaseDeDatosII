MATCH (e:Estudiante)-[r:INSCRIPTO_EN]->(curso)
WITH e, AVG(r.nota) AS promedio
RETURN e, promedio;