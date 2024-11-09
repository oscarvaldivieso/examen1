import 'dart:async';
import 'package:examen1oscar/features/news/domain/news.dart';

class NewsService {
  Future<List<News>> fetchNews() async {
    // Simulamos la carga de noticias
    return [
      News(
        title: 'Noticia 1',
        description: 'Descripción de la noticia 1',
        imageUrl: 'https://example.com/news1.jpg',
      ),
      News(
        title: 'Noticia 2',
        description: 'Descripción de la noticia 2',
        imageUrl: 'assets/images/news2.jpg',
      ),
    ];
  }
}
