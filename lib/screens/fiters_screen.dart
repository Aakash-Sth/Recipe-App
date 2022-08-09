import 'package:flutter/material.dart';
import '../widgets/drawer_details.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;

  @override
  initState() {
    _isGlutenFree = widget.currentFilters['gluten'];
    _isVegan = widget.currentFilters['vegan'];
    _isVegetarian = widget.currentFilters['vegetarian'];
    _isLactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String subTitle, bool value, Function change) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: value,
      onChanged: change,
      inactiveThumbColor: Theme.of(context).primaryColor,
      inactiveTrackColor: Color.fromRGBO(66, 66, 66, 1),
      activeColor: Colors.white10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
              onPressed: () {
                Map<String, bool> newFilters = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian,
                };
                widget.saveFilters(newFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: DrawerDetails(),
      body: Column(
        children: [
          // Container(
          //   padding: EdgeInsets.all(20),
          //   child: Text(
          //     "Filter your meals",
          //     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          //   ),
          // ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile("Gluten-free",
                  "Only include gluten-free meals", _isGlutenFree, (newValue) {
                setState(() {
                  _isGlutenFree = newValue;
                });
              }),
              _buildSwitchListTile(
                  "Vegan", "Only include vegan meals", _isVegan, (newValue) {
                setState(() {
                  _isVegan = newValue;
                });
              }),
              _buildSwitchListTile(
                  "Vegetarian", "Only include vegeterian meals", _isVegetarian,
                  (newValue) {
                setState(() {
                  _isVegetarian = newValue;
                });
              }),
              _buildSwitchListTile(
                  "Lactose-free",
                  "Only include lactose-free meals",
                  _isLactoseFree, (newValue) {
                setState(() {
                  _isLactoseFree = newValue;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
