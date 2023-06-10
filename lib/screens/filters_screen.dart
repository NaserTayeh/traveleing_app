// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:traveleing_app/widget/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);
  static const screenRoute = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isInSommer = false;
  var _isInWinter = false;
  var _isForFamily = false;
  Widget buildSwitchListTile(String title, String subtitle, var currentValue,
      void Function(bool)? updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(title: Text('filters')),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTile(
                      'الرحلات الشتوية فقط',
                      'اظهار الرحلات في فصل الشتاء فقط',
                      _isInWinter, (newValue) {
                    setState(() {
                      _isInWinter = newValue;
                    });
                  }),
                  buildSwitchListTile(
                      'الرحلات الصيفية فقط',
                      'اظهار الرحلات في فصل الصيف فقط',
                      _isInSommer, (newValue) {
                    setState(() {
                      _isInSommer = newValue;
                    });
                  }),
                  buildSwitchListTile(
                      'للعائلات',
                      'اظهار الرحلات التي للعائلات فقط',
                      _isForFamily, (newValue) {
                    setState(() {
                      _isForFamily = newValue;
                    });
                  })
                ],
              ),
            )
          ],
        ));
  }
}
