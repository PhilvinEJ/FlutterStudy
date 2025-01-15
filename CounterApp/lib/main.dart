import 'package:counter_app/Screens/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // Set status bar color etc
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    statusBarBrightness: Brightness.light, // For iOS (dark icons)
  ));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Counter App",
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    );
  }
}
