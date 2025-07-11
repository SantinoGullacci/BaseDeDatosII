// Listar cuántos libros ha pedido prestado cada estudiante

MATCH (estudiante)-[:PRESTO]->(libro)
WITH estudiante, count(libro) as libros_prestados
WHERE libros_prestados >= 1
RETURN estudiante.nombre, libros_prestados;