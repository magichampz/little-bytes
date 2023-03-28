import 'package:flutter/material.dart';
import 'onboarding_style.dart';

class OnboardingHeightWeight extends StatefulWidget {
  const OnboardingHeightWeight({super.key, required this.setHeightWeight});

  final void Function(int, int) setHeightWeight;

  @override
  State<OnboardingHeightWeight> createState() => _OnboardingHeightWeightState();
}

class _OnboardingHeightWeightState extends State<OnboardingHeightWeight> {
  int height = 50;
  int weight = 15;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            OnboardingStyle.makeQuestion(
                "What's your baby's height and weight?"),
            const SizedBox(
              height: 60,
            ),
            OnboardingStyle.makeHeightWeight("Height (cm)"),
            const SizedBox(
              height: 10,
            ),
            OnboardingStyle.makeNumberPicker(
              value: height,
              onChanged: (value) => setState(() => height = value),
            ),
            const SizedBox(height: 36),
            OnboardingStyle.makeHeightWeight("Weight (kg)"),
            const SizedBox(
              height: 10,
            ),
            OnboardingStyle.makeNumberPicker(
              value: weight,
              onChanged: (value) => setState(() => weight = value),
            ),
            OnboardingStyle.makeNextRow(
                true, () => widget.setHeightWeight(height, weight))
          ],
        ));
  }
}
