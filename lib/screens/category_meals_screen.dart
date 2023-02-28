import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import 'package:meals_app/models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = "/category-meals";

  final List<Meal> meals;

  CategoryMealsScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> routeArgs =
        ModalRoute.of(context).settings.arguments;
    final String categoryID = routeArgs["id"];
    final String title = routeArgs["title"];

    final categoryMeals =
        meals.where((meal) => meal.categories.contains(categoryID)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
