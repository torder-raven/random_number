import 'package:flutter/material.dart';
import 'package:random_number/const/colors.dart';
import 'package:random_number/screen/root_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // BottomNavigationBar 위젯 관련
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor, // 선택 상태 색
          unselectedItemColor: secondaryColor, // 비선택 상태 색
          backgroundColor: backgroundColor, // 배경 색
        ),
      ),
      home: RootScreen(),
    ),
  );
}
