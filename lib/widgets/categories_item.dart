import 'package:flutter/material.dart';
import '../screens/categories_meal_screen.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    Key? key,
    required this.title,
    required this.color,
    required this.id,
  }) : super(key: key);

  final String id;
  final String title;
  final Color color;

  void selectedCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoriesMealScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
