import 'package:flutter/material.dart';
import 'package:recipe_app/models/meals.dart';
import 'package:recipe_app/widgets/meal_item.dart';

class FavouritesScreen extends StatefulWidget {
  List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  // void refreshHandler()
  // {
  //   setState(() {

  //   });
  // }
  @override
  Widget build(BuildContext context) {
    if (widget.favouriteMeals.isEmpty) {
      return Center(
        child: Text("You haven't added any meal as favourite yet."),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          Meal meal = widget.favouriteMeals[index];
          return MealItem(
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
            id: meal.id,
            // refreshHandler:refreshHandler
          );
        },
        itemCount: widget.favouriteMeals.length,
      );
    }
  }
}
