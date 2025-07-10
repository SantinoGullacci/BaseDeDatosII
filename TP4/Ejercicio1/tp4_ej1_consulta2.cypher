// CONSULTA 2: Calcular el total de horas semanales por proyecto

MATCH (:Empleado)-[t:TRABAJA]->(p:Proyecto)
RETURN
  p.nombre AS Proyecto,
  sum(t.horas) AS Total_Horas_Semanales