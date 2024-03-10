import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_number/component/NumberRow.dart';
import 'package:random_number/constant/color.dart';
import 'package:random_number/provider/MaxNumber.dart';

import '../constant/constants.dart';
import '../constant/strings.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late MaxNumber maxNumber;
  double? _maxNumber;

  @override
  Widget build(BuildContext context) {
    maxNumber = Provider.of<MaxNumber>(context);
    _maxNumber ??= maxNumber.getMaxValue();

    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(children: [
            _Body(
              maxNumber: _maxNumber!,
            ),
            _Footer(
              maxNumber: _maxNumber!,
              onSliderChanged: onSliderChanged,
              onButtonChanged: onSaveMaxValue,
            )
          ]),
        ),
      ),
    );
  }

  void onSliderChanged(double value) {
    setState(() {
      _maxNumber = value;
    });
  }

  void onSaveMaxValue() {
    if (_maxNumber != null) {
      maxNumber.setMaxValue(_maxNumber!);
    }
    Navigator.of(context).pop();
  }
}

class _Body extends StatelessWidget {
  final double maxNumber;

  const _Body({super.key, required this.maxNumber});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: NumberRow(number: maxNumber.toInt()));
  }
}

class _Footer extends StatelessWidget {
  final double maxNumber;
  final ValueChanged<double> onSliderChanged;
  final VoidCallback onButtonChanged;

  const _Footer(
      {super.key,
      required this.maxNumber,
      required this.onSliderChanged,
      required this.onButtonChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
            value: maxNumber,
            min: MIN_SLIDER_VALUE,
            max: MAX_SLIDER_VALUE,
            onChanged: onSliderChanged),
        ElevatedButton(
            onPressed: onButtonChanged, child: const Text(SAVE_MAX_VALUE))
      ],
    );
  }
}
