import 'package:flutter/material.dart';
import 'package:mealsapp/screens/meal_screen.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Color catColor;
  final Function updateSuper;

  String mealComplexity() {
    switch (this.meal.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      default:
        return 'Unkown';
        break;
    }
  }

  String mealAffordability() {
    switch (this.meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unkown';
        break;
    }
  }

  MealItem({this.meal, this.catColor, this.updateSuper});

  void openMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealScreen.routeName,
      arguments: {
        'meal': meal,
        'catColor': catColor,
        'complexity': mealComplexity(),
        'affordability': mealAffordability(),
      },
    ).then((result) {
      updateSuper();
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 330),
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 10),
                      Text(meal.duration == 1
                          ? '${meal.duration} min'
                          : '${meal.duration} mins'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 10),
                      Text(mealComplexity()),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 10),
                      Text(mealAffordability()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
