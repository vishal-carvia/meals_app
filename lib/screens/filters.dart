import 'package:flutter/material.dart';
import 'package:meals_app/widgets/custom_switch_list_tile.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  void _handleGlutenFreeChanged(bool isChecked) {
    setState(() {
      _glutenFreeFilterSet = isChecked;
    });
  }

  void _handleLactoseFreeChanged(bool isChecked) {
    setState(() {
      _lactoseFreeFilterSet = isChecked;
    });
  }

  void _handleVegetarianChanged(bool isChecked) {
    setState(() {
      _vegetarianFilterSet = isChecked;
    });
  }

  void _handleVeganChanged(bool isChecked) {
    setState(() {
      _veganFilterSet = isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == "meals") {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //           builder: (ctx) => const TabsScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(
        children: [
          CustomSwitchListTile(
            title: "Gluten-free",
            subtitle: "Only include gluten-free meals",
            value: _glutenFreeFilterSet,
            onChanged: _handleGlutenFreeChanged,
          ),
          CustomSwitchListTile(
            title: "Lactose-free",
            subtitle: "",
            value: _lactoseFreeFilterSet,
            onChanged: _handleLactoseFreeChanged,
          ),
          CustomSwitchListTile(
            title: "Vegetarian",
            subtitle: "",
            value: _vegetarianFilterSet,
            onChanged: _handleVegetarianChanged,
          ),
          CustomSwitchListTile(
            title: "Vegan",
            subtitle: "",
            value: _veganFilterSet,
            onChanged: _handleVeganChanged,
          ),
        ],
      ),
    );
  }
}
