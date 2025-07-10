// CREACIÓN DE EMPLEADOS --------------------------------------------
CREATE (juan:Empleado {nombre: 'Juan', empleado: 'programador'})
CREATE (ramon:Empleado {nombre: 'Ramon', empleado: 'programador'})
CREATE (maria:Empleado {nombre: 'María', empleado: 'asesor'})
CREATE (pablo:Empleado {nombre: 'Pablo', empleado: 'asesor'})

// CREACIÓN DE DEPARTAMENTOS ----------------------------------------
CREATE (desarrollo:Departamento {nombre: 'Desarrollo'})
CREATE (marketing:Departamento {nombre: 'Marketing'})
CREATE (administracion:Departamento {nombre: 'Administracion'})

// CREACIÓN DE PROYECTOS --------------------------------------------
CREATE (proyecto1:Proyecto {nombre: 'Aplicacion'})
CREATE (proyecto2:Proyecto {nombre: 'Sitio Web'})