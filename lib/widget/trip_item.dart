// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, implementation_imports, unused_import, unnecessary_import, empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:traveleing_app/models/trip.dart';
import 'package:traveleing_app/screens/trip_detail_screen.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  final Function removeItem;
  String? get seasonText {
    if (season == Season.Winter) return 'شتاء';
    if (season == Season.Spring) return 'ربيع';
    if (season == Season.Summer) return 'صيف';
    if (season == Season.Autumn) return 'خريف';
  }

  String? get tripTypeText {
    if (tripType == TripType.Exploration) return 'استكشاف';
    if (tripType == TripType.Recovery) return 'نقاهة';
    if (tripType == TripType.Activities) return 'انشطة';
    if (tripType == TripType.Therapy) return 'معالجة';
  }

  TripItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
    required this.removeItem,
  });

  void selectTrip(BuildContext context) {
    Navigator.of(context)
        .pushNamed(TripDetailScreen.screenRoute, arguments: id)
        .then((result) {
      if (result != null) {
        removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 7, // درجة الظل
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 250,
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.8),
                    ],
                        stops: [
                      0.6,
                      1
                    ])),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.fade,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.wb_sunny,
                      color: Theme.of(context).accentColor,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text('$durationايام '),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.today,
                      color: Theme.of(context).accentColor,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(seasonText!),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.family_restroom,
                      color: Theme.of(context).accentColor,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(tripTypeText!),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
