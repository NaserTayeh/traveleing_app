// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:traveleing_app/screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);
  Widget buildListTile(String title, IconData icon, VoidCallback onTapLink) {
    return ListTile(
      onTap: onTapLink,
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'ElMessiri', fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          color: Theme.of(context).accentColor,
          child: Text(
            'dalelk seahi',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        buildListTile('الرحلات', Icons.card_travel, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListTile('الفلترة', Icons.filter_list, () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.screenRoute);
        })
      ]),
    );
  }
}
