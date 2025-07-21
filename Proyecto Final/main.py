from funciones import publicarReceta, buscarPorIngrediente, like, comentarReceta, top_recetas, obtener_usuarios, crear_usuario
from db import recetas
from bson import ObjectId
from opciones import mostrar_menu, seleccionar_usuario, opcion_publicar, opcion_buscar,opcion_comentar, opcion_like, opcion_top

def main():
    print("\nInicio de sesión")
    usuario_actual = seleccionar_usuario()
    if not usuario_actual:
        print("No se seleccionó un usuario válido. Cerrando.")
        return

    while True:
        mostrar_menu()
        opcion = input("\nSelecciona una opción (1-6): ")
        if opcion == "1":
            opcion_publicar(usuario_actual)
        elif opcion == "2":
            opcion_buscar()
        elif opcion == "3":
            opcion_like(usuario_actual)
        elif opcion == "4":
            opcion_comentar(usuario_actual)
        elif opcion == "5":
            opcion_top()
        elif opcion == "6":
            print("Hasta luego!")
            break
        else:
            print("Opción inválida. Intentá de nuevo.")

if __name__ == "__main__":
    main()