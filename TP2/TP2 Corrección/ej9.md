## Ejercicio 9: Replicación y sharding
___
## Replicacion

Usar un Replica Set nos otorga redundancia y disponibilidad de datos. Al tener multiples copias de datos en distintos servidores, la base de datos cuenta con una gran tolerancia a fallos. Si un servidor falla, no supone un problema significativo, ya que los datos que contenía están replicados en otro servidor. Además la replicación puede también otorgar una mayor capacidad de lectura, ya que los clientes pueden enviar operaciones de lectura a servidores distintos sin saturar un único servidor. También, de la mano con la lectura, la replicación ayuda a la disponibilidad de los datos, ya que no se satura un único servidor con peticiones de datos, sino que se pueden enviar peticiones a distintos servidores.
___
## Sharding

El sharding en bases de datos de alto volumen aporta una gran capacidad de lectura y escritura, ya que al distribuirse la carga de las operaciones de manera horizontal(en otros servidores) no existe una sobrecarga en un unico servidor, y por lo tanto estas operaciones pueden tener un flujo ideal en situaciones de alta demanda. También, al escalar el sistema de manera horizontal, el sharding otorga una mayor capacidad de almacenamiento de datos. Por último, el sharding provee una gran disponibilidad, ya que al tener el sistema dividido en múltiples instancias, si llegase a ocurrir algun desperfecto en un "shard", se puede igualmente seguir trabajando en las otras partes porque no todas funcionan en una única instancia.
