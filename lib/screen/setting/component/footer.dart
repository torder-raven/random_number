import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constant/color.dart';
import '../../../constant/strings.dart';
import '../../../constant/values.dart';

class Footer extends StatelessWidget {
  final double maxNumber;
  final ValueChanged<double>? onSliderChanged;
  final VoidCallback onButtonPressed;

  const Footer({
    required this.maxNumber,
    required this.onSliderChanged,
    required this.onButtonPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
          value: maxNumber,
          min: INITIAL_MIN,
          max: INITIAL_MAX,
          onChanged: onSliderChanged,
        ),
        ElevatedButton(
          onPressed: onButtonPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: RED_COLOR,
          ),
          child: Text(SAVE),
        ),
      ],
    );
  }
}