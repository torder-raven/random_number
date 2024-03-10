import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_number/component/NumberRow.dart';
import 'package:random_number/constant/color.dart';
import 'package:random_number/constant/strings.dart';
import 'package:random_number/provider/MaxNumber.dart';
import 'package:random_number/screen/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MaxNumber maxNumber;
  List<int> randomNumbers = [123, 456, 789];

  @override
  Widget build(BuildContext context) {
    maxNumber = Provider.of<MaxNumber>(context);

    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              _Header(onPressedSetting: goToSetting),
              _Body(
                randomNumber: randomNumbers,
              ),
              _Footer(
                onPressedButton: onRandomNumberGenerate,
              )
            ],
          ),
        ),
      ),
    );
  }

  void goToSetting() async {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return SettingScreen();
    }));

    // await Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (BuildContext context) {
    //   return SettingScreen();
    // }));
  }

  void onRandomNumberGenerate() {
    final rand = Random();
    final Set<int> newNumbers = {};

    while (newNumbers.length != 3) {
      final number = rand.nextInt(maxNumber.getMaxValue().toInt());
      newNumbers.add(number);
    }

    setState(() {
      randomNumbers = newNumbers.toList();
    });
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onPressedSetting;

  const _Header({super.key, required this.onPressedSetting});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          TITLE,
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
        ),
        IconButton(
            onPressed: onPressedSetting,
            icon: const Icon(
              Icons.settings,
              color: RED_COLOR,
            )),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> randomNumber;

  const _Body({super.key, required this.randomNumber});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: randomNumber
          .asMap()
          .entries
          .map((entry) => Padding(
                padding: EdgeInsets.only(bottom: entry.key == 2 ? 0 : 16.0),
                child: NumberRow(number: entry.value),
              ))
          .toList(),
    ));
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressedButton;

  const _Footer({super.key, required this.onPressedButton});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: RED_COLOR,
        ),
        onPressed: onPressedButton,
        child: const Text(CREATE_RANDOM_NUMBER),
      ),
    );
  }
}
