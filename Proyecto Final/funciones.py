from bson import ObjectId
from datetime import datetime
from db import usuarios, recetas, comentarios, likes
from bson import ObjectId

def obtener_usuarios():
    return list(usuarios.find({}, {"nombre": 1}))

def crear_usuario(nombre, email, nivel="Básico"):
    nuevo = {
        "nombre": nombre,
        "email": email,
        "nivel": nivel,
        "recetasPublicadas": 0,
        "seguidores": 0
    }
    resultado = usuarios.insert_one(nuevo)
    return resultado.inserted_id


def publicarReceta(receta):
    receta["likes"] = 0
    receta["fechaPublicacion"] = datetime.now()
    return recetas.insert_one(receta).inserted_id

def buscarPorIngrediente(ingrediente):
    pipeline = [
        {"$match": {"ingredientes.nombre": {"$regex": ingrediente, "$options": "i"}}},
        {
            "$lookup": {
                "from": "comentarios",
                "localField": "_id",
                "foreignField": "recetaId",
                "as": "comentarios"
            }
        }
    ]
    return list(recetas.aggregate(pipeline))


# Funcion LIKE 
def like(receta_id, usuario_id, existe):

    if existe:
        # Eliminacion de like
        likes.delete_one({
            "usuarioId": usuario_id,
            "recetaId": receta_id
        })

        # Eliminacion de like en la receta
        recetas.update_one(
            {"_id": receta_id},
            {"$inc": {"likes": -1}}
        )

        return "Eliminaste tu like de la receta elegida."
    
    else:
        # Registro de like
        likes.insert_one({
            "usuarioId": usuario_id,        # Se registra la id del usuario junto con
            "recetaId": receta_id,          # la id de la receta para que no se pueda
            "fecha": datetime.now()         # dar mas de un like por usuario.
        })

        # Registro de like en la receta
        recetas.update_one(
            {"_id": receta_id},
            {"$inc": {"likes": 1}}
        )

        return "Le diste like a la receta elegida."
    

def comentarReceta(recetaId, usuarioId, comentario):
    nuevo = {
        "recetaId": ObjectId(recetaId),
        "autorId": ObjectId(usuarioId),
        "texto": comentario["texto"],
        "calificacion": comentario["calificacion"],
        "fecha": datetime.now()
    }
    comentarios.insert_one(nuevo)
    return "Comentario agregado"

# Funcion TOP_RECETAS 
def top_recetas(limit=5):

    # Ordenar en orden descendente las 5 recetas mas likeadas
    top = recetas.find().sort("likes", -1).limit(limit)
    
    # Obtener y almacenar la informacion de las recetas
    resultado = []
    for receta in top:
        resultado.append({
            "titulo": receta["titulo"],             # Solo guardamos el titulo y los likes
            "likes": receta.get("likes", 0),        # (se puede cambiar igual).
        })
    
    return resultado