import 'package:shared_preferences/shared_preferences.dart';

addIntegerValue(double maxNumber) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble('maxNumber', maxNumber);
}

getIntValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getDouble('maxNumber') ?? 1000.0;
}