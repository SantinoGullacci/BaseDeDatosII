// CONSULTA 3: Listar los empleados que trabajan en más de un proyecto

MATCH (e:Empleado)-[:TRABAJA]->(p:Proyecto)
WITH e, count(DISTINCT p) AS cantidad_proyectos
WHERE cantidad_proyectos > 1
RETURN
  e.nombre AS Empleado,
  cantidad_proyectos