import 'package:flutter/material.dart';
import 'package:random_number/const/strings.dart';

import '../const/colors.dart';

class HomeScreen extends StatelessWidget {
  final int number;

  const HomeScreen({
    required this.number,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ➊ 주사위 이미지
        Center(
          child: Image.asset("$IMAGE_PATH$number.$IMAGE_EXTENSTION"),
        ),
        SizedBox(height: 32.0),
        Text(
          LUCKY_NUMBER,
          style: TextStyle(
            color: secondaryColor,
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 12.0),
        Text(
          number.toString(), // ➋ 주사위 값에 해당되는 숫자
          style: TextStyle(
            color: primaryColor,
            fontSize: 60.0,
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    );
  }
}
