// Mostrar las categorías con más préstamos activos

MATCH (e:Estudiante)-[p:PRESTO{estado:'Activo'}]->(l:Libro)-[:PERTENECE_A]->(c:Categoría)
WITH c, count(l) as veces_prestado
WHERE veces_prestado> 0
RETURN c.nombre, veces_prestado
ORDER BY veces_prestado DESC LIMIT 3;