import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number/component/number_row.dart';
import 'package:random_number/constant/color.dart';
import 'package:random_number/screen/setting_screen.dart';

import '../resources/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int maxNumber = 1000;
  List<int> randomNumbers = [123, 456, 789];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _Header(
                onPressed: navigateToSettings,
              ),
              _Numbers(
                randomNumbers: randomNumbers,
              ),
              _GenerateNumberByButton(
                randomNumbers: randomNumbers,
                onGenerateButtonPressed: generatorNumbers,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToSettings() async {
    final result = await Navigator.of(context).push<int>(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return SettingsScreen(
            maxNumber: maxNumber,
          );
        },
      ),
    );

    setState(() {
      maxNumber = result ?? 1000;
    });
  }

  void generatorNumbers() {
    final random = Random();
    final Set<int> newNumbers = {};

    while (newNumbers.length != 3) {
      final number = random.nextInt(maxNumber);
      newNumbers.add(number);
    }

    setState(() {
      randomNumbers = newNumbers.toList();
    });
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onPressed;

  const _Header({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          Strings.TITLE_HOME,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.settings,
            color: redColor,
          ),
        ),
      ],
    );
  }
}

class _Numbers extends StatelessWidget {
  final List<int> randomNumbers;

  const _Numbers({required this.randomNumbers, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: randomNumbers
              .asMap()
              .entries
              .map(
                (x) => Padding(
                  padding: EdgeInsets.only(bottom: x.key == 2 ? 0 : 16),
                  child: NumberRow(
                    number: x.value,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _GenerateNumberByButton extends StatelessWidget {
  final List<int> randomNumbers;
  final VoidCallback onGenerateButtonPressed;

  const _GenerateNumberByButton(
      {required this.randomNumbers,
      required this.onGenerateButtonPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onGenerateButtonPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: redColor,
        ),
        child: const Text(
          Strings.GENERATE,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
