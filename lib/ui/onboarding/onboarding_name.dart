import 'package:flutter/material.dart';

class OnboardingName extends StatefulWidget {
  const OnboardingName({super.key, required this.setName});

  final Function(String name) setName;

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
            const Text(
              "What's your baby's name?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
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
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
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
