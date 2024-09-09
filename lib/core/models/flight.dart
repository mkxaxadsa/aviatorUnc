import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Flight {
  @HiveField(0)
  final int id;
  @HiveField(1)
  String from;
  @HiveField(2)
  String to;
  @HiveField(3)
  String date;
  @HiveField(4)
  String time;
  @HiveField(5)
  int miles;

  Flight({
    required this.id,
    required this.from,
    required this.to,
    required this.date,
    required this.time,
    required this.miles,
  });
}

class FlightAdapter extends TypeAdapter<Flight> {
  @override
  final typeId = 0;

  @override
  Flight read(BinaryReader reader) {
    return Flight(
      id: reader.read(),
      from: reader.read(),
      to: reader.read(),
      date: reader.read(),
      time: reader.read(),
      miles: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Flight obj) {
    writer.write(obj.id);
    writer.write(obj.from);
    writer.write(obj.to);
    writer.write(obj.date);
    writer.write(obj.time);
    writer.write(obj.miles);
  }
}
