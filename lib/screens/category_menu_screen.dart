import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMenuScreen extends StatelessWidget {
  static const String routeName = '/categories-menu';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final catId = routeArgs['id'];
    final catTitle = routeArgs['title'];
    final catColor = routeArgs['color'];
    final filteredMeals =
        DUMMY_MEALS.where((meal) => meal.categories.contains(catId)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
        backgroundColor: catColor,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            filteredMeals[index],
            catColor,
          );
        },
        itemCount: filteredMeals.length,
      ),
    );
  }
}
