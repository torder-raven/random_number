import 'package:shared_preferences/shared_preferences.dart';

const SHARED_PREFERENCE_MAX_NUMBER_KEY = 'maxNumber';

addIntegerValue(double maxNumber) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble(SHARED_PREFERENCE_MAX_NUMBER_KEY, maxNumber);
}

getIntValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getDouble(SHARED_PREFERENCE_MAX_NUMBER_KEY) ?? 1000.0;
}