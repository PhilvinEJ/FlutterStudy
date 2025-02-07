import 'package:isar/isar.dart';
import 'package:to_do_bloc/domain/models/todo.dart';

// To generate isar object, run: dart run build_runner build
part 'isar_todo.g.dart';

@collection
class ToDoIsar {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

  // isar object to pure object
  ToDo toDomain() {
    return ToDo(
      id: id,
      text: text,
      isCompleted: isCompleted,
    );
  }

  // pure object to isar object
  static ToDoIsar fromDomain(ToDo todo) {
    return ToDoIsar()
      ..id = todo.id
      ..text = todo.text
      ..isCompleted = todo.isCompleted;
  }
}
