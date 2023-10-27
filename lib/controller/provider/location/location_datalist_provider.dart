import 'package:flutter/foundation.dart';
import 'package:kt_telematic_solutions/model/location_data/location_data.dart';

class LocationDataList with ChangeNotifier {
  List<LocationData> locationData = [];

  Future<void> addLocationData(double latitude, double longitude) async {
    final newData = LocationData(latitude: latitude, longitude: longitude);
    locationData.add(newData);
    notifyListeners();
  }
}
