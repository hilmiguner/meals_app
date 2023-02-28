import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = "/meal-detail";

  final Function _toggleFavorite;
  final Function _isMealFavorited;

  MealDetailScreen(this._toggleFavorite, this._isMealFavorited);

  Widget buildSectionTitle(BuildContext ctx, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: 150,
      width: 300,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealID = ModalRoute.of(context).settings.arguments;

    final Meal meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);

    return Scaffold(
      appBar: AppBar(
          title: Text(meal.title),
          backgroundColor: Theme.of(context).primaryColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(ListView.builder(
              itemCount: meal.ingredients.length,
              itemBuilder: (context, index) => Card(
                color: Theme.of(context).colorScheme.secondary,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(meal.ingredients[index]),
                ),
              ),
            )),
            buildSectionTitle(context, "Steps"),
            buildContainer(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Text("# ${index + 1}"),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    if (index != meal.steps.length - 1)
                      Divider(
                        thickness: 3,
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _isMealFavorited(mealID) ? Icons.star : Icons.star_border,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () => _toggleFavorite(mealID),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
