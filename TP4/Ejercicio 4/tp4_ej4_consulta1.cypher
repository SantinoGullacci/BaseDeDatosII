MATCH (e:Estudiante {nombre: 'Ana'})-[:INSCRIPTO_EN]->(c:Curso)-[:DICTA]->(m:Materia)
RETURN m.nombre AS Materia, c.año AS Año, c.ciclo AS Ciclo,
       e.nombre AS Estudiante, 
       c.codigo AS Curso, 
       m.codigo AS CodigoMateria
