import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_bloc/domain/models/todo.dart';
import 'package:to_do_bloc/domain/repository/todo_repo.dart';

class ToDoCubit extends Cubit<List<ToDo>> {
  // Repo reference
  final ToDoRepo repo;

  // Constructor to initialize with empty list
  ToDoCubit(this.repo) : super([]) {
    loadTodos();
  }

  // L O A D   T O D O S
  Future<void> loadTodos() async {
    // Fetch todos from repo
    final todos = await repo.getTodos();

    // Emit the fetched todos
    emit(todos);
  }

  // A D D   T O D O
  Future<void> addTodo(String text) async {
    // Create a new To Do with the provided text and unique ID
    final newTodo = ToDo(id: DateTime.now().millisecondsSinceEpoch, text: text);

    // Add the new to do to the repository
    await repo.addTodo(newTodo);

    // Load the updated list of todos
    loadTodos();
  }

  // D E L E T E   T O D O
  Future<void> deleteTodo(ToDo todo) async {
    // Delete the provided to do from the repository
    await repo.deleteTodo(todo);

    // Load the updated list of todos
    loadTodos();
  }

  // T O G G L E   C H E C K B O X   S T A T U S
  Future<void> toggleTodoStatus(ToDo todo) async {
    // Toggle the checked status of the provided to do
    final updatedTodo = todo.toggleCompletion();

    // Update the to do in the repository
    await repo.updateTodo(updatedTodo);

    // Load the updated list of todos
    loadTodos();
  }
}
