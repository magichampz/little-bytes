import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/log-pages/log_style.dart';
import 'package:intl/intl.dart';

class SingleLog extends StatefulWidget {
  const SingleLog(
      {super.key,
      required this.setDay,
      required this.setSleep,
      required this.setMilk});

  final void Function(String day) setDay;
  final void Function(String sleep) setSleep;
  final void Function(String milk) setMilk;

  @override
  State<SingleLog> createState() => _SingleLogState();
}

class _SingleLogState extends State<SingleLog> {
  TextEditingController editingController = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  TextEditingController milkController = TextEditingController();

  String day = "";
  String sleep = "";
  String milk = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Daily Log",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 27,
                color: Colors.blue[800],
              ),
            ),
          ],
        ),
        leading: TextButton(
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Constants.primaryColor.withOpacity(.15),
              ),
              child: Icon(
                Icons.close,
                color: Constants.primaryColor,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
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
              height: 30,
            ),
            LogStyle.makeQuestion(
                "How many hours of sleep did your baby get last night?"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  setState(() {
                    sleep = text;
                  });
                },
                controller: editingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Number of hours",
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            LogStyle.makeQuestion(
                "How many bottles of milk did your baby drink today?"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  setState(() {
                    milk = text;
                  });
                },
                controller: milkController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Number of bottles",
                ),
              ),
            ),
            SizedBox(
              height: 30,
              // color: Colors.red,
              child: LogStyle.makeNextRow(
                sleep.isNotEmpty | milk.isNotEmpty,
                () => widget.setDay(day),
                () => widget.setSleep(sleep),
                () => widget.setMilk(milk),
              ),
            )
          ],
        ),
      ),
    );
  }
}
