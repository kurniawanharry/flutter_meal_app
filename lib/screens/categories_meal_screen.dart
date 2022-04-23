import 'package:flutter/material.dart';
import 'package:flutter_meal_app/dummy_data.dart';
import 'package:flutter_meal_app/widgets/meal_item.dart';

class CategoriesMealScreen extends StatelessWidget {
  static const routeName = '/categories-meal';
  // const CategoriesMealScreen({Key? key, required this.id, required this.title})
  //     : super(key: key);

  // final String id;
  // final String title;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final mealItem = categoryMeals[index];
            return MealItem(
                id: mealItem.id,
                title: mealItem.title,
                imageUrl: mealItem.imageUrl,
                duration: mealItem.duration,
                complexity: mealItem.complexity,
                affordability: mealItem.affordability);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
