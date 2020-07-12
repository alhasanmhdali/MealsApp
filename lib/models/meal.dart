import 'package:flutter/foundation.dart';

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

enum Complexity {
  Simple,
  Hard,
  Challenging,
}

class Meal {
  final String id;
  final String title;
  final List<String> categories;
  final int duration;
  final String imageUrl;
  final Affordability affordability;
  final Complexity complexity;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const Meal({
    @required this.id,
    @required this.title,
    @required this.categories,
    @required this.duration,
    @required this.imageUrl,
    @required this.affordability,
    @required this.complexity,
    @required this.ingredients,
    @required this.steps,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });
}
