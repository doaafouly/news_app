// models/artical_models.dart
class ArticalModels {
  final String image;
  final String title;
  final String subtitle;

  ArticalModels({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  factory ArticalModels.fromJson(Map<String, dynamic> json) {
    return ArticalModels(
      image: json['urlToImage'] ?? '',
      title: json['title'] ?? 'No Title',
      subtitle: json['description'] ?? 'No Description',
    );
  }
}
