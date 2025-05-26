import 'package:dev_blog/viewmodel/post_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:dev_blog/widgets/title_bar.dart';
import 'package:provider/provider.dart';

import '../widgets/post_preview.dart';

// parameters 인자 추가
class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.parameters});

  final Map<String, String> parameters;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    final PostViewmodel _postViewmodel = Provider.of<PostViewmodel>(context);
    _postViewmodel.fetchPosts(); // 페이지가 로드될 때마다 posts를 새로 불러옴

    return Column(
      children: [
        TitleBar(
          parameters: widget.parameters,
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
                // PostViewmodel의 posts를 사용하여 ListView.builder로 PostPreview 위젯을 생성
                PostList(postViewmodel: _postViewmodel),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PostList extends StatelessWidget {
  const PostList({
    super.key,
    required PostViewmodel postViewmodel,
  }) : _postViewmodel = postViewmodel;

  final PostViewmodel _postViewmodel;

  @override
  Widget build(BuildContext context) {
    if (_postViewmodel.posts.isEmpty) {
      return const Center(
        child: Text(
          'No posts available',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: _postViewmodel.posts.length,
        itemBuilder: (context, index) {
          return PostPreview(post: _postViewmodel.posts[index]);
        },
      ),
    );
  }
}

class PostListTitle extends StatelessWidget {
  const PostListTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              child: SizedBox(
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
