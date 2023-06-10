// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:traveleing_app/screens/categories_screen.dart';
import 'package:traveleing_app/screens/favorite_screen.dart';
import 'package:traveleing_app/widget/app_drawer.dart';

// class TabsScreen extends StatelessWidget {
// @override
// Widget build(BuildContext context) {
// return DefaultTabController(
//     length: 2,
//     child: Scaffold(
//       appBar: AppBar(
//         title: Text('دليل سياحي'),
//         bottom: TabBar(tabs: [
//           Tab(
//             icon: Icon(Icons.dashboard),
//             text: 'التصنيفات',
//           ),
//           Tab(
//             icon: Icon(Icons.star),
//             text: 'المفضلة',
//           )
//         ]),
//       ),
//       body: TabBarView(
//         children: [
//           CategoriesScreen(),
//           FavoritesScreen(),

//         ],
//       ),
//     ),
//   );
// }
// }
class TabScreen extends StatefulWidget {
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, Object>> _screens = [
    {
      'Screen': CategoriesScreen(),
      'Title': 'تصنيفات الرحلات',
    },
    {
      'Screen': FavoritesScreen(),
      'Title': 'الرحلات المفضلة ',
    },
  ];
  final List<String> _titles = [
    'التصنيفات',
    'المفضلة ',
  ];

  int _selectedScreenIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_screens[_selectedScreenIndex]["Title"] as String)),
      drawer: AppDrawer(),
      body: _screens[_selectedScreenIndex]['Screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}
