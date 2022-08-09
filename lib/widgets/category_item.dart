import 'package:flutter/material.dart';
import 'package:recipe_app/dummy_data.dart';
import '../models/meals.dart';
import '../screens/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ct) {
    Navigator.of(ct).pushNamed(MealsScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    String _imageUrl = DUMMY_MEALS.firstWhere((meal) {
      return meal.categories.contains(id);
    }).imageUrl;
    return InkWell(
        onTap: () => selectCategory(context),
        splashColor: Colors.grey,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          decoration: BoxDecoration(
              color: Color.fromRGBO(50, 59, 69, 1),
              gradient: LinearGradient(
                  colors: [color.withOpacity(0.8), color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(15)),
        ));
  }
}
