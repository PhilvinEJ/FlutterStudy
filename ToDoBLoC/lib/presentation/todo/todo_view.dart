import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_bloc/domain/models/todo.dart';

import '../../components/dialog_boxes.dart';
import '../../components/todo_tile.dart';
import '../toDo/todo_cubit.dart';

class ToDoView extends StatelessWidget {
  const ToDoView({super.key});

  // Show add to do dialog
  void showAddTaskDialog(BuildContext context) {
    final toDoCubit = context.read<ToDoCubit>();
    final textController = TextEditingController();

    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            textEditingController: textController,
            onSave: () {
              toDoCubit.addTodo(textController.text);
              Navigator.of(context).pop();
              textController.clear();
            },
            onCancel: () {
              Navigator.of(context).pop();
              textController.clear();
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // To Do Cubit
    final toDoCubit = context.read<ToDoCubit>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {showAddTaskDialog(context)},
        shape: CircleBorder(),
        backgroundColor: Colors.yellow,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.yellow[200],
      body: BlocBuilder<ToDoCubit, List<ToDo>>(builder: (context, toDoList) {
        return ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            // Get to do
            final toDo = toDoList[index];

            return ToDoTile(
              taskName: toDo.text,
              taskCompleted: toDo.isCompleted,
              onChanged: (bool? value) => toDoCubit.toggleTodoStatus(toDo),
              deleteTask: (context) {
                toDoCubit.deleteTodo(toDo);
              },
            );
          },
        );
      }),
    );
  }
}
