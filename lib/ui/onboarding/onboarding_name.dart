import 'package:flutter/material.dart';
import 'onboarding_style.dart';

class OnboardingName extends StatefulWidget {
  const OnboardingName({super.key, required this.setName});

  final void Function(String name) setName;

  @override
  State<OnboardingName> createState() => _OnboardingNameState();
}

class _OnboardingNameState extends State<OnboardingName> {
  TextEditingController editingController = TextEditingController();
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "What's your baby's name?",
              textAlign: TextAlign.center,
              style: OnboardingStyle.question,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    name = text;
                  });
                },
                controller: editingController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Enter your child's name",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: name.isEmpty
                  ? []
                  : [
                      TextButton(
                        onPressed: () {
                          if (name.isNotEmpty) {
                            widget.setName(name);
                          }
                        },
                        child: const Text("Next"),
                      ),
                    ],
            ),
          ],
        ));
  }
}
