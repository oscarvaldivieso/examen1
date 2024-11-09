import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/news/presentation/news_screen.dart';
import 'features/tasks/presentation/tasks_screen.dart'; // Aseguramos la ruta correcta para tasks_screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter App',
      routerConfig: _router,
    );
  }

  // Configuración de las rutas con GoRouter
  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/news',
        builder: (context, state) => const NewsScreen(),
      ),
      GoRoute(
        path: '/tasks',
        builder: (context, state) => const TasksScreen(),  // Se usa TasksScreen para la lista de tareas
      ),
    ],
  );
}

// HomeScreen con el menú principal
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú Principal')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menú'),
            ),
            ListTile(
              title: const Text('Noticias'),
              onTap: () => context.go('/news'),  // Navega a Noticias
            ),
            ListTile(
              title: const Text('Lista de Tareas'),
              onTap: () => context.go('/tasks'),  // Navega a Lista de Tareas
            ),
          ],
        ),
      ),
      body: const Center(child: Text('Pantalla Principal')),
    );
  }
}
