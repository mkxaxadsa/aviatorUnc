import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../common/assets.dart';
import '../features/home/pages/status_page.dart';
import 'models/flight.dart';

double navBarHeight = 60;

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

String formatTimestamp(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  String formattedDate = DateFormat('dd.MM.yyyy').format(date);
  return formattedDate;
}

String formatDateTime(DateTime date) {
  String formattedDate = DateFormat('dd.MM.yyyy').format(date);
  return formattedDate;
}

String formatTime(DateTime time) {
  DateFormat timeFormat = DateFormat('HH:mm');
  String formattedTime = timeFormat.format(time);
  return formattedTime;
}

DateTime convertToDateTime(String date) {
  try {
    return DateFormat('dd.MM.yyyy').parse(date);
  } catch (e) {
    return DateTime.now();
  }
}

double getStatusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

double getBottom(BuildContext context) {
  return MediaQuery.of(context).viewPadding.bottom;
}

bool getButtonActive(List<TextEditingController> controllers) {
  for (TextEditingController controller in controllers) {
    if (controller.text.isEmpty) return false;
  }
  return true;
}

int getRandomMiles() {
  final Random random = Random();
  int randomNumber = 800 + random.nextInt(1501 - 800);
  return randomNumber;
}

void precacheImages(BuildContext context) {
  List<String> imageAssets = [
    'assets/gift1.png',
    'assets/gift2.png',
    'assets/p1.png',
    'assets/p2.png',
    'assets/p3.png',
    'assets/p4.png',
    'assets/p5.png',
    'assets/p6.png',
    'assets/p7.png',
    'assets/p8.png',
    'assets/p9.png',
    'assets/p10.png',
    'assets/p11.png',
    'assets/p12.png',
  ];
  for (String assets in imageAssets) {
    precacheImage(AssetImage(assets), context);
  }
}

int getMiles(List<Flight> flights) {
  int miles = 0;
  for (Flight flight in flights) {
    miles += flight.miles;
  }
  return miles;
}

List<StatusModel> statuses = [
  StatusModel(
      name: 'Bronze',
      image: Assets.statusGroup4,
      desc: "You have accumulated over 2,000 flight miles"),
  StatusModel(
      name: 'Silver',
      image: Assets.statusGroup3,
      desc: "You have accumulated over 5,000 flight miles"),
  StatusModel(
      name: 'Gold',
      image: Assets.statusGroup1,
      desc: "You have accumulated over 10,000 flight miles"),
];

StatusModel getStatus(int miles) {
  if (miles <= 2000) {
    return statuses.first;
  } else if (miles <= 5000) {
    return statuses[1];
  } else {
    return statuses[2];
  }
}
