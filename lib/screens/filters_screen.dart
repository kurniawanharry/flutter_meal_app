import 'package:flutter/material.dart';
import 'package:flutter_meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> curentFilters;
  FiltersScreen(
      {Key? key, required this.saveFilters, required this.curentFilters})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    _isGlutenFree = widget.curentFilters['gluten'] as dynamic;
    _isVegan = widget.curentFilters['vegan'] as dynamic;
    _isVegetarian = widget.curentFilters['vegetarian'] as dynamic;
    _isLactoseFree = widget.curentFilters['lactose'] as dynamic;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Configuration'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _isGlutenFree,
                    'lactose': _isLactoseFree,
                    'vegan': _isVegan,
                    'vegetarian': _isVegetarian
                  };
                  widget.saveFilters(selectedFilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust Your Meal Selection',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                buildSwitchTile(
                    'Glutten-Free',
                    'Only include Glutten-free meals',
                    _isGlutenFree,
                    (value) => setState(() {
                          _isGlutenFree = value;
                        })),
                buildSwitchTile(
                    'Lactose-Free',
                    'Only include Lactose-Free meals',
                    _isLactoseFree,
                    (value) => setState(() {
                          _isLactoseFree = value;
                        })),
                buildSwitchTile(
                  'Vegetarian',
                  'Only include Vegetarian meals',
                  _isVegetarian,
                  (value) => setState(() {
                    _isVegetarian = value;
                  }),
                ),
                buildSwitchTile(
                  'Vegan',
                  'Only includeVegan meals',
                  _isVegan,
                  (value) {
                    setState(() {
                      _isVegan = value;
                    });
                  },
                ),
              ],
            ))
          ],
        ));
  }

  Widget buildSwitchTile(
    String title,
    String subtitle,
    bool currentValue,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
