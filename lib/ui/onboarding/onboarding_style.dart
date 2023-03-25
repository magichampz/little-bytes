import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class OnboardingStyle {
  static TextStyle question = const TextStyle(
    color: Colors.blue,
    fontSize: 30,
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

  static NumberPicker makeNumberPicker(
      {required int value, required void Function(int) onChanged}) {
    return NumberPicker(
      value: value,
      minValue: 0,
      maxValue: 100,
      step: 1,
      itemHeight: 100,
      axis: Axis.horizontal,
      onChanged: onChanged,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black26),
      ),
    );
  }
}
