import 'package:flutter/material.dart';

import '../models/meal.dart';

enum DataShow { ingredients, instructions }

class MealScreen extends StatefulWidget {
  static const routeName = '/meal-screen';

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  var _show = DataShow.ingredients;

  @override
  Widget build(BuildContext context) {
    final mealArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final Meal meal = mealArgs['meal'];
    final Color catColor = mealArgs['catColor'];
    final String complexity = mealArgs['complexity'];
    final String affordability = mealArgs['affordability'];

    final AppBar _appBar = AppBar(
      title: Text(meal.title),
      backgroundColor: catColor,
    );

    final _mediaQuery = MediaQuery.of(context);
    final _screenSize = _mediaQuery.size.height -
        _mediaQuery.padding.top -
        _mediaQuery.padding.bottom -
        _appBar.preferredSize.height;

    Widget _selectedItem(String title, bool selected) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: _mediaQuery.size.width * 0.3,
          alignment: Alignment.center,
          decoration: selected
              ? BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.black,
                      style: BorderStyle.solid,
                    ),
                  ),
                )
              : null,
          child: Text(
            title,
            style: selected
                ? TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )
                : TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black38,
                  ),
          ),
        ),
      );
    }

    Widget _itemLists(List<String> items) {
      return Scrollbar(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (ctx, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_right,
                      size: 22,
                    ),
                    Container(
                      width: _mediaQuery.size.width * 0.8,
                      padding: EdgeInsets.only(top: 3),
                      child: Text(
                        items[index],
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.black12,
                )
              ],
            );
          },
        ),
      );
    }

    final _swapableData = GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 2) {
          setState(() {
            _show = DataShow.ingredients;
          });
        } else if (details.delta.dx < -2) {
          setState(() {
            _show = DataShow.instructions;
          });
        }
      },
      child: Container(
        width: double.infinity,
        height: _screenSize * 0.45,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(color: Colors.white38),
        child: _itemLists(
          _show == DataShow.instructions ? meal.steps : meal.ingredients,
        ),
      ),
    );

    final _pageView = PageView(
      onPageChanged: (index) {
        setState(() {
          if (index == 0)
            _show = DataShow.ingredients;
          else if (index == 1) _show = DataShow.instructions;
        });
      },
      children: <Widget>[
        _itemLists(meal.ingredients),
        _itemLists(meal.steps),
      ],
    );

    return Scaffold(
      appBar: _appBar,
      body: Container(
        child: Column(
          children: [
            Container(
              // decoration: BoxDecoration(boxShadow: [
              //   BoxShadow(
              //     offset: Offset(0, 1),
              //     color: Color.fromRGBO(0, 0, 0, 0.5),
              //     blurRadius: 3,
              //   ),
              // ]),
              child: Image.network(
                meal.imageUrl,
                height: _screenSize * 0.35,
                width: _mediaQuery.size.width,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.5,
                    color: Colors.black,
                  ),
                ),
              ),
              height: _screenSize * 0.13,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    meal.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
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
                          Text(complexity),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.attach_money),
                          SizedBox(width: 10),
                          Text(affordability),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  height: _screenSize * 0.07,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            _show = DataShow.ingredients;
                          });
                        },
                        child: _selectedItem(
                            'Ingredients', _show == DataShow.ingredients),
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            _show = DataShow.instructions;
                          });
                        },
                        child: _selectedItem(
                            'Steps', _show == DataShow.instructions),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: _screenSize * 0.45,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(color: Colors.white38),
                  child: _pageView,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
