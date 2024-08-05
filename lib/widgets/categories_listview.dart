import 'package:flutter/material.dart';
import 'package:news_app/data/category_data.dart';
import 'package:news_app/widgets/category_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return CategoryItem(
            category: categories[index],
          );
        },
      ),
    );
  }
}
