// ignore_for_file: unused_import

import 'dart:developer';

import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meals.dart';
import './screens/fiters_screen.dart';
import './screens/meal_recipe_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meals_screen.dart';
import 'models/category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _filteredMeals = DUMMY_MEALS;
  List<Meal> _favouritemeals = [];

  void _toggleFavourite(String mealId) {
    int index = _favouritemeals.indexWhere((meal) => meal.id == mealId);
    setState(() {
      if (index >= 0) {
        _favouritemeals.removeAt(index);
      } else {
        _favouritemeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      }
    });
  }

  bool _isFavourite(String mealId) {
    if (_favouritemeals.any((meal) => meal.id == mealId)) {
      return true;
    }
    return false;
  }

  void _saveFilters(Map<String, bool> newFilters) {
    setState(() {
      _filters = newFilters;
      _filteredMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Meals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color.fromRGBO(97, 97, 97, 1),
          canvasColor: Color.fromRGBO(33, 33, 33, 1),
          fontFamily: 'Raleway',
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
          ),
          textTheme: ThemeData.dark().textTheme.copyWith(
                bodyText1: const TextStyle(color: Colors.white),
                bodyText2: const TextStyle(color: Colors.white),
                headline6: TextStyle(
                    fontSize: 22,
                    fontFamily: 'RobotoCondensed',
                    color: Colors.white.withOpacity(0.9)),
              )),
      routes: {
        '/': (context) => TabsScreen(_favouritemeals),
        MealsScreen.routeName: (context) => MealsScreen(_filteredMeals),
        MealRecipeScreen.routeName: (context) =>
            MealRecipeScreen(_toggleFavourite, _isFavourite),
        FiltersScreen.routeName: ((context) =>
            FiltersScreen(_saveFilters, _filters))
      },
    );
  }
}
