import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import '../settings.dart';

class FiltersScreen extends StatefulWidget {
  static const String routName = './filters_screen';
  final Settings settings;

  FiltersScreen(this.settings);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  void updateValues() {
    _glutenFree = widget.settings.getSettings()['gluten'];
    _vegetarian = widget.settings.getSettings()['vegetarian'];
    _vegan = widget.settings.getSettings()['vegan'];
    _lactoseFree = widget.settings.getSettings()['lactose'];
  }

  @override
  initState() {
    updateValues();
    super.initState();
  }

  Widget _buildSwitchListTile(
      {String title, String subtitle, bool value, Function updateFunc}) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: updateFunc,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection:',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  title: 'Gluten-free',
                  subtitle: 'Only include gluten-free meals.',
                  value: _glutenFree,
                  updateFunc: (newValue) {
                    setState(() {
                      widget.settings.updateSettings(
                        gluten: newValue,
                      );
                      updateValues();
                    });
                  },
                ),
                _buildSwitchListTile(
                  title: 'Lactose-free',
                  subtitle: 'Only include lactose-free meals.',
                  value: _lactoseFree,
                  updateFunc: (newValue) {
                    setState(() {
                      widget.settings.updateSettings(
                        lactos: newValue,
                      );
                      updateValues();
                    });
                  },
                ),
                _buildSwitchListTile(
                  title: 'Vegetarian',
                  subtitle: 'Only include vegetarian meals.',
                  value: _vegetarian,
                  updateFunc: (newValue) {
                    setState(() {
                      widget.settings.updateSettings(
                        vegetarian: newValue,
                      );
                      updateValues();
                    });
                  },
                ),
                _buildSwitchListTile(
                  title: 'Vegan',
                  subtitle: 'Only include vegan meals.',
                  value: _vegan,
                  updateFunc: (newValue) {
                    setState(() {
                      widget.settings.updateSettings(
                        vegan: newValue,
                      );
                      updateValues();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          Navigator.of(context).popAndPushNamed('/');
        },
      ),
    );
  }
}
