class Categoria {
  int id;
  String nombre;
  String foto;

  Categoria(this.id, this.nombre, this.foto);
}

final Menu = [
  Categoria(1, "Niños", "ui_nino.png"),
  Categoria(2, "Educadoras", "ui_edu.png"),
  Categoria(3, "Niveles", "ui_niveles.png"),
  Categoria(4, "Eventos", "ui_evento.png"),
];
