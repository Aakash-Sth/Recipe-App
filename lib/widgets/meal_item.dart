import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipe_app/models/meals.dart';
import 'package:recipe_app/screens/meal_recipe_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function refreshHandler;

  const MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    this.refreshHandler,
  });

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealRecipeScreen.routeName, arguments: id);
    //   .then((value) {
    // if (value != null) {
    //   removeMeal(value);
    // }
    // });
  }

  String getAffordability() {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Pricey:
        return "Pricey";
      case Affordability.Luxurious:
        return "Luxurious";
      default:
        return "Unknown";
    }
  }

  String getComplexity() {
    switch (complexity) {
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Hard:
        return "Hard";
      case Complexity.Simple:
        return "Simple";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Stack(children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Image.network(
                imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 20,
              right: 0,
              child: Container(
                width: 250,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                    color: Colors.deepOrange.withOpacity(0.65),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12))),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(Icons.schedule),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "$duration mins",
                      style: const TextStyle(color: Colors.black),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.work),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      getComplexity(),
                      style: const TextStyle(color: Colors.black),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.attach_money),
                    Text(
                      getAffordability(),
                      style: const TextStyle(color: Colors.black),
                    )
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
