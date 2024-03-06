import 'package:flutter/material.dart';
import 'setting_screen.dart';
import 'home_screen.dart';
import 'dart:math';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  late int number;

  TabController? controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);
    controller!.addListener(tabListener);
    refreshDice();
  }

  void refreshDice() {
    final rand = new Random();

    setState(() {
      number = rand.nextInt(5) + 1;
    });
  }

  tabListener() {
    setState(() {
      if (controller!.index == 1) {
        refreshDice();
      }
    });
  }

  @override
  dispose() {
    controller!.removeListener(tabListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: TabBarView(
        controller: controller,
        children: renderChildren(),
      ),
      bottomNavigationBar: renderBottomNavigation(),
    );
  }

  List<Widget> renderChildren() {
    return [HomeScreen(number: number), SettingScreen()];
  }

  BottomNavigationBar renderBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: controller!.index,
      onTap: (int index) {
        // 탭이 선택될 때마다 실행되는 함수
        setState(() {
          controller!.animateTo(index);
        });
      },
      items: [
        BottomNavigationBarItem(
          // 하단 탭바의 각 버튼을 구현
          icon: Icon(
            Icons.edgesensor_high_outlined,
          ),
          label: '주사위',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
          ),
          label: '설정',
        ),
      ],
    );
  }
}
