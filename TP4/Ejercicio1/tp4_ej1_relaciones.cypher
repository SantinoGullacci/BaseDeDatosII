// SIMPLIFICACIÓN DE NODOS ------------------------------------------

// Empleados
MATCH (j:Empleado {nombre: 'Juan'})
MATCH (r:Empleado {nombre: 'Ramon'})
MATCH (m:Empleado {nombre: 'María'})
MATCH (p:Empleado {nombre: 'Pablo'})

// Departamentos
MATCH (D:Departamento {nombre: 'Desarrollo'})
MATCH (M:Departamento {nombre: 'Marketing'})
MATCH (A:Departamento {nombre: 'Administracion'})

// Proyectos
MATCH (p1:Proyecto {nombre: 'Aplicacion'})
MATCH (p2:Proyecto {nombre: 'Sitio Web'})

// DEFINICIÓN DE RELACIONES -----------------------------------------

// Relaciones Departamentos
CREATE (j) - [:TRABAJA_EN] -> (D)
CREATE (r) - [:TRABAJA_EN] -> (D)
CREATE (m) - [:TRABAJA_EN] -> (M)
CREATE (p) - [:TRABAJA_EN] -> (A)

// Relaciones Proyectos
CREATE (j) - [:LIDERA] -> (p1)
CREATE (j) - [:LIDERA] -> (p2)
CREATE (r) - [:TRABAJA {horas: 20}] -> (p1)
CREATE (r) - [:TRABAJA {horas: 10}] -> (p2)
CREATE (m) - [:TRABAJA {horas: 16}] -> (p2)
CREATE (p) - [:TRABAJA {horas: 12}] -> (p1)