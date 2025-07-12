// main.dart
import 'package:flutter/material.dart';
import 'package:new_app/service/news_service.dart';
import 'package:new_app/views/home_views.dart';
import 'package:new_app/models/gategory_model.dart';
import 'package:new_app/models/artical_models.dart';
import 'package:dio/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  NewsService newsService = NewsService(Dio());
  List<ArticalModels> news =
      await newsService.getNews(); // استخدم getNews هنا لتحميل البيانات

  runApp(MyApp(news: news));
}

class MyApp extends StatelessWidget {
  final List<ArticalModels> news;

  const MyApp({super.key, required this.news}); // تمرير الأخبار كمعامل

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeViews(categres: categories, news: news), // تمرير الأخبار هنا
    );
  }
}
