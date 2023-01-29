import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryID;
  final String categoryTitle;
  final Color appBarColor;

  CategoryMealsScreen({this.categoryID, this.categoryTitle, this.appBarColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: appBarColor,
      ),
      body: Center(child: Text("The Recipes")),
    );
  }
}
