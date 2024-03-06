import 'package:flutter/material.dart';

import 'lotto_number.dart';

class LottoNumbers extends StatelessWidget {
  final List<int> numbers;

  const LottoNumbers({required this.numbers, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.blue,
      child: Row(
        children: numbers
            .map(
              (e) => LottoNumber(
                number: e,
              ),
            )
            .toList(),
      ),
    );
  }
}
