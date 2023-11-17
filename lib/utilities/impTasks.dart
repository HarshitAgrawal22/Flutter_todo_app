import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class impTask extends StatelessWidget {
  final taskName;
  bool isCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;
  Function(BuildContext)? normalizer;
  impTask(
      {super.key,
      required this.taskName,
      required this.isCompleted,
      required this.deleteTask,
      required this.normalizer,
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
        padding: EdgeInsets.all(15),
        child: Slidable(
          startActionPane: ActionPane(motion: DrawerMotion(), children: [
            SlidableAction(
              onPressed: normalizer,
              icon: Icons.label_important,
              backgroundColor: Color.fromRGBO(248, 230, 203, 1),
              borderRadius: BorderRadius.circular(8),
            )
          ]),
          endActionPane: ActionPane(motion: StretchMotion(), children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(8),
            )
          ]),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(100, 196, 195, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Checkbox(value: isCompleted, onChanged: onChanged),
                Flexible(
                    child: RichText(
                        overflow: TextOverflow.clip,
                        text: TextSpan(
                          text: taskName,
                          style: TextStyle(
                              color: colorGetter(isCompleted),
                              fontSize: sizer(isCompleted),
                              decoration: isCompleted
                                  ? (TextDecoration.lineThrough)
                                  : TextDecoration.none),
                        )))
              ],
            ),
          ),
        ));
  }
}
