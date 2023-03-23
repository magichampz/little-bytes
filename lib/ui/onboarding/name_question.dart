import 'package:flutter/material.dart';
import 'package:flutter_onboarding/globals.dart' as globals;
import 'birthday_question.dart';

class BabyName extends StatefulWidget {
  const BabyName({super.key});

  @override
  State<BabyName> createState() => _BabyNameState();
}

class _BabyNameState extends State<BabyName> {
  TextEditingController editingController = TextEditingController();
  String? name;
  String? entry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 350, top: 20),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              }, //to login screen. We will update later
              child: const Text(
                'Back',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
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
                  entry = text;
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
              children: [
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {
                    if (entry != null) {
                      if (entry != '') {
                        print("current value is $entry");
                        setState(() {
                          name = editingController.text;
                        });
                        globals.babyName = name;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BabyDOB()),
                        );
                      }
                    }
                  },
                  child: Text('Next'),
                ),
              ],
            ),
            // Text( //debuging to check whether variable name is stored properly
            //   "name is $name",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontSize: 10,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
