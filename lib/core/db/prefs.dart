import 'package:shared_preferences/shared_preferences.dart';

bool onboard = true;
String profileName = '';
String profileEmail = '';
int profileImageID = 1;
int profilePoints = 0;

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('onboard');
  onboard = prefs.getBool('onboard') ?? true;
  profileName = prefs.getString('profileName') ?? '';
  profileEmail = prefs.getString('profileEmail') ?? '';
  profileImageID = prefs.getInt('profileImageID') ?? 1;
  profilePoints = prefs.getInt('points') ?? 0;
}

Future<void> saveData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('onboard', false);
}
