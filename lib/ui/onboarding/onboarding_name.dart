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
            OnboardingStyle.makeQuestion("What's your baby's name?"),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                autocorrect: false,
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
            SizedBox(
                height: 30,
                // color: Colors.red,
                child: OnboardingStyle.makeNextRow(
                    name.isNotEmpty, () => widget.setName(name))),
            // OnboardingStyle.makeNextRow(
            //     name.isNotEmpty, () => widget.setName(name))
          ],
        ));
  }
}
