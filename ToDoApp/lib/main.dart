import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/Screens/to_do_screen.dart';

void main() async {
  // Set status bar color etc
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    // For Android (dark icons)
    statusBarBrightness: Brightness.light, // For iOS (dark icons)
  ));

  // Set up hive
  await Hive.initFlutter();

  // Open a hive box
  var box = await Hive.openBox('ToDoBox');

  // Start App
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "To Do",
      theme:
          ThemeData(primarySwatch: Colors.yellow, primaryColor: Colors.yellow),
      home: ToDoScreen(),
    );
  }
}
