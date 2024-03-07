import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number/common/shared_preferences.dart';
import 'package:random_number/screen/setting/setting_screen.dart';
import '../../constant/color.dart';
import '../../constant/values.dart';
import 'component/body.dart';
import 'component/footer.dart';
import 'component/header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double maxNumber = 1000.0;
  List<int> randomNumbers = [
    123,
    456,
    789,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header( onPressed: onSettingsPressed ),
              Body( randomNumbers: randomNumbers ),
              Footer( onPressed: onRandomNumberGenerate ),
            ],
          ),
        ),
      ),
    );
  }

  void onSettingsPressed() async {
     await getIntValue().then((value){
      maxNumber = value ?? INITIAL_MIN;
    });
     await Navigator.of(context).push<int>(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return SettingsScreen(
            maxNumber: maxNumber,
          );
        },
      ),
    );
  }

  void onRandomNumberGenerate() {
    final rand = Random();
    final Set<int> newNumbers = {};

    while (newNumbers.length != 3) {
      final number = rand.nextInt(maxNumber.toInt());
      newNumbers.add(number);
    }

    setState(() {
      randomNumbers = newNumbers.toList();
    });
  }
}
