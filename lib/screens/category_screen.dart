import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:news_app/service/news_service.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';
import 'package:news_app/widgets/switch_builder.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({
    super.key,
    required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category,
        ),
        centerTitle: true,
        actions: const [
          SwitchBuilder(),
        ],
      ),
      body: RefreshIndicator(
        color: isDarkMode ? Colors.black : Colors.white,
        backgroundColor: isDarkMode ? Colors.white : Colors.black,
        onRefresh: () async {
          NewsService(Dio()).getTopHeadlines(category: category);
          await Future.delayed(
            const Duration(seconds: 3),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomScrollView(
            slivers: [
              NewsTileListViewBuilder(
                category: category,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
