import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const String routeName = "/filters";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Your Filters"),
          backgroundColor: Theme.of(context).primaryColor),
      drawer: MainDrawer(),
      body: Center(
        child: Text("Filters!"),
      ),
    );
  }
}
