import 'package:intl/intl.dart';

class ArticleModel {
  final String? author;
  final String title;
  final String? description;
  final String? image;
  final String? content;
  final String? publishedAt;

  const ArticleModel({
    this.author,
    this.content,
    this.publishedAt,
    required this.title,
    this.description,
    this.image,
  });

  String formatDate() {
    if (publishedAt == null) {
      return '';
    } else {
      String date = publishedAt!;
      DateTime dateTime = DateTime.parse(date);
      String formattedDate = DateFormat('dd-MM-yyyy HH:mm').format(dateTime);
      return formattedDate;
    }
  }

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      author: json['author'],
      title: json['title'],
      description: json['description'],
      image: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
