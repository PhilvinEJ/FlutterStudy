import 'package:hive/hive.dart';

class ToDoDatabase {
  // Reference the box
  final _myBox = Hive.box("ToDoBox");

  // To Do List
  List toDoList = [];

  // If app is opened for the first time run this
  void setInitialData() {
    toDoList = [
      ['Make Tutorial', false],
      ['Do Exercise', false]
    ];
  }

  // Load data
  void loadData() {
    toDoList = _myBox.get('TODO_LIST');
  }

  // Update DB
  void updateDB() {
    _myBox.put('TODO_LIST', toDoList);
  }

  // Is first time opening app
  bool isFirstTime() {
    bool? isFirstTime = _myBox.get('FIRST_TIME');
    if (isFirstTime == null) {
      _myBox.put('FIRST_TIME', false);
      return true;
    } else {
      return isFirstTime;
    }
  }
}
