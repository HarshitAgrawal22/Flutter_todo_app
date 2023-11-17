import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";

class TODOtile extends StatelessWidget {
  final String taskNAme;
  final bool isCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;
  Function(BuildContext)? importer;
  TODOtile(
      {super.key,
      required this.taskNAme,
      required this.isCompleted,
      required this.deleteTask,
      required this.importer,
      required this.onChanged});

  double sizer(bool) {
    return !bool ? 19 : 15;
  }

  Color colorGetter(bool) {
    return !bool ? Colors.red : Colors.lightGreenAccent;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 15, top: 20, left: 15),
        child: Slidable(
            startActionPane: ActionPane(
              motion: BehindMotion(),
              children: [
                SlidableAction(
                  onPressed: deleteTask,
                  icon: Icons.delete,
                  borderRadius: BorderRadius.circular(10),
                  backgroundColor: Colors.red,
                )
              ],
            ),
            endActionPane: ActionPane(motion: StretchMotion(), children: [
              SlidableAction(
                  onPressed: importer,
                  icon: Icons.label_important,
                  borderRadius: BorderRadius.circular(10),
                  backgroundColor: Color.fromRGBO(248, 212, 154, 1)),
            ]),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(100, 196, 195, 1)),
              child: Container(
                  alignment: Alignment.center,
                  child: Row(children: [
                    Checkbox(value: isCompleted, onChanged: onChanged),
                    Flexible(
                      child: RichText(
                        overflow: TextOverflow.clip,
                        text: TextSpan(
                            style: TextStyle(
                                color: colorGetter(isCompleted),
                                fontSize: sizer(isCompleted),
                                decoration: isCompleted
                                    ? (TextDecoration.lineThrough)
                                    : TextDecoration.none),
                            text: taskNAme),
                      ),
                    )
                  ])),
            )));
  }
}
