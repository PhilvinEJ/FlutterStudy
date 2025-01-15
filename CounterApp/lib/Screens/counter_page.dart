import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  // Counter variable
  int _counterValue = 0;

  // Method to increment counter value
  void _incrementCounterValue() {
    setState(() {
      _counterValue++;
    });
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
