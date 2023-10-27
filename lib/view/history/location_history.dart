import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kt_telematic_solutions/controller/provider/location/location_datalist_provider.dart';
import 'package:kt_telematic_solutions/model/core/colors.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LocationListScreen extends StatefulWidget {
  const LocationListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LocationListScreenState createState() => _LocationListScreenState();
}

class _LocationListScreenState extends State<LocationListScreen> {
  @override
  void initState() {
    super.initState();
    // Start background location tracking every 15 minutes.
    startLocationTracking(context);
  }

  void startLocationTracking(BuildContext context) {
    const duration = const Duration(minutes: 15);
    Timer.periodic(duration, (Timer t) async {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final locationDataList = Provider.of<LocationDataList>(context, listen: false);
      locationDataList.addLocationData(position.latitude, position.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Data List'),
      ),
      body: Consumer<LocationDataList>(
        builder: (context, locationDataList, child) {
          return ListView.builder(
            itemCount: locationDataList.locationData.length,
            itemBuilder: (context, index) {
              final data = locationDataList.locationData[index];
              return ListTile(
                title: Text('Latitude: ${data.latitude}, Longitude: ${data.longitude}'),
              );
            },
          );
        },
      ),
    );
  }
}
