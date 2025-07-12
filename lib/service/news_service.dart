// service/news_service.dart
import 'package:dio/dio.dart';
import 'package:new_app/models/artical_models.dart';

class NewsService {
  final Dio _dio;

  NewsService(this._dio);

  Future<List<ArticalModels>> getNews() async {
    final response =
        await _dio.get('YOUR_API_URL_HERE'); // استبدل بـ API URL المناسب.

    if (response.statusCode == 200) {
      List<ArticalModels> news = (response.data['articles'] as List)
          .map((article) => ArticalModels.fromJson(article))
          .toList();
      return news;
    } else {
      throw Exception('Failed to load news');
    }
  }
}
