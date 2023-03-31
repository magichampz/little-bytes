import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/log-pages/log_style.dart';
import 'package:intl/intl.dart';

class MilestoneLog extends StatefulWidget {
  const MilestoneLog({super.key});

  @override
  State<MilestoneLog> createState() => _MilestoneLogState();
}

class _MilestoneLogState extends State<MilestoneLog> {
  TextEditingController editingController = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  TextEditingController milkController = TextEditingController();

  String day = "";
  String sleep = "";
  String milk = "";
  bool? valuefirst = false;

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
              "Milestone Tracker",
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
      body: Column(
        children: [
          SizedBox(height: 5),
          Container(
            height: 3,
            color: Colors.grey[300],
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    controller: dateInput,
                    //editing controller of this TextField
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "Date of Milestone" //label text of field
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
                        String newDate =
                            DateFormat('dd MMM yyyy').format(choice);
                        dateInput.text = newDate;
                        setState(() {
                          day = newDate;
                        });
                      }
                    },
                  ),
                ),
                Container(
                  // color: Colors.red,
                  padding: const EdgeInsets.only(top: 20),
                  height: 70,
                  // width: 250,
                  // ignore: prefer_const_literals_to_create_immutables
                  child: Column(children: [
                    const Text(
                      "Jack is 7 months old",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color.fromRGBO(66, 66, 66, 1)),
                    ),
                    SizedBox(height: 10),
                    // Container(
                    //   height: 3,
                    //   width: 350,
                    //   color: Colors.grey[300],
                    // ),
                  ]),
                ),
                const Text(
                  "Common milestones that might occur at Jack's age: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFF5C5B5B)),
                ),
                const CheckListItem(text: 'Sits without support '),
                const CheckListItem(text: 'Makes different sounds '),
                const CheckListItem(
                    text: 'Gets to a sitting position by himself '),
                const CheckListItem(text: 'Looks when you call his name'),
                const CheckListItem(text: 'Turns towards sounds or voices'),
                const CheckListItem(text: 'Rolls in both directions'),
                SizedBox(
                  height: 30,
                ),
                LogStyle.makeQuestion("Any other milestones?"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
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
                // SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.blueGrey,
                        onSurface: Colors.grey,
                      ),
                      child: Text(
                        "Save",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CheckListItem extends StatefulWidget {
  const CheckListItem({super.key, required this.text});
  final String text;

  @override
  State<CheckListItem> createState() => _CheckListItemState();
}

class _CheckListItemState extends State<CheckListItem> {
  bool? valuefirst = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text,
            style: TextStyle(fontSize: 15.0),
          ),
          Checkbox(
            checkColor: Colors.white,
            activeColor: Colors.blue,
            value: valuefirst,
            onChanged: (bool? value) {
              setState(() {
                valuefirst = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
