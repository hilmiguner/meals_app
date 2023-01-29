import 'package:flutter/material.dart';
import 'package:meals_app/widgets/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
            )),
      ),
      home: CategoriesScreen(),
    );
  }
}