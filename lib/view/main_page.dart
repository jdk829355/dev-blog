import 'package:flutter/material.dart';
import 'package:dev_blog/widgets/title_bar.dart';

import '../widgets/post_preview.dart';

// parameters 인자 추가
class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.parameters});

  final Map<String, String> parameters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleBar(
          parameters: parameters,
        ),
        // box의 너비는 최대 1000, 양옆의 패딩은 최소 각각 160
        Expanded(
          child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.symmetric(horizontal: 160, vertical: 20),
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PostListTitle(),
                PostPreview(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PostListTitle extends StatelessWidget {
  const PostListTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          runAlignment: WrapAlignment.start,
          runSpacing: 12,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 288),
              child: Container(
                width: 288,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 288,
                      child: Text(
                        'Latest Posts',
                        style: TextStyle(
                          color: Color(0xFF111416),
                          fontSize: 32,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 1.25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
