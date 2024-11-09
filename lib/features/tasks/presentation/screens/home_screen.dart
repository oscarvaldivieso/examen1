import 'package:flutter/material.dart';
import 'package:examen1oscar/features/tasks/data/repositories/tarea_repository.dart';
import 'package:examen1oscar/features/tasks/domain/usecases/obtener_tareas.dart';
import 'package:examen1oscar/features/tasks/presentation/widgets/lista_tareas.dart';
import 'package:examen1oscar/features/tasks/domain/entities/tarea.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Tarea>> tareas;

  @override
  void initState() {
    super.initState();
    final repository = TareaRepository();
    final obtenerTareas = ObtenerTareas(repository);
    tareas = obtenerTareas.ejecutar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Tareas')),
      body: FutureBuilder<List<Tarea>>(
        future: tareas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay tareas disponibles.'));
          } else {
            return ListaTareas(tareas: snapshot.data!);
          }
        },
      ),
    );
  }
}
