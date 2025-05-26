import 'package:flutter/material.dart';
import 'package:dev_blog/model/post.dart';

class PostPreview extends StatelessWidget {
  final Post post;
  const PostPreview({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 203,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 텍스트 영역
          Expanded(
            flex: 14,
            child: _buildPostContent(),
          ),
          Expanded(flex: 1, child: Container()),
          // 이미지 영역
          Expanded(
            flex: 7,
            child: _buildPostImage(),
          ),
        ],
      ),
    );
  }

  Widget _buildPostImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 171, // 원하는 고정 높이
        child: Image.network(
          post.imageUrl,
          fit: BoxFit.cover,
          height: 171, // 고정 높이
        ),
      ),
    );
  }

  Widget _buildPostContent() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          post.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle(
            color: Color(0xFF111416),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            height: 1.25,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          post.description,
          style: const TextStyle(
            color: Color(0xFF607589),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 1.50,
          ),
          maxLines: 3,
        ),
        const Spacer(),
        Text(
          '${post.date.year}-${post.date.month.toString().padLeft(2, '0')}-${post.date.day.toString().padLeft(2, '0')}',
          style: const TextStyle(
            color: Color(0xFF607589),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 1.50,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8),
      ],
    );
  }
}