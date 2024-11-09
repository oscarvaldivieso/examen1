import 'package:flutter/material.dart';
import 'package:examen1oscar/features/tasks/domain/entities/tarea.dart';

class ListaTareas extends StatelessWidget {
  final List<Tarea> tareas;

  ListaTareas({required this.tareas});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tareas.length,
      itemBuilder: (context, index) {
        final tarea = tareas[index];
        return Card(
          margin: EdgeInsets.all(8),
          child: ListTile(
            title: Text(tarea.titulo),
            subtitle: Text(tarea.descripcion),
            trailing: Text(tarea.fecha),
          ),
        );
      },
    );
  }
}
