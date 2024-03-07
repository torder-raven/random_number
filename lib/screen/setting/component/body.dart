import 'package:flutter/cupertino.dart';
import '../../../component/row.dart';

class Body extends StatelessWidget {
  final double maxNumber;

  const Body({
    required this.maxNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberRow(
        number: maxNumber.toInt(),
      ),
    );
  }
}