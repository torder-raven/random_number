import 'package:flutter/material.dart';
import 'package:random_number/component/number_row.dart';
import 'package:random_number/constant/color.dart';
import 'package:random_number/resources/strings.dart';

class SettingsScreen extends StatefulWidget {
  final int maxNumber;

  const SettingsScreen({required this.maxNumber, super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 10000;

  @override
  void initState() {
    super.initState();
    maxNumber = widget.maxNumber.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _Header(
                onBackButtonPressed: onSaveButtonPressed,
              ),
              _Number(
                maxNumber: maxNumber,
              ),
              _SaveNumberBySlider(
                maxNumber: maxNumber,
                onSliderChanged: onSliderChanged,
                onSaveButtonPressed: onSaveButtonPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSliderChanged(double value) {
    setState(() {
      maxNumber = value;
    });
  }

  void onSaveButtonPressed() {
    Navigator.of(context).pop(maxNumber.toInt());
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onBackButtonPressed;

  const _Header({required this.onBackButtonPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onBackButtonPressed,
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        const Text(
          Strings.TITLE_SETTINGS,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _Number extends StatelessWidget {
  final double maxNumber;

  const _Number({required this.maxNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberRow(
        number: maxNumber.toInt(),
      ),
    );
  }
}

class _SaveNumberBySlider extends StatelessWidget {
  final double maxNumber;
  final ValueChanged<double> onSliderChanged;
  final VoidCallback onSaveButtonPressed;

  final double sliderMinValue = 1000;
  final double sliderMaxValue = 100000;

  const _SaveNumberBySlider(
      {required this.maxNumber,
      required this.onSliderChanged,
      required this.onSaveButtonPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          min: sliderMinValue,
          max: sliderMaxValue,
          value: maxNumber,
          onChanged: onSliderChanged,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onSaveButtonPressed,
            style: ElevatedButton.styleFrom(backgroundColor: redColor),
            child: const Text(
              Strings.SAVE,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
