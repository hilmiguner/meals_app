import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = "/filters";

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _builderSwitchListTile(
      {String title, bool defaultValue, Function updateValue}) {
    String subtitle = "Only include " + title.toLowerCase() + " meals.";

    return SwitchListTile(
      title: Text("Gluten Free"),
      subtitle: Text(subtitle),
      value: defaultValue,
      activeColor: Theme.of(context).primaryColor,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Your Filters"),
          backgroundColor: Theme.of(context).primaryColor),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection.",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _builderSwitchListTile(
                      title: "Gluten-Free",
                      defaultValue: _glutenFree,
                      updateValue: (newValue) {
                        setState(() {
                          _glutenFree = newValue;
                        });
                      }),
                  _builderSwitchListTile(
                      title: "Vegetarian",
                      defaultValue: _vegetarian,
                      updateValue: (newValue) {
                        setState(() {
                          _vegetarian = newValue;
                        });
                      }),
                  _builderSwitchListTile(
                      title: "Vegan",
                      defaultValue: _vegan,
                      updateValue: (newValue) {
                        setState(() {
                          _vegan = newValue;
                        });
                      }),
                  _builderSwitchListTile(
                      title: "Lactose-Free",
                      defaultValue: _lactoseFree,
                      updateValue: (newValue) {
                        setState(() {
                          _lactoseFree = newValue;
                        });
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
