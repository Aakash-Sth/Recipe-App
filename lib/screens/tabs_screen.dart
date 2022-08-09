import 'package:flutter/material.dart';
import '../models/meals.dart';
import 'package:recipe_app/widgets/drawer_details.dart';
import './categories_screen.dart';
import './favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  const TabsScreen(this.favouriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex;
  List<Map<String, dynamic>> _screens;
  @override
  initState() {
    _selectedIndex = 0;
    _screens = [
      {'title': 'Categories', 'screen': CategoriesScreen()},
      {'title': 'Favourites', 'screen': FavouritesScreen(widget.favouriteMeals)}
    ];
    super.initState();
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedIndex]['title'],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.5),
        ),
      ),
      drawer: DrawerDetails(),
      body: _screens[_selectedIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            label: 'Categories',
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: 'Favourites',
            icon: Icon(Icons.favorite),
          )
        ],
      ),
    );
  }
}
