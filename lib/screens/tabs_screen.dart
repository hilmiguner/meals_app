import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/models/meal.dart';

class TabsScreen extends StatefulWidget {
  static const String routeName = "/tabs";
  @override
  State<TabsScreen> createState() => _TabsScreenState();

  final List<Meal> _favoritedMeals;

  TabsScreen(this._favoritedMeals);
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {"page": CategoriesScreen(), "title": "DeliMeals"},
      {"page": FavoritesScreen(widget._favoritedMeals), "title": "Favorites"}
    ];
    super.initState();
  }

  int _selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(_pages[_selectedIndex]["title"]),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favorites",
            )
          ]),
    );
  }
}
