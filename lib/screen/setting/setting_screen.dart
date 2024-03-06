import 'package:flutter/material.dart';
import '../../common/shared_preferences.dart';
import '../../constant/color.dart';
import '../setting/component/body.dart';
import '../setting/component/footer.dart';

class SettingsScreen extends StatefulWidget {
  final double maxNumber;

  const SettingsScreen({required this.maxNumber, Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late double maxNumber;

  @override
  void initState() {
    maxNumber = widget.maxNumber.toDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Body(maxNumber: maxNumber),
              Footer(
                maxNumber: maxNumber,
                onSliderChanged: onSliderChanged,
                onButtonPressed: onButtonPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSliderChanged(double val) {
    setState(() {
      maxNumber = val;
    });
  }

  void onButtonPressed() async {
    await addIntegerValue(maxNumber);
    Navigator.of(context).pop();
  }
}
