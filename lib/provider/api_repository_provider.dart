import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/service/news_service.dart';

class NewsNotifier extends StateNotifier<List<ArticleModel>> {
  final NewsService newsService;
  bool _hasMore = true;
  bool _isLoading = false;

  NewsNotifier(
    this.newsService,
  ) : super([]);

  bool get hasMore => _hasMore;
  bool get isLoading => _isLoading;

  Future<void> refreshNews() async {
    _hasMore = true;
    state = [];
  }
}

final repositoryProvider =
    StateNotifierProvider<NewsNotifier, List<ArticleModel>>((ref) {
  final newsService = NewsService(Dio());

  return NewsNotifier(newsService);
});
