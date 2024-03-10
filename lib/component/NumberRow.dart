

import 'package:flutter/material.dart';

import '../constant/constants.dart';

class NumberRow extends StatelessWidget {
  final int number;

  const NumberRow({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: number
          .toString()
          .split('')
          .map((splitNumber) => Image.asset(
        "$PATH_IMAGE_ASSET/$splitNumber.png",
        height: 70.0,
        width: 50.0,
      ))
          .toList(),
    );
  }
}
