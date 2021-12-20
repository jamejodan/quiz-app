// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String answerText;
  final Color answerColor;
  final Function answerTap;

  // ignore: use_key_in_widget_constructors
  Button(
      {required this.answerText,
      required this.answerColor,
      required this.answerTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: GestureDetector(
        onTap: () => answerTap,
        child: Container(
          color: answerColor,
          child: Center(
            child: Text(answerText),
          ),
        ),
      ),
    );
  }
}
