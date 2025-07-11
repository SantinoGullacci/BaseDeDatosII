//Encontrar los estudiantes que no tienen préstamos activos

MATCH (e:Estudiante)
WHERE NOT (e)-[:PRESTO {estado: "Activo"}]->(:Libro)
RETURN e.nombre;