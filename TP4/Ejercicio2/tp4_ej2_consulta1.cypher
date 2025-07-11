//Obtener todos los libros actualmente prestados (estado "Activo" )

MATCH (e:Estudiante)-[p:PRESTO{estado:'Activo'}]->(libro)
RETURN libro