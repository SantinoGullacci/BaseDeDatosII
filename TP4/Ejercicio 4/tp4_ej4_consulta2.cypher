MATCH (e:Estudiante {nombre: 'Ana'}),
      (m:Materia {codigo: 'ED'})<-[:PRERREQUISITO_DE]-(req:Materia),
      (c:Curso)-[:DICTA]->(req),
      (e)-[r:INSCRIPTO_EN]->(c)
WITH collect(r.nota >= 6) AS condiciones
RETURN all(condicion IN condiciones WHERE condicion = true) AS PuedeInscribirse
