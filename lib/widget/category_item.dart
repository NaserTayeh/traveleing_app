// ignore_for_file: camel_case_types, prefer_const_constructors, sort_child_properties_last, unnecessary_import, implementation_imports, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:traveleing_app/screens/category_trips_screen.dart';
import '../screens/category_trips_screen.dart';

// خاص بتصميم كل بطاقة بالتطبيق
class Category_item extends StatelessWidget {
  final String id;

  final String title;
  final String imageUrl;
  Category_item(this.id, this.title, this.imageUrl);
  void selectCategory(BuildContext ctx) {
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(
    //     builder: (c) => CategoryTripsScreen(this.id, this.title),
    //   ),
    // );
    Navigator.of(ctx).pushNamed(CategoryTripsScreen.screenRoute, arguments: {
      'id': this.id,
      'title': this.title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10)),
          )
        ],
      ),
    );
  }
}
