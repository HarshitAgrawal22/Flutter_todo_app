import 'package:hive_flutter/hive_flutter.dart';

class TODODatabase {
  List todoholder = [];
  List importantTask = [];
  final myBox = Hive.box('myBox');
  void InitialData() {
    todoholder = [
      ["Learn web development", false],
      ["Learn app development", false],
      ["Learn to create a System of things", false]
    ];
    importantTask = [
      ["Learn JavaScript", false]
    ];
  }

  void loadData() {
    todoholder = myBox.get("TodoList");
    importantTask = myBox.get("impTask");
  }

  void updateDatabase() {
    myBox.put("TodoList", todoholder);
    myBox.put("impTask", importantTask);
  }
}
