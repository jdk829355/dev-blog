import 'package:flutter/material.dart';
import 'package:dev_blog/widgets/title_bar.dart';

// parameters 인자 추가
class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.parameters});

  final Map<String, String> parameters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleBar(
          title: parameters['title'] ?? 'Dev Blog',
          profileImage: parameters['profileImage'] ?? 'images/lake.jpg',
        ),
      ],
    );
  }
}