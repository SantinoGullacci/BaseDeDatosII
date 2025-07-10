// CONSULTA 1: Obtener el nombre del proyecto, su líder y los empleados asignados

MATCH (l:Empleado)-[:LIDERA]->(p:Proyecto)
OPTIONAL MATCH (e:Empleado)-[t:TRABAJA]->(p)       // Acá usé un OPTIONAL MATCH por si se agregase un
RETURN                                             // proyecto sin empleados asignados.
  p.nombre AS Proyecto,
  l.nombre AS Lider,
  collect(DISTINCT e.nombre) AS Empleados_Asignados