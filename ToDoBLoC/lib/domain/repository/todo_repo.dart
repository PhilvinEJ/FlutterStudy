import 'package:to_do_bloc/domain/models/todo.dart';

abstract class ToDoRepo {
  // Get list of todos
  Future<List<ToDo>> getTodos();

  // Add a new todos
  Future<void> addTodo(ToDo todo);

  // Update a todos
  Future<void> updateTodo(ToDo todo);

  // Delete a todos
  Future<void> deleteTodo(ToDo todo);
}
