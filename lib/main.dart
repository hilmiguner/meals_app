import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'package:meals_app/models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "vegetarian": false,
    "vegan": false,
    "lactose": false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritedMeals = [];

  void _setFilters(Map<String, bool> filterData, BuildContext ctx) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (!meal.isGlutenFree && _filters["gluten"]) {
          return false;
        }
        if (!meal.isVegetarian && _filters["vegetarian"]) {
          return false;
        }
        if (!meal.isVegan && _filters["vegan"]) {
          return false;
        }
        if (!meal.isLactoseFree && _filters["lactose"]) {
          return false;
        }
        return true;
      }).toList();

      Navigator.of(ctx).pushReplacementNamed(TabsScreen.routeName);
    });
  }

  void _toggleFavorite(String mealId) {
    final int existingIndex =
        _favoritedMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex == -1) {
      setState(() {
        _favoritedMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    } else {
      setState(() {
        _favoritedMeals.removeAt(existingIndex);
      });
    }
  }

  bool _isMealFavorited(String id) {
    return _favoritedMeals.any((favoritedMeal) => favoritedMeal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primaryColor: Colors.pink,
        colorScheme: ThemeData()
            .copyWith()
            .colorScheme
            .copyWith(secondary: Colors.amber),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: Color.fromRGBO(
              20,
              51,
              51,
              1,
            ),
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontFamily: "RobotoCondensed",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: TabsScreen.routeName,
      routes: {
        TabsScreen.routeName: (_) => TabsScreen(_favoritedMeals),
        CategoriesScreen.routeName: (_) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (_) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (_) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorited),
        FiltersScreen.routeName: (_) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
