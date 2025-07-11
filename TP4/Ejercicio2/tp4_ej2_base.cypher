//crear estudiantes y carreras
CREATE (:Carrera {nombre: "Ingeniería en Sistemas"})
CREATE (:Carrera {nombre: "Medicina"})
CREATE (:Carrera {nombre: "Diseño Gráfico"});

CREATE (:Estudiante {nombre: "Lucía Gómez"})
CREATE (:Estudiante {nombre: "Martín Pérez"})
CREATE (:Estudiante {nombre: "Sofía Díaz"});

MATCH (e:Estudiante {nombre: "Lucía Gómez"}), (c:Carrera {nombre: "Ingeniería en Sistemas"})
CREATE (e)-[:PERTENECE_A]->(c);

MATCH (e:Estudiante {nombre: "Martín Pérez"}), (c:Carrera {nombre: "Medicina"})
CREATE (e)-[:PERTENECE_A]->(c);

MATCH (e:Estudiante {nombre: "Sofía Díaz"}), (c:Carrera {nombre: "Diseño Gráfico"})
CREATE (e)-[:PERTENECE_A]->(c);

//crear libros y categorías
CREATE (:Categoría {nombre: "Programación"})
CREATE (:Categoría {nombre: "Salud"})
CREATE (:Categoría {nombre: "Diseño"})
CREATE (:Categoría {nombre: "Bases de Datos"});

CREATE (:Libro {titulo: "Introducción a Python"})
CREATE (:Libro {titulo: "Atlas de Anatomía Humana"})
CREATE (:Libro {titulo: "Fundamentos de Diseño"})
CREATE (:Libro {titulo: "Bases de Datos para Principiantes"});

MATCH (l:Libro {titulo: "Introducción a Python"}), (c:Categoría {nombre: "Programación"})
CREATE (l)-[:PERTENECE_A]->(c);

MATCH (l:Libro {titulo: "Atlas de Anatomía Humana"}), (c:Categoría {nombre: "Salud"})
CREATE (l)-[:PERTENECE_A]->(c);

MATCH (l:Libro {titulo: "Fundamentos de Diseño"}), (c:Categoría {nombre: "Diseño"})
CREATE (l)-[:PERTENECE_A]->(c);

MATCH (l:Libro {titulo: "Bases de Datos para Principiantes"}), (c:Categoría {nombre: "Bases de Datos"})
CREATE (l)-[:PERTENECE_A]->(c);

//crear relaciones
MATCH (e:Estudiante {nombre: "Lucía Gómez"}), (l:Libro {titulo: "Introducción a Python"})
CREATE (e)-[:PRESTO {fecha: "2024-05-01", estado: "Devuelto"}]->(l);

MATCH (e:Estudiante {nombre: "Martín Pérez"}), (l:Libro {titulo: "Atlas de Anatomía Humana"})
CREATE (e)-[:PRESTO {fecha: "2024-06-10", estado: "Activo"}]->(l);

MATCH (e:Estudiante {nombre: "Sofía Díaz"}), (l:Libro {titulo: "Fundamentos de Diseño"})
CREATE (e)-[:PRESTO {fecha: "2024-07-03", estado: "Activo"}]->(l);

MATCH (e:Estudiante {nombre: "Lucía Gómez"}), (l:Libro {titulo: "Bases de Datos para Principiantes"})
CREATE (e)-[:PRESTO {fecha: "2024-06-20", estado: "Activo"}]->(l);

MATCH (e:Estudiante {nombre: "Martín Pérez"}), (l:Libro {titulo: "Introducción a Python"})
CREATE (e)-[:PRESTO {fecha: "2024-04-15", estado: "Devuelto"}]->(l);
