import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/onboarding/heightweight_question.dart';
import 'package:intl/intl.dart';

class BabyDOB extends StatefulWidget {
  const BabyDOB({super.key});

  @override
  State<BabyDOB> createState() => _BabyDOBState();
}

class _BabyDOBState extends State<BabyDOB> {
  TextEditingController editingController = TextEditingController();
  TextEditingController dateInput = TextEditingController();

  String? dob;
  late String? formattedDate;

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
              "What's your baby's age?",
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
                controller: dateInput,
                //editing controller of this TextField
                decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "Enter Date" //label text of field
                    ),
                readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(pickedDate); //pickedDate output format
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package
                    setState(() {
                      dateInput.text =
                          formattedDate; //set output date to TextField value.
                    });
                    dob = dateInput.text;
                  } else {}
                },
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
                    if (dateInput.text != null) {
                      //print("current date is $dob");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HeightWeight()),
                      );
                    }
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class _HomePage extends State<HomePage> {
//   TextEditingController dateInput = TextEditingController();

//   @override
//   void initState() {
//     dateInput.text = ""; //set the initial value of text field
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("DatePicker in Flutter"),
//         backgroundColor: Colors.redAccent, //background color of app bar
//       ),
//       body: Container(
//         padding: EdgeInsets.all(15),
//         height: MediaQuery.of(context).size.width / 3,
//         child: Center(
//           child: TextField(
//             controller: dateInput,
//             //editing controller of this TextField
//             decoration: InputDecoration(
//                 icon: Icon(Icons.calendar_today), //icon of text field
//                 labelText: "Enter Date" //label text of field
//                 ),
//             readOnly: true,
//             //set it true, so that user will not able to edit text
//             onTap: () async {
//               DateTime? pickedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime(1950),
//                   //DateTime.now() - not to allow to choose before today.
//                   lastDate: DateTime(2100));

//               if (pickedDate != null) {
//                 print(
//                     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
//                 String formattedDate =
//                     DateFormat('yyyy-MM-dd').format(pickedDate);
//                 print(
//                     formattedDate); //formatted date output using intl package =>  2021-03-16
//                 setState(() {
//                   dateInput.text =
//                       formattedDate; //set output date to TextField value.
//                 });
//               } else {}
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
