from funciones import publicarReceta, buscarPorIngrediente,  comentarReceta, like, top_recetas

from db import recetas, likes
from bson import ObjectId


def mostrar_menu():
    print("\n--- Red Social de Recetas ---")
    print("1. Publicar receta")
    print("2. Buscar por ingrediente")
    print("3. Dar/Quitar like a receta")
    print("4. Comentar receta")
    print("5. Ver top recetas")
    print("6. Salir")

def seleccionar_usuario():
    from funciones import obtener_usuarios, crear_usuario

    lista = obtener_usuarios()

    print("\n Usuarios existentes:")
    for i, u in enumerate(lista):
        print(f"{i + 1}. {u['nombre']} ({u['_id']})")

    print("0. Crear nuevo usuario")

    opcion = input("Seleccioná un usuario por número: ")

    if opcion == "0":
        print("\n--Creando nuevo usuario...")
        nombre = input("Nombre: ")
        email = input("Email: ")
        nivel = input("Nivel (Básico / Intermedio / Avanzado): ")

        user_id = crear_usuario(nombre, email, nivel)
        print(f"Usuario '{nombre}' creado con ID: {user_id}")
        return user_id

    try:
        indice = int(opcion) - 1
        if indice < 0 or indice >= len(lista):
            print("Índice inválido.")
            return None
        return lista[indice]["_id"]
    except:
        print("Entrada inválida.")
        return None


def opcion_publicar(usuario_actual):
    try:
        print("\n--- Publicar nueva receta ---")

        titulo = input("Título: ")
        descripcion = input("Descripción: ")
        tipoCocina = input("Tipo de cocina: ")
        dificultad = input("Dificultad: ")
        tiempo = int(input("Tiempo de cocción (min): "))

        ingredientes = []
        while True:
            nombre = input("Ingrediente (o Enter para terminar): ")
            if not nombre:
                break
            cantidad = input(f"Cantidad de {nombre}: ")
            ingredientes.append({"nombre": nombre, "cantidad": cantidad})

        instrucciones = []
        while True:
            paso = input("Instrucción (o Enter para terminar): ")
            if not paso:
                break
            instrucciones.append(paso)

        receta = {
            "titulo": titulo,
            "descripcion": descripcion,
            "autorId": usuario_actual,
            "ingredientes": ingredientes,
            "instrucciones": instrucciones,
            "tiempoCoccion": tiempo,
            "dificultad": dificultad,
            "tipoCocina": tipoCocina
        }

        receta_id = publicarReceta(receta)
        print("Receta publicada correctamente.")
        print("ID generado:", receta_id)

    except Exception as e:
        print("Error:", e)

def opcion_buscar():
    ingrediente = input("\nBuscar recetas con ingrediente: ")
    recetas_encontradas = buscarPorIngrediente(ingrediente)
    if not recetas_encontradas:
        print("No se encontraron recetas.")
        return

    for r in recetas_encontradas:
        print(f"\n{r['titulo']}")
        print(" - Cocina:", r.get("tipoCocina", "N/D"))
        print(" - Likes:", r.get("likes", 0))

        comentarios = r.get("comentarios", [])
        if comentarios:
            print("Comentarios:")
            for c in comentarios:
                print(f"   - {c['texto']} ({c['calificacion']})")
        else:
            print("Sin comentarios.")


# Opcion LIKE ------------------
def opcion_like(usuario_actual):
    try:
        # Busqueda de receta
        print("\n--- Dar/Quitar like ---")
        titulo = input("Título de la receta a modificar like: ")
        receta = recetas.find_one({"titulo": {"$regex": f"^{titulo}$", "$options": "i"}})
        
        # Verificacion de receta
        if not receta:
            print("Receta no encontrada.")
            return

        # Datos necesarios
        usuario_id = ObjectId(usuario_actual)
        receta_id = receta["_id"]
        
        # Verificacion de like
        existe = likes.find_one({"usuarioId": usuario_id, "recetaId": receta_id})

        print(like(receta_id, usuario_id, existe))

    except Exception as e:
        print("Error", e)   # Salida de error
    

def opcion_comentar(usuario_actual):
    try:
        titulo = input("\nTítulo de la receta a comentar: ")
        receta = recetas.find_one({"titulo": {"$regex": f"^{titulo}$", "$options": "i"}})

        if not receta:
            print("Receta no encontrada.")
            return

        texto = input("Comentario: ")
        calificacion = int(input("Calificación (1-5): "))

        comentarReceta(receta["_id"], usuario_actual, {
            "texto": texto,
            "calificacion": calificacion
        })

        print("Comentario agregado correctamente.")

    except Exception as e:
        print("Error:", e)


# Opcion TOP
def opcion_top():

    # Obtener las 5 recetas mas likeadas en orden descendiente
    top = top_recetas()

    # Mostrar el top de las recetas mas likeadas
    print("\n--- Las 5 recetas mas valoradas ---")
    i = 1
    for r in top:
        print(f"{i}. {r['titulo']} - [ {r['likes']} likes ]")
        i += 1