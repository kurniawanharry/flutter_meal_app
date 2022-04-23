import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;
  FavoritesScreen({Key? key, required this.favoriteMeal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(
          child: Text('You Have No Favorites Meals Yet - Add Some! test'));
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          final mealItem = favoriteMeal[index];
          return MealItem(
            id: mealItem.id,
            title: mealItem.title,
            imageUrl: mealItem.imageUrl,
            duration: mealItem.duration,
            complexity: mealItem.complexity,
            affordability: mealItem.affordability,
            // removeItem: _removeItem,
          );
        },
        itemCount: favoriteMeal.length,
      );
    }
  }
}
