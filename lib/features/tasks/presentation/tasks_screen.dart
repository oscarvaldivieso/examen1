import 'package:flutter/material.dart';
import 'package:examen1oscar/features/tasks/domain/entities/tarea.dart';
import 'package:examen1oscar/features/tasks/data/repositories/tarea_repository.dart'; // Suponiendo que ya tienes el repositorio

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  late Future<List<Tarea>> _tareas;

  @override
  void initState() {
    super.initState();
    _tareas = TareaRepository().obtenerTareas(); // Obtenemos las tareas
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Lógica para agregar una nueva tarea (por ejemplo, abrir un formulario)
              _showAddTaskDialog();
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Tarea>>(
        future: _tareas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error cargando las tareas'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay tareas disponibles'));
          }

          final tareas = snapshot.data!;
          return ListView.builder(
            itemCount: tareas.length,
            itemBuilder: (context, index) {
              final tarea = tareas[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(tarea.titulo),
                  subtitle: Text(tarea.descripcion),
                  trailing: IconButton(
                    icon: const Icon(Icons.check_circle),
                    onPressed: () {
                      // Lógica para marcar la tarea como completada
                    },
                  ),
                  onTap: () {
                    // Lógica para ver detalles de la tarea (si aplica)
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Método para mostrar un cuadro de diálogo para agregar una tarea
  void _showAddTaskDialog() {
    final _formKey = GlobalKey<FormState>();
    String nombre = '';
    String descripcion = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Agregar Tarea'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un nombre';
                    }
                    return null;
                  },
                  onSaved: (value) => nombre = value!,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Descripción'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa una descripción';
                    }
                    return null;
                  },
                  onSaved: (value) => descripcion = value!,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _formKey.currentState?.save();
                  // Lógica para agregar la nueva tarea (puedes agregarla a la lista o hacer una API call)
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }
}
