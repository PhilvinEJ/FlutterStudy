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
    // set state rebuilds widget
    setState(() {
      _counterValue++;
    });
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You pushed the button $_counterValue times.",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            ElevatedButton(
                onPressed: _incrementCounterValue, child: Text("Increment"))
          ],
        ),
      ),
    );
  }
}
