import 'package:flutter/material.dart';
import 'package:flutter_meal_app/dummy_data.dart';
import 'package:flutter_meal_app/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoriesMealScreen extends StatefulWidget {
  static const routeName = '/categories-meal';
  final List<Meal> availableMeal;

  const CategoriesMealScreen({Key? key, required this.availableMeal})
      : super(key: key);
  @override
  State<CategoriesMealScreen> createState() => _CategoriesMealScreenState();
}

class _CategoriesMealScreenState extends State<CategoriesMealScreen> {
  String? categoryTitle;
  List<Meal>? categoryMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      categoryMeals = widget.availableMeal
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeItem(String mealId) {
    setState(() {
      categoryMeals?.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final mealItem = categoryMeals![index];
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
          itemCount: categoryMeals!.length,
        ));
  }
}
