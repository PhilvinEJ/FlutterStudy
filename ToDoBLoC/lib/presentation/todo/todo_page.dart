import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_bloc/domain/repository/todo_repo.dart';
import 'package:to_do_bloc/presentation/toDo/todo_cubit.dart';
import 'package:to_do_bloc/presentation/todo/todo_view.dart';

class ToDoPage extends StatelessWidget {
  final ToDoRepo toDoRepo;

  const ToDoPage({super.key, required this.toDoRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoCubit(toDoRepo),
      child: ToDoView(),
    );
  }
}
