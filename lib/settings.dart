import './dummy_data.dart';
import './models/meal.dart';

class Settings {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosFree = false;

  var _filteredMeals = DUMMY_MEALS;
  List<String> _favorites = [];

  // Settings({this.glutenFree = false, this.vegetarian = false, this.vegan = false, this.lactosFree = false});
  void updateSettings({gluten, vegetarian, vegan, lactos}) {
    this._glutenFree = gluten ?? this._glutenFree;
    this._vegetarian = vegetarian ?? this._vegetarian;
    this._vegan = vegan ?? this._vegan;
    this._lactosFree = lactos ?? this._lactosFree;

    _filteredMeals = getMeals();
  }

  Map<String, bool> getSettings() {
    return {
      'gluten': _glutenFree,
      'vegetarian': _vegetarian,
      'vegan': _vegan,
      'lactose': _lactosFree,
    };
  }

  List<Meal> getMeals() {
    _filteredMeals = DUMMY_MEALS.where((Meal meal) {
      if ((this._glutenFree && !meal.isGlutenFree) ||
          (this._vegetarian && !meal.isVegetarian) ||
          (this._vegan && !meal.isVegan) ||
          (this._lactosFree && !meal.isLactoseFree))
        return false;
      else
        return true;
    }).toList();
    return _filteredMeals;
  }

  List<Meal> getCategoryMeals(String catId) {
    return _filteredMeals
        .where((element) => element.categories.contains(catId))
        .toList();
  }

  int getCategoryCount(String catId) {
    return _filteredMeals
        .where((element) => element.categories.contains(catId))
        .length;
  }

  bool isFavorite(String mealId) {
    return _favorites.contains(mealId);
  }

  void clickFavorite(String mealId) {
    if (!isFavorite(mealId)) _favorites.add(mealId);
    else _favorites.remove(mealId);
  }

  List<Meal> getFavoriteMeals() {
    return _filteredMeals.isEmpty ? [] : _filteredMeals
        .where((element) => isFavorite(element.id))
        .toList();
  }
}
