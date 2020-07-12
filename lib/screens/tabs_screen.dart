import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  /*DefaultTabController _defaultTabControllerOption = DefaultTabController(
    length: 2,
    child: Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.category),
              // text: 'Categories',
              // child: Text('Categories'),
            ),
            Tab(
              icon: Icon(Icons.star),
              // text: 'Favorites',
              // child: Text('Favorites'),
            ),
          ],
        ),
        title: Text('Categories'),
      ),
      body: TabBarView(
        children: [
          CategoriesScreen(),
          FavoritesScreen(),
        ],
      ),
    ),
  );*/

  int _selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, Object>> _screens = [
    {
      'title': 'Categories',
      'body': CategoriesScreen(),
    },
    {
      'title': 'Favorites',
      'body': FavoritesScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedIndex]['title']),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //........Theming.............
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        //........Content........
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            activeIcon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
        onTap: _onItemTap,
      ),
      body: _screens[_selectedIndex]['body'],
      drawer: MainDrawer(),
    );
  }
}
