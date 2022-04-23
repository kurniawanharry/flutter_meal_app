import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';

import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Favorites',
    }
  ];

  int _selectedPagesIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPagesIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(_pages[_selectedPagesIndex]['title'] as String),
          ),
          body: _pages[_selectedPagesIndex]['page'] as dynamic,
          drawer: MainDrawer(),
          bottomNavigationBar: BottomNavigationBar(
            onTap: _selectedPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white,
            selectedItemColor: Theme.of(context).accentColor,
            currentIndex: _selectedPagesIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorites'),
            ],
          ),
        ));
  }
}

// bottom: TabBar(tabs: [
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Meals',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'Favorite',
//               ),
//             ]),
//           ),
//           body: TabBarView(children: [
//             CategoriesScreen(),
//             FavoritesScreen(),
//           ])
