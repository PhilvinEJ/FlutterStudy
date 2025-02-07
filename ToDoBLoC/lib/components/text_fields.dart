import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField(
      {super.key, required this.textController, this.hintText = "Add Task"});

  final TextEditingController textController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(12.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0),
              borderRadius: BorderRadius.circular(12.0)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(12.0)),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[600])),
    );
  }
}
