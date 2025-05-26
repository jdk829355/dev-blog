import 'dart:convert';

class Post {
  final String title;
  final String description;
  final String content;
  final String author;
  final DateTime date;
  final String imageUrl;

  Post({
    required this.title,
    required this.description,
    required this.content,
    required this.author,
    required this.date,
    required this.imageUrl,
  });

  // Factory method to create a Post from a map
  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      title: map['title'] ?? 'Untitled',
      description: map['description'] ?? '',
      content: map['content'] ?? '',
      author: map['author'] ?? 'Unknown',
      date: DateTime.parse(map['date'] ?? DateTime.now().toString()),
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  // Method to convert a Post to a JSON string
  String toJson() {
    return jsonEncode(toMap());
  }

  // Factory method to create a Post from a JSON string
  factory Post.fromJson(String json) {
    final Map<String, dynamic> map = jsonDecode(json);
    return Post.fromMap(map);
  }

  // Method to convert a Post to a map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'content': content,
      'author': author,
      'date': date.toIso8601String(),
      'imageUrl': imageUrl,
    };
  }
}