import 'package:flutter/material.dart';
import 'package:flutter_meal_app/dummy_data.dart';
import 'package:flutter_meal_app/screens/filters_screen.dart';
import 'package:flutter_meal_app/screens/meal_detail_screen.dart';
import 'package:flutter_meal_app/screens/tabs_screen.dart';
import './screens/categories_meal_screen.dart';
import './screens/categories_screen.dart';
import 'models/meal.dart';

void main(List<String> args) {
  runApp(MealApp());
}

class MealApp extends StatefulWidget {
  const MealApp({Key? key}) : super(key: key);

  @override
  State<MealApp> createState() => _MealAppState();
}

class _MealAppState extends State<MealApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] as dynamic && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] as dynamic && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] as dynamic && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] as dynamic && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorites(String mealId) {
    final existingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeal.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MealApp',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.amberAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                fontFamily: 'Raleway', fontSize: 20, color: Colors.black)),
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            subtitle1: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(
              favoriteMeal: _favoriteMeal,
            ),
        CategoriesMealScreen.routeName: (context) => CategoriesMealScreen(
              availableMeal: _availableMeal,
            ),
        MealDetail.routeName: (context) => MealDetail(
              isMealFavorite: _isMealFavorite,
              toggleFavorite: _toggleFavorites,
            ),
        FiltersScreen.routeName: (context) => FiltersScreen(
              saveFilters: _setFilters,
              curentFilters: _filters,
            )
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),
        );
      },
    );
  }
}
