import 'package:flutter/material.dart';
import 'package:flutter_meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 100,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).accentColor,
          child: Text(
            'Cooking Time!',
            style: TextStyle(
                color: Colors.red, fontSize: 20, fontWeight: FontWeight.w900),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        buildListTile(
          icon: Icons.restaurant,
          text: 'Meals',
          tapHandler: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        buildListTile(
          icon: Icons.settings,
          text: 'Filters',
          tapHandler: () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          },
        ),
      ]),
    );
  }
}

class buildListTile extends StatelessWidget {
  const buildListTile({
    Key? key,
    required this.text,
    required this.icon,
    required this.tapHandler,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback tapHandler;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }
}
