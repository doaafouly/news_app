// views/newsViews.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_app/models/artical_models.dart';
import 'package:new_app/service/news_service.dart';

class NewsViews extends StatefulWidget {
  const NewsViews({super.key});

  @override
  State<NewsViews> createState() => _NewsViewsState();
}

class _NewsViewsState extends State<NewsViews> {
  List<ArticalModels> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getGeneralNews();
  }

  Future<void> getGeneralNews() async {
    try {
      setState(() {
        isLoading = true;
      });
      articles = await NewsService(Dio()).getNews();
    } catch (e) {
      print("Error fetching news: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: getGeneralNews,
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, i) {
                final item = articles[i];
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(item.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 200,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.bottomLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          colors: [Colors.black54, Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Text(
                        item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
