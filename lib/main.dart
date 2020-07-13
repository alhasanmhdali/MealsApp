import 'package:flutter/material.dart';

import './screens/meal_screen.dart';
import './screens/category_menu_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';
import './settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Settings settings = Settings();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MealsMaker',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          headline6: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      routes: {
        '/': (ctx) => TabsScreen(settings),
        CategoryMenuScreen.routeName: (ctx) => CategoryMenuScreen(settings),
        MealScreen.routeName: (ctx) => MealScreen(settings),
        FiltersScreen.routName: (ctx) => FiltersScreen(settings),
      },
    );
  }
}
