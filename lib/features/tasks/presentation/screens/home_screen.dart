import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';  // Asegúrate de tener importado go_router

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú Principal'),
        backgroundColor: Colors.teal,  // Un color más atractivo para la barra de app
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text(
                'Bienvenido',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text('Noticias', style: TextStyle(fontSize: 18)),
              onTap: () => context.go('/news'),  // Navega a Noticias
            ),
            ListTile(
              title: const Text('Lista de Tareas', style: TextStyle(fontSize: 18)),
              onTap: () => context.go('/tasks'),  // Navega a Lista de Tareas
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Pantalla Principal',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/tasks'),  // Navega a la pantalla de tareas
        child: const Icon(Icons.add),
        backgroundColor: Colors.teal,  // El color del botón flotante
      ),
    );
  }
}
