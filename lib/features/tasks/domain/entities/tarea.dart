class Tarea {
  final String id;
  final String titulo;
  final String descripcion;
  final String fecha;

  Tarea({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.fecha,
  });

  // Método para convertir el JSON en una instancia de Tarea
  factory Tarea.fromJson(Map<String, dynamic> json) {
    return Tarea(
      id: json['id'],
      titulo: json['titulo'],
      descripcion: json['descripcion'],
      fecha: json['fecha'],
    );
  }

  // Método para convertir una instancia de Tarea a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'descripcion': descripcion,
      'fecha': fecha,
    };
  }
}
