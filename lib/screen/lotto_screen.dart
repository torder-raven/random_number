import 'package:flutter/material.dart';
import 'package:random_number/resources/strings.dart';

import '../component/lotto_numbers.dart';

class LottoScreen extends StatefulWidget {
  const LottoScreen({super.key});

  @override
  State<LottoScreen> createState() => _LottoScreenState();
}

class _LottoScreenState extends State<LottoScreen> {
  late List<int> numberPool;
  List<List<int>> numbers = [];

  @override
  void initState() {
    super.initState();
    _initLottoNumbers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          Strings.TITLE_LOTTO,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: numbers.map((e) => LottoNumbers(numbers: e)).toList(),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressGenerateButton,
                child: const Text(
                  Strings.GENERATE,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<int> _createNumberPool() {
    List<int> numberPool = [];
    for (int i = 1; i <= 45; i++) {
      numberPool.add(i);
    }
    print("Generated Lotto Number : $numberPool");
    return numberPool;
  }

  void _initLottoNumbers() {
    numberPool = _createNumberPool();
    _shuffleNumberPool();
    _generateLottoNumber();
  }

  void _shuffleNumberPool() {
    numberPool.shuffle();
    print("Shuffled Lotto Number : $numberPool");
  }

  void _generateLottoNumber() {
    numbers.clear();
    while (numbers.length != 5) {
      _shuffleNumberPool();
      numbers.add(numberPool.sublist(0, 6)..sort());
    }
  }

  void onPressGenerateButton() {
    setState(() {
      _generateLottoNumber();
    });
  }
}
