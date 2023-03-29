import 'package:flutter/material.dart';

class LogStyle {
  static TextStyle question = const TextStyle(
    color: Colors.blue,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle heightWeight = const TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static Text makeQuestion(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: question,
    );
  }

  static Text makeHeightWeight(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: heightWeight,
    );
  }

  static TextButton makeNextButton(void Function() onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: const Text("Next"),
    );
  }

  static Row makeNextRow(bool display, void Function() onPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: display
          ? [
              makeNextButton(onPressed),
            ]
          : [],
    );
  }
}
