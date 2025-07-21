from db import usuarios, recetas
from datetime import datetime
from bson import ObjectId

# Crear usuario
usuario_id = usuarios.insert_one({
    "nombre": "Chef Ana",
    "email": "ana@chef.com",
    "nivel": "Intermedio",
    "recetasPublicadas": 15,
    "seguidores": 234
}).inserted_id

# Crear receta asociada a ese usuario
recetas.insert_one({
    "titulo": "Paella Valenciana",
    "descripcion": "Receta tradicional española",
    "autorId": usuario_id,
    "ingredientes": [
        {"nombre": "arroz", "cantidad": "400g"},
        {"nombre": "pollo", "cantidad": "1 kg"}
    ],
    "instrucciones": ["Paso 1...", "Paso 2..."],
    "tiempoCoccion": 45,
    "dificultad": "Media",
    "tipoCocina": "Española",
    "likes": 127,
    "fechaPublicacion": datetime.now()
})
