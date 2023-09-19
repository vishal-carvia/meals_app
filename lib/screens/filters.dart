import 'package:flutter/material.dart';
import 'package:meals_app/widgets/custom_switch_list_tile.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<StatefulWidget> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = widget.currentFilters;
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
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegan: _veganFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
          });
          return false;
        },
        child: Column(
          children: [
            CustomSwitchListTile(
              title: "Gluten-free",
              subtitle: "Only include gluten-free meals",
              value: _glutenFreeFilterSet,
              onChanged: _handleGlutenFreeChanged,
            ),
            CustomSwitchListTile(
              title: "Lactose-free",
              subtitle: "Only include lactose-free meals",
              value: _lactoseFreeFilterSet,
              onChanged: _handleLactoseFreeChanged,
            ),
            CustomSwitchListTile(
              title: "Vegetarian",
              subtitle: "Only include vegetarian meals",
              value: _vegetarianFilterSet,
              onChanged: _handleVegetarianChanged,
            ),
            CustomSwitchListTile(
              title: "Vegan",
              subtitle: "Only include vegan meals",
              value: _veganFilterSet,
              onChanged: _handleVeganChanged,
            ),
          ],
        ),
      ),
    );
  }
}
