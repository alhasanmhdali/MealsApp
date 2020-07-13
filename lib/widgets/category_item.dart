import 'package:flutter/material.dart';

import '../screens/category_menu_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final int count;

  CategoryItem(this.id, this.title, this.color, this.count);

  void openCategoryMenuScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMenuScreen.routeName, arguments: {
      'id': id,
      'title': title,
      'color': color,
      'count': count
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        openCategoryMenuScreen(context);
      },
      splashColor: color,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                count == 1 ? '$count recipe' : '$count recipes',
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
