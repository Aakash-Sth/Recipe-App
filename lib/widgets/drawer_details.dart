import 'package:flutter/material.dart';
import 'package:recipe_app/screens/fiters_screen.dart';

class DrawerDetails extends StatelessWidget {
  Widget _buildListTile(IconData icon, String title, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(40),
              child: Text(
                "DailyMeals",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            _buildListTile(Icons.restaurant, "Meal Categories",
                () => Navigator.of(context).pushReplacementNamed('/')),
            _buildListTile(
                Icons.settings,
                "Filters",
                () => Navigator.of(context)
                    .pushReplacementNamed(FiltersScreen.routeName))
          ],
        ),
      ),
    );
  }
}
