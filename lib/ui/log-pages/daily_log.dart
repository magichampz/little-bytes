import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/log-pages/feeding_log.dart';
import 'package:flutter_onboarding/ui/log-pages/milk_log.dart';
import 'package:flutter_onboarding/ui/log-pages/sleep_log.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DailyLog extends StatefulWidget {
  const DailyLog({Key? key}) : super(key: key);

  @override
  State<DailyLog> createState() => _DailyLogState();
}

class _DailyLogState extends State<DailyLog> {
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  previousPage() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  setString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  setInt(String key, int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

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
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
            children: [
              SleepLog(
                setDay: (String day) {
                  setString("day", day);
                },
                setSleep: (String sleep) {
                  setString("sleep", sleep);
                  nextPage();
                },
              ),
              MilkLog(
                setMilk: (String milk) {
                  setString("birthday", milk);
                  nextPage();
                },
              ),
              // FeedingLog(
              //   setHeightWeight: (int height, int weight) {
              //     setInt("height", height);
              //     setInt("weight", weight);
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => const RootPage()),
              //     );
              //   },
              // )
            ],
          ),
        ],
      ),
    );
  }
}


      // SingleChildScrollView(
      //     child: Column(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      //       child: TextField(
      //         controller: dateInput,
      //         //editing controller of this TextField
      //         decoration: const InputDecoration(
      //             icon: Icon(Icons.calendar_today), //icon of text field
      //             labelText: "Date of Entry" //label text of field
      //             ),
      //         readOnly: true,
      //         //set it true, so that user will not able to edit text
      //         onTap: () async {
      //           DateTime? choice = await showDatePicker(
      //               context: context,
      //               initialDate: DateTime.now(),
      //               firstDate: DateTime(1950),
      //               lastDate: DateTime(2100));
      //           if (choice != null) {
      //             String newDate = DateFormat('dd MMM yyyy').format(choice);
      //             dateInput.text = newDate;
      //             setState(() {
      //               date = newDate;
      //             });
      //           }
      //         },
      //       ),
      //     ),
      //   ],
      // )),
