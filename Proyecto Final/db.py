from pymongo import MongoClient

client = MongoClient("mongodb://localhost:27017")
db = client["red_social_recetas"]

usuarios = db["usuarios"]
recetas = db["recetas"]
comentarios = db["comentarios"]
likes = db["likes"]
