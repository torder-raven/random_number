import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_number/provider/MaxNumber.dart';
import 'package:random_number/screen/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider<MaxNumber>(
    create: (context) {
      return MaxNumber();
    },
    child: MaterialApp(
      home: HomeScreen(),
    ),
  ));
}
