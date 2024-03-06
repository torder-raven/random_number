import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constant/color.dart';
import '../../../constant/strings.dart';

class Header extends StatelessWidget {
  final VoidCallback onPressed;

  const Header({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          APP_TITLE,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.settings,
            color: RED_COLOR,
          ),
        ),
      ],
    );
  }
}