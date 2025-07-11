// Estudiantes
CREATE (e1:Estudiante {nombre: 'Ana', legajo: '1001'});
CREATE (e2:Estudiante {nombre: 'Luis', legajo: '1002'});
CREATE (e3:Estudiante {nombre: 'Sofía', legajo: '1003'});

// Materias
CREATE (m1:Materia {nombre: 'Matemática I', codigo: 'MAT1'});
CREATE (m2:Materia {nombre: 'Algoritmos', codigo: 'ALG'});
CREATE (m3:Materia {nombre: 'Estructuras de Datos', codigo: 'ED'});

// Prerrequisitos
CREATE (m1)-[:PRERREQUISITO_DE]->(m3);
CREATE (m2)-[:PRERREQUISITO_DE]->(m3);

// Cursos (dictan materias)
CREATE (c1:Curso {codigo: 'C1', año: 2024, ciclo: '1er semestre'});
CREATE (c2:Curso {codigo: 'C2', año: 2024, ciclo: '2do semestre'});
CREATE (c3:Curso {codigo: 'C3', año: 2025, ciclo: '1er semestre'});
CREATE (c4:Curso {codigo: 'C4', año: 2025, ciclo: '2do semestre'});

MATCH (m1:Materia {codigo: 'MAT1'}), (m2:Materia {codigo: 'ALG'}), (m3:Materia {codigo: 'ED'}),
      (c1:Curso {codigo: 'C1'}), (c2:Curso {codigo: 'C2'}), (c3:Curso {codigo: 'C3'}), (c4:Curso {codigo: 'C4'})
CREATE (c1)-[:DICTA]->(m1),
       (c2)-[:DICTA]->(m2),
       (c3)-[:DICTA]->(m1),
       (c4)-[:DICTA]->(m3);

// Inscripciones con nota
MATCH (e1:Estudiante {legajo: '1001'}), (e2:Estudiante {legajo: '1002'}), (e3:Estudiante {legajo: '1003'}),
      (c1:Curso {codigo: 'C1'}), (c2:Curso {codigo: 'C2'}), (c4:Curso {codigo: 'C4'})
CREATE (e1)-[:INSCRIPTO_EN {nota: 8}]->(c1),
       (e1)-[:INSCRIPTO_EN {nota: 6}]->(c2),
       (e1)-[:INSCRIPTO_EN {nota: 9}]->(c4),
       (e2)-[:INSCRIPTO_EN {nota: 7}]->(c1),
       (e2)-[:INSCRIPTO_EN {nota: 5}]->(c2),
       (e3)-[:INSCRIPTO_EN {nota: 4}]->(c1);
