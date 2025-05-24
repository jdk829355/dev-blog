import 'package:flutter/material.dart';
import 'package:dev_blog/view/main_page.dart';
void main() {
  final Map<String, String> parameters = <String, String>{
      'title': 'DevBlog',
      'profileImage': 'images/lake.jpg',
      'githubUrl': 'https://www.github.com/jdk829355',
  };
  runApp(MyApp(parameters: parameters));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.parameters});

  final Map<String, String> parameters;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: parameters['title'] ?? 'Dev Blog',
      home: Scaffold(body: MainPage(parameters: parameters)),
    );
  }
}