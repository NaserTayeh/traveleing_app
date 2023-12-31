// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:traveleing_app/app_data.dart';
import 'package:traveleing_app/widget/trip_item.dart';

import '../models/trip.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const screenRoute = 'category-trips';

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String? categoryTitle;
  late List<Trip> displayTrips;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgument['id'];
    categoryTitle = routeArgument!['title'];
    displayTrips = Trips_data.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text(categoryTitle!))),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return TripItem(
              id: displayTrips[index].id,
              title: displayTrips[index].title,
              imageUrl: displayTrips[index].imageUrl,
              duration: displayTrips[index].duration,
              tripType: displayTrips[index].tripType,
              season: displayTrips[index].season,
              removeItem: _removeTrip,
            );
          },
          itemCount: displayTrips.length,
        ));
  }
}
