import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = "/category-meals";

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> routeArgs =
        ModalRoute.of(context).settings.arguments;
    final String categoryID = routeArgs["id"];
    final String title = routeArgs["title"];
    final Color color = routeArgs["color"];

    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryID))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
