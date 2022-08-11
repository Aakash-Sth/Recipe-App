import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meal_item.dart';

class MealsScreen extends StatefulWidget {
  static String routeName = '/meals';
  final List filteredMeals;

  const MealsScreen(this.filteredMeals);
  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = args['id'];
    var categoryName = args['title'];
    List<Meal> categoryMeals = widget.filteredMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryName),
        ),
        body: categoryMeals.length < 1
            ? Center(
                child: Text("No meals having current filters are available."),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  Meal meal = categoryMeals[index];
                  return MealItem(
                    title: meal.title,
                    imageUrl: meal.imageUrl,
                    duration: meal.duration,
                    complexity: meal.complexity,
                    affordability: meal.affordability,
                    id: meal.id,
                  );
                },
                itemCount: categoryMeals.length,
              ));
  }
}
