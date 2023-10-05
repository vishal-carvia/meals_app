import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/widgets/custom_switch_list_tile.dart';
import '../providers/filters_providers.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filterProviders);
    _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = activeFilters[Filter.vegetarian]!;
    _veganFilterSet = activeFilters[Filter.vegan]!;
  }

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
          ref.read(filterProviders.notifier).setFilters({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegan: _veganFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
          });
          return true;
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
