import 'package:examen1oscar/features/tasks/data/repositories/tarea_repository.dart';
import 'package:examen1oscar/features/tasks/domain/entities/tarea.dart';

class ObtenerTareas {
  final TareaRepository repository;

  ObtenerTareas(this.repository);

  Future<List<Tarea>> ejecutar() async {
    return await repository.obtenerTareas();
  }
}
