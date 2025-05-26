import 'dart:convert';

import 'package:dev_blog/model/post.dart';
import 'dart:async';

import 'package:flutter/services.dart';

class PostService {


  Future<List<Post>> fetchPosts() async {
    final String jsonString = await rootBundle.loadString('dummy_posts/posts.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => Post.fromMap(json)).toList();
  }
}