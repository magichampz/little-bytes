import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import '../root_page.dart';

class OnboardingHeightWeight extends StatefulWidget {
  const OnboardingHeightWeight({super.key});

  @override
  State<OnboardingHeightWeight> createState() => _OnboardingHeightWeightState();
}

class _OnboardingHeightWeightState extends State<OnboardingHeightWeight> {
  int? height;
  int? weight;
  int _currentHeightValue = 10;
  int _currentWeightValue = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Enter your baby's height and weight",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              "Height (cm)",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            NumberPicker(
              value: _currentHeightValue,
              minValue: 0,
              maxValue: 100,
              step: 2,
              itemHeight: 100,
              axis: Axis.horizontal,
              onChanged: (value) => setState(() => _currentHeightValue = value),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black26),
              ),
            ),
            SizedBox(height: 16),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Weight (kg)",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            NumberPicker(
              value: _currentWeightValue,
              minValue: 0,
              maxValue: 20,
              step: 1,
              itemHeight: 100,
              axis: Axis.horizontal,
              onChanged: (value) => setState(() => _currentWeightValue = value),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black26),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {
                    setState(() {
                      height = _currentHeightValue;
                      weight = _currentWeightValue;
                    });
                    print(" height: $height, weight: $weight");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RootPage()),
                    );
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        ));
  }
}
