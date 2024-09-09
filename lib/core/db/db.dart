import 'package:hive_flutter/hive_flutter.dart';

import '../models/flight.dart';

String boxName = 'aviabox';
List<Flight> flightsList = [];

Future<void> initHive() async {
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk(boxName);
  Hive.registerAdapter(FlightAdapter());
}

Future<void> getFlights() async {
  final box = await Hive.openBox(boxName);
  List data = box.get('flightsList') ?? [];
  flightsList = data.cast<Flight>();
}

Future<void> updateFlights() async {
  final box = await Hive.openBox(boxName);
  box.put('flightsList', flightsList);
  flightsList = await box.get('flightsList');
}
