import 'package:flutter/material.dart';
import 'package:to_do_app/Components/buttons.dart';
import 'package:to_do_app/Components/text_fields.dart';

class DialogBox extends StatelessWidget {
  const DialogBox(
      {super.key,
      required this.textEditingController,
      required this.onSave,
      required this.onCancel});

  final TextEditingController textEditingController;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Task Input
              PrimaryTextField(textController: textEditingController),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Cancel Button
                  PrimaryButton(text: "Cancel", onPressed: onCancel),

                  // Save Button
                  PrimaryButton(text: "Save", onPressed: onSave)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
