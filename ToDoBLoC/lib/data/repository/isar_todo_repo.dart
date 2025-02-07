import 'package:isar/isar.dart';
import 'package:to_do_bloc/data/models/isar_todo.dart';
import 'package:to_do_bloc/domain/models/todo.dart';
import 'package:to_do_bloc/domain/repository/todo_repo.dart';

class IsarToDoRepo implements ToDoRepo {
  // Data base
  final Isar db;

  IsarToDoRepo(this.db);

  // Get todos
  @override
  Future<List<ToDo>> getTodos() async {
    // Fetch from db
    final todos = await db.toDoIsars.where().findAll();

    // Set to domain layer
    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }

  // Add todos
  @override
  Future<void> addTodo(ToDo todo) async {
    // Convert todos object to isar object
    final toDoIsar = ToDoIsar.fromDomain(todo);

    // Add to db
    return db.writeTxn(() => db.toDoIsars.put(toDoIsar));
  }

  // Update todos
  @override
  Future<void> updateTodo(ToDo todo) async {
    // Convert todos object to isar object
    final toDoIsar = ToDoIsar.fromDomain(todo);

    // Add to db
    return db.writeTxn(() => db.toDoIsars.put(toDoIsar));
  }

  // Delete todos
  @override
  Future<void> deleteTodo(ToDo todo) async {
    await db.writeTxn(() => db.toDoIsars.delete(todo.id));
  }
}
