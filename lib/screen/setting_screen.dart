import 'package:flutter/material.dart';
import 'package:random_number/const/colors.dart';
import 'package:random_number/const/strings.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        SETTING,
        style: TextStyle(color: primaryColor),
      ),
    );
  }
}
