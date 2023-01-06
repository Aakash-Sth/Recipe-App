import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/dummy_data.dart';
import 'package:recipe_app/widgets/custom_image.dart';

class MealRecipeScreen extends StatelessWidget {
  static const routeName = '/meal-recipe';
  final Function toggleFavourite;
  final Function isFavourite;
  MealRecipeScreen(this.toggleFavourite, this.isFavourite);

  Widget _buildTitle(BuildContext context, String titleText) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
        height: 210,
        width: 270,
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        decoration: BoxDecoration(
            color: Color.fromRGBO(66, 66, 66, 1),
            borderRadius: BorderRadius.circular(10)),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    ;
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Text(
            selectedMeal.title,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CustomImage(
                  imageUrl: selectedMeal.imageUrl,
                  height: 300,
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: FloatingActionButton(
                    child: Icon(
                      isFavourite(mealId)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 28,
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.redAccent[400],
                    onPressed: () {
                      toggleFavourite(mealId);
                    },
                  ),
                ),
              ],
            ),
            _buildTitle(context, "Ingredients"),
            _buildContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Color.fromRGBO(66, 66, 66, 1),
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                      child: Text(
                        selectedMeal.ingredients[index],
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            _buildTitle(context, "Steps"),
            _buildContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Column(children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        child: Text("${index + 1}"),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(
                      color: Colors.white24,
                      thickness: 0.7,
                    )
                  ]);
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
