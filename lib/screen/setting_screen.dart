import 'package:flutter/material.dart';
import 'package:random_number/component/number_row.dart';
import 'package:random_number/constant/color.dart';

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
              _Body(
                maxNumber: maxNumber,
              ),
              _Footer(
                maxNumber: maxNumber,
                onChanged: onChanged,
                onButtonPressed: onButtonPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onChanged(double value) {
    setState(() {
      maxNumber = value;
    });
  }

  void onButtonPressed() {
    Navigator.of(context).pop(maxNumber.toInt());
  }
}

class _Body extends StatelessWidget {
  final double maxNumber;

  const _Body({required this.maxNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberRow(
        number: maxNumber.toInt(),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final double maxNumber;
  final ValueChanged<double> onChanged;
  final VoidCallback onButtonPressed;

  const _Footer(
      {required this.maxNumber,
      required this.onChanged,
      required this.onButtonPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          min: 1000,
          max: 1000000,
          value: maxNumber,
          onChanged: onChanged,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onButtonPressed,
            child: Text("저장"),
            style: ElevatedButton.styleFrom(primary: redColor),
          ),
        ),
      ],
    );
  }
}
