import 'package:shared_preferences/shared_preferences.dart';

Future<bool> shouldShowWelcome() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('showWelcome') ?? true;
}

Future<void> savewelcomeshown() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('showWelcome', false);
}
