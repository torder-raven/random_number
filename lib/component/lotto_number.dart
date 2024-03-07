
import 'package:flutter/material.dart';

import '../constant/color.dart';

class LottoNumber extends StatelessWidget {
  final int number;

  const LottoNumber({required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: switch (number) {
                    > 0 && < 10 => tenColor,
                    >= 10 && < 20 => twentyColor,
                    >= 20 && < 30 => thirtyColor,
                    >= 30 && < 40 => fortyColor,
                    >= 40 && <= 45 => fiftyColor,
                    _ => fiftyColor
                  },
                  shape: BoxShape.circle),
            ),
            Center(
              child: Text(
                "$number",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}