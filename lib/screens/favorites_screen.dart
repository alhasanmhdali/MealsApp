import 'package:flutter/material.dart';

import '../settings.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final Settings settings;

  FavoritesScreen(this.settings);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Meal> favorites = [];

  @override
  void initState() {
    favorites = widget.settings.getFavoriteMeals();
    super.initState();
  }

  void updateFavorites() {
    setState(() {
      favorites = widget.settings.getFavoriteMeals();
    print('Widget update');
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favorites.isEmpty
          ? Center(
              child: Text(
                'NO FAVORITE MEALS!',
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return MealItem(
                  meal: favorites[index],
                  catColor: Theme.of(context).primaryColor,
                  updateSuper: updateFavorites,
                );
              },
              itemCount: favorites.length,
            ),
    );
  }
}
