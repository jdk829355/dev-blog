import 'package:dev_blog/model/post.dart';
import 'package:dev_blog/service/post_service.dart';
import 'package:flutter/material.dart';

class PostViewmodel extends ChangeNotifier {
  // Service to fetch posts
  final PostService _postService = PostService();
  // List of posts
  List<Post> _posts = [];

  // Fetch posts from the service
  Future<void> fetchPosts() async {
    _posts = await _postService.fetchPosts();
    notifyListeners();
  }

  // Get all posts
  List<Post> get posts => _posts;
}