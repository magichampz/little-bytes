import 'package:flutter/material.dart';

class LogStyle {
  static TextStyle question = const TextStyle(
    color: Color.fromRGBO(21, 101, 192, 1),
    fontSize: 16,
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
      textAlign: TextAlign.left,
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

  static TextButton makeNextButton(
      void Function() func1, void Function() func2, void Function() func3) {
    return TextButton(
      onPressed: () {
        func1();
        func2();
        func3();
      },
      child: const Text("Next"),
    );
  }

  static Row makeNextRow(bool display, void Function() func1,
      void Function() func2, void Function() func3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: display
          ? [
              makeNextButton(func1, func2, func3),
            ]
          : [],
    );
  }
}
