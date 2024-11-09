import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:examen1oscar/features/tasks/domain/entities/tarea.dart';

class TareaRepository {
  // Método para obtener la lista de tareas desde un archivo JSON
  Future<List<Tarea>> obtenerTareas() async {
    final String response = await rootBundle.loadString('assets/tareas.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Tarea.fromJson(json)).toList();
  }
}
