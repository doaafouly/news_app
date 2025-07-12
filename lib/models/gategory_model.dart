import 'package:flutter/material.dart';

// نموذج بيانات Gategrymod
class Gategrymod {
  final String image;
  final String name;

  Gategrymod({required this.image, required this.name});
}

// قائمة الفئات
final List<Gategrymod> categories = [
  Gategrymod(image: 'assets/1-1731211.webp', name: 'News'),
  Gategrymod(image: 'assets/OIP.webp', name: 'Coffee'),
  Gategrymod(image: 'assets/entertaiment.avif', name: 'Entertainment'),
  Gategrymod(
      image: 'assets/67dab5ef07003692e3cce0b6168ff8b3.jpg', name: 'General'),
  Gategrymod(
      image:
          'assets/healthy-food-vector-poster-organic-vegetables-fresh-veggies-natural-salads-spice-herbs-vegetables-healthy-food-poster-organic-103749093.webp',
      name: 'Health'),
  Gategrymod(image: 'assets/science.avif', name: 'Science'),
  Gategrymod(image: 'assets/R.png', name: 'Sports'),
  Gategrymod(image: 'assets/technology.jpeg', name: 'Technology')
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CategoriesPage(), // صفحة الفئات
    );
  }
}

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(category.image,
                    height: 80, fit: BoxFit.cover), // صورة الفئة
                const SizedBox(height: 10),
                Text(category.name, style: const TextStyle(fontSize: 16)),
              ],
            ),
          );
        },
      ),
    );
  }
}
