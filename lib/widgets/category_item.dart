import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Color color;
  final String title;
  final String id;

  CategoryItem({@required this.id, @required this.color, @required this.title});

  void _selectedCagetory(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (_) => CategoryMealsScreen(
          categoryID: id,
          categoryTitle: title,
          appBarColor: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectedCagetory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.5),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
