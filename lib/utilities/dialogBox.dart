import 'package:flutter/material.dart';
import 'package:the_todo_app/utilities/Buttons.dart';

class dialogBox extends StatelessWidget {
  final myController;
  VoidCallback save;
  VoidCallback cancel;
  dialogBox(
      {super.key,
      required this.myController,
      required this.save,
      required this.cancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 19,
      backgroundColor: Color.fromRGBO(81, 147, 179, 1),
      content: Container(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: myController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter the task"),
                cursorColor: Colors.deepOrange,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  allButtons(onPressed: save, text: "Save".toUpperCase()),
                  allButtons(onPressed: cancel, text: "cancel".toUpperCase())
                ],
              )
            ],
          )),
    );
  }
}
