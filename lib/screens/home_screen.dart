import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/widgets/categories_listview.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:news_app/widgets/switch_builder.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Global News',
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
          await Future.delayed(
            const Duration(seconds: 3),
          );
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: CategoriesListView(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 50),
              ),
              Expanded(
                child: NewsTileListViewBuilder(
                  category: 'general',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
