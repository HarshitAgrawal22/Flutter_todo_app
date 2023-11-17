import 'package:flutter/material.dart';

class allButtons extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  allButtons({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text),
      color: Theme.of(context).primaryColor,
    );
  }
}
