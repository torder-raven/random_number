import 'package:flutter/cupertino.dart';

import '../../../component/row.dart';

class Body extends StatelessWidget {
  final List<int> randomNumbers;

  const Body({
    required this.randomNumbers,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: randomNumbers
            .asMap()
            .entries
            .map(
              (x) =>
              Padding(
                padding: EdgeInsets.only(bottom: x.key == 2 ? 0 : 16.0),
                child: NumberRow(
                  number: x.value,
                ),
              ),
        )
            .toList(),
      ),
    );
  }
}