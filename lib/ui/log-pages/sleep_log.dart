import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_onboarding/ui/log-pages/log_style.dart';
import 'package:intl/intl.dart';

class SleepLog extends StatefulWidget {
  const SleepLog({super.key, required this.setDay, required this.setSleep});

  final void Function(String day) setDay;
  final void Function(String sleep) setSleep;

  @override
  State<SleepLog> createState() => _SleepLogState();
}

class _SleepLogState extends State<SleepLog> {
  TextEditingController editingController = TextEditingController();
  TextEditingController dateInput = TextEditingController();

  String day = "";
  String sleep = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: dateInput,
              //editing controller of this TextField
              decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today), //icon of text field
                  labelText: "Date of Entry" //label text of field
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
                    day = newDate;
                  });
                }
              },
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          LogStyle.makeQuestion(
              "How many hours of sleep did your baby get last night?"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (text) {
                setState(() {
                  sleep = text;
                });
              },
              controller: editingController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: "Number of hours",
              ),
            ),
          ),
          SizedBox(
            height: 30,
            // color: Colors.red,
            child: LogStyle.makeNextRow(
              sleep.isNotEmpty,
              () => widget.setSleep(sleep),
            ),
          )
        ],
      ),
    );
  }
}
