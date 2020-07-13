import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';

import '../widgets/category_item.dart';
import '../settings.dart';

class CategoriesScreen extends StatelessWidget {
  final Settings settings;

  CategoriesScreen(this.settings);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(15),
        children: DUMMY_CATEGORIES
            .map((cat) => CategoryItem(
                  cat.id,
                  cat.title,
                  cat.color,
                  settings.getCategoryCount(cat.id),
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
