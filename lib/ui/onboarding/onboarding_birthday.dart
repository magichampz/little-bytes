import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/onboarding/onboarding_style.dart';
import 'package:intl/intl.dart';

class OnboardingBirthday extends StatefulWidget {
  const OnboardingBirthday({super.key, required this.setBirthday});
  final Function(String birthday) setBirthday;

  @override
  State<OnboardingBirthday> createState() => _OnboardingBirthdayState();
}

class _OnboardingBirthdayState extends State<OnboardingBirthday> {
  TextEditingController dateInput = TextEditingController();

  String date = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OnboardingStyle.makeQuestion("When is your baby's birthday?"),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: dateInput,
              //editing controller of this TextField
              decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today), //icon of text field
                  labelText: "Enter Date" //label text of field
                  ),
              readOnly: true,
              //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? choice = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100));
                if (choice != null) {
                  String newDate = DateFormat('dd MMM yyyy').format(choice);
                  dateInput.text = newDate;
                  setState(() {
                    date = newDate;
                  });
                }
              },
            ),
          ),
          OnboardingStyle.makeNextRow(
              date.isNotEmpty, () => widget.setBirthday(date))
        ],
      ),
    );
  }
}
