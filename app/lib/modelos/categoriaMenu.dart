class CategoriaMenu {
  int id;
  String nombre;
  String foto;

  CategoriaMenu(this.id, this.nombre, this.foto);
}

final MenuC = [
  CategoriaMenu(1, "Registrar", 'ui_add.png'),
  CategoriaMenu(2, "Listar", 'ui_listar.png'),
  CategoriaMenu(3, "Eliminar", 'ui_eliminar.png'),
  CategoriaMenu(4, "Modificar", 'ui_add.png'),
];
