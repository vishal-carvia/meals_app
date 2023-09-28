import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);

  void toggleMealFavouriteStatus(Meal meal) {
    // It is not allowed to edit values in memory when using StateNotifier, so we can only resign it.
    // That's the reason we are taking so many just to add an item to a list here.
    final mealIsFavourite = state.contains(meal);

    if (mealIsFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
    state = [];
  }
}

final favouritesMealsProviders =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref) {
  return FavouriteMealsNotifier();
});
