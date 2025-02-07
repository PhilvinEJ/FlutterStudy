import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_bloc/data/models/isar_todo.dart';
import 'package:to_do_bloc/domain/repository/todo_repo.dart';
import 'package:to_do_bloc/presentation/todo/todo_page.dart';

import 'data/repository/isar_todo_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get directory path
  final dir = await getApplicationDocumentsDirectory();

  // Set ISAR db
  final isar = await Isar.open([ToDoIsarSchema], directory: dir.path);

  // Initialize repo with db
  final isarToDoRepo = IsarToDoRepo(isar);

  // Run App
  runApp(MyApp(
    toDoRepo: isarToDoRepo,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.toDoRepo});

  // Database injection throughout the app
  final ToDoRepo toDoRepo;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoPage(
        toDoRepo: toDoRepo,
      ),
    );
  }
}
