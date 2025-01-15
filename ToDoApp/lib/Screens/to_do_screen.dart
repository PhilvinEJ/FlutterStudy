import 'package:flutter/material.dart';
import 'package:to_do_app/Utils/utils.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  // Text editing controller is needed to access TextField
  TextEditingController textEditingController = TextEditingController();

  // Greeting Msg
  String greetingMsg = "Hello User";

  // Greet User
  void greetUser() {
    printLog(textEditingController.text);
    setState(() {
      greetingMsg = "Hello ${textEditingController.text}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Greeting Message Text
              Text(greetingMsg),

              // Name Input
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                      hintText: "Enter your name",
                      border: OutlineInputBorder()),
                ),
              ),

              // Greet User on tap
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ElevatedButton(onPressed: greetUser, child: Text("Tap")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
