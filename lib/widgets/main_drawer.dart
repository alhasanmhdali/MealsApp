import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile({String title, IconData icon, Function selectHandler}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      onTap: selectHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 120,
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(
            icon: Icons.restaurant_menu,
            title: 'Meals',
            selectHandler: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            icon: Icons.settings,
            title: 'Filters',
            selectHandler: () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routName);
            },
          ),
        ],
      ),
    );
  }
}
