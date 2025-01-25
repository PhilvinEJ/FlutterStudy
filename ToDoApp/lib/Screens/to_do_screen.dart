import 'package:flutter/material.dart';
import 'package:to_do_app/Components/dialog_box.dart';
import 'package:to_do_app/Components/to_do_tile.dart';
import 'package:to_do_app/data/database.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  // Reference hive box
  ToDoDatabase db = ToDoDatabase();

  final taskTextEditingController = TextEditingController();

  @override
  void initState() {
    if (db.isFirstTime()) {
      db.setInitialData();
      db.updateDB();
    } else {
      db.loadData();
    }
    super.initState();
  }

  // Checkbox value change
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
      db.updateDB();
    });
  }

  // Save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([taskTextEditingController.text, false]);
      db.updateDB();
      taskTextEditingController.clear();
    });
    Navigator.of(context).pop();
  }

  // Add new task
  void addNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            textEditingController: taskTextEditingController,
            onSave: saveNewTask,
            onCancel: () {
              Navigator.of(context).pop();
              taskTextEditingController.clear();
            },
          );
        });
  }

  // Delete a task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
      db.updateDB();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("TO DO")),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        shape: CircleBorder(),
        backgroundColor: Colors.yellow,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.yellow[200],
      body: ListView.builder(
        itemBuilder: (content, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (bool? value) => checkBoxChanged(value, index),
            deleteTask: (context) {
              deleteTask(index);
            },
          );
        },
        itemCount: db.toDoList.length,
      ),
    );
  }
}
