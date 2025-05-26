import 'package:dev_blog/viewmodel/post_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:dev_blog/view/main_page.dart';
import 'package:provider/provider.dart';
void main() {
  final Map<String, String> parameters = <String, String>{
      'title': 'DevBlog',
      'profileImage': 'images/lake.jpg',
      'githubUrl': 'https://www.github.com/jdk829355',
  };
  runApp(ChangeNotifierProvider(create: (context) => PostViewmodel(), child: MyApp(parameters: parameters)));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.parameters});

  final Map<String, String> parameters;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // set main color to white
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      title: parameters['title'] ?? 'Dev Blog',
      home: Scaffold(body: MainPage(parameters: parameters)),
    );
  }
}