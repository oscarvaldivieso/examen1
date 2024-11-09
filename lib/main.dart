import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/news/presentation/news_screen.dart';
import 'features/tasks/presentation/screens/home_screen.dart'; // Corregido el path para home_screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        builder: (context, state) => const HomeScreen(),  // Se mantiene HomeScreen para tareas, ajusta si es necesario.
      ),
    ],
  );
}

// HomeScreen con el menú principal
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú Principal')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text('Menú'),
              decoration: BoxDecoration(color: Colors.blue),
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
