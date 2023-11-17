import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:the_todo_app/data/dataWork.dart';
import 'package:the_todo_app/utilities/dialogBox.dart';
import 'package:the_todo_app/utilities/impTasks.dart';
import 'package:the_todo_app/utilities/todo_tile.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  TextEditingController myController = TextEditingController();
  TODODatabase db = TODODatabase();
  void changer(bool? value, int index, List holder) {
    setState(() {
      holder[index][1] = !holder[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    setState(() {
      db.todoholder.add([myController.text, false]);
      myController.clear();
      Navigator.of(context).pop();
      db.updateDatabase();
    });
    {}
  }

  void deleteTask(int index, List holder) {
    setState(() {
      holder.removeAt(index);
      db.updateDatabase();
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return dialogBox(
            myController: myController,
            save: saveNewTask,
            cancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  void initState() {
    if (myBox.get("TodoList") == null) {
      db.InitialData();
    } else {
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }

  void importantMaker(int index) {
    setState(() {
      db.importantTask.add(db.todoholder[index]);
      db.todoholder.removeAt(index);
      db.updateDatabase();
    });
  }

  void normalMaker(int index) {
    setState(() {
      db.todoholder.add(db.importantTask[index]);
      db.importantTask.removeAt(index);
      db.updateDatabase();
    });
  }

  final myBox = Hive.box('myBox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(248, 230, 203, 1),
        appBar: AppBar(
          title: Text("To Do "),
          elevation: 0,
          backgroundColor: Color.fromRGBO(81, 147, 179, 1),
        ),
        drawer: Drawer(
          backgroundColor: Color.fromRGBO(248, 212, 154, 1),
          child: ListView.builder(
              itemCount: db.importantTask.length,
              itemBuilder: (context, index) {
                return impTask(
                    normalizer: (sontext) => normalMaker(index),
                    onChanged: (value) =>
                        changer(value, index, db.importantTask),
                    isCompleted: db.importantTask[index][1],
                    taskName: db.importantTask[index][0],
                    deleteTask: (context) =>
                        deleteTask(index, db.importantTask));
              }),
        ),
        body: ListView.builder(
          itemCount: db.todoholder.length,
          itemBuilder: (context, index) {
            return TODOtile(
              isCompleted: db.todoholder[index][1],
              taskNAme: db.todoholder[index][0],
              onChanged: (value) => changer(value, index, db.todoholder),
              deleteTask: (context) => deleteTask(index, db.todoholder),
              importer: (context) => importantMaker(index),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            elevation: 5,
            backgroundColor: Color.fromRGBO(100, 196, 195, 1),
            onPressed: createNewTask,
            child: Icon(Icons.add)));
  }
}
