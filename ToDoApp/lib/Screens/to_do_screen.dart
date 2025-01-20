import 'package:flutter/material.dart';
import 'package:to_do_app/Components/to_do_tile.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("TO DO")),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      backgroundColor: Colors.yellow[200],
      body: ListView(
        children: [ToDoTile()],
      ),
    );
  }
}
