import 'package:flutter/material.dart';
import 'package:random_number/const/colors.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '와 세팅!!!',
        style: TextStyle(color: primaryColor),
      ),
    );
  }
}
