import 'package:flutter/material.dart';
import 'package:examen1oscar/features/news/domain/news.dart';
import 'package:examen1oscar/features/news/data/news_service.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<List<News>> _news;

  @override
  void initState() {
    super.initState();
    _news = NewsService().fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Noticias')),
      body: FutureBuilder<List<News>>(
        future: _news,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error cargando las noticias'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay noticias disponibles'));
          }

          final newsList = snapshot.data!;
          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              final news = newsList[index];
              return Card(
                child: ListTile(
                  leading: Image.network(news.imageUrl, width: 50, height: 50),
                  title: Text(news.title),
                  subtitle: Text(news.description),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
