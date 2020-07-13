import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../settings.dart';
import '../models/meal.dart';

class CategoryMenuScreen extends StatefulWidget {
  static const String routeName = '/categories-menu';
  final Settings settings;

  CategoryMenuScreen(this.settings);

  @override
  _CategoryMenuScreenState createState() => _CategoryMenuScreenState();
}

class _CategoryMenuScreenState extends State<CategoryMenuScreen> {
  List<Meal> filteredMeals;
  String catTitle;
  Color catColor;
  bool _initState = true;

  @override
  void didChangeDependencies() {
    if (_initState) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, Object>;
      final catId = routeArgs['id'];
      catTitle = routeArgs['title'];
      catColor = routeArgs['color'];
      filteredMeals = widget.settings.getCategoryMeals(catId);
          // widget.settings.getMeals().where((meal) => meal.categories.contains(catId)).toList();
      _initState = false;
    }
    super.didChangeDependencies();
  }

  // void mealDelete(String mealId) {
  //   print('object');
  //   setState(() {
  //     filteredMeals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
        backgroundColor: catColor,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            meal: filteredMeals[index],
            catColor: catColor,
            updateSuper: () {},
          );
        },
        itemCount: filteredMeals.length,
      ),
    );
  }
}
