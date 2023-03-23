import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import '../root_page.dart';

class HeightWeight extends StatefulWidget {
  const HeightWeight({super.key});

  @override
  State<HeightWeight> createState() => _HeightWeightState();
}

class _HeightWeightState extends State<HeightWeight> {
  int? height;
  int? weight;
  int _currentHeightValue = 10;
  int _currentWeightValue = 10;

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
          children: <Widget>[
            const Text(
              "Enter your baby's height and weight",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              "Height (cm)",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            NumberPicker(
              value: _currentHeightValue,
              minValue: 0,
              maxValue: 100,
              step: 2,
              itemHeight: 100,
              axis: Axis.horizontal,
              onChanged: (value) => setState(() => _currentHeightValue = value),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black26),
              ),
            ),
            SizedBox(height: 16),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Weight (kg)",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            NumberPicker(
              value: _currentWeightValue,
              minValue: 0,
              maxValue: 20,
              step: 1,
              itemHeight: 100,
              axis: Axis.horizontal,
              onChanged: (value) => setState(() => _currentWeightValue = value),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black26),
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
                    setState(() {
                      height = _currentHeightValue;
                      weight = _currentWeightValue;
                    });
                    print(" height: $height, weight: $weight");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RootPage()),
                    );
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

// class __IntegerExampleState extends State<_IntegerExample> {
//   int _currentIntValue = 10;
//   int _currentHeightValue = 10;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         SizedBox(height: 16),
//         Text('Default', style: Theme.of(context).textTheme.headline6),
//         NumberPicker(
//           value: _currentIntValue,
//           minValue: 0,
//           maxValue: 100,
//           step: 10,
//           haptics: true,
//           onChanged: (value) => setState(() => _currentIntValue = value),
//         ),
//         SizedBox(height: 32),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//               icon: Icon(Icons.remove),
//               onPressed: () => setState(() {
//                 final newValue = _currentIntValue - 10;
//                 _currentIntValue = newValue.clamp(0, 100);
//               }),
//             ),
//             Text('Current int value: $_currentIntValue'),
//             IconButton(
//               icon: Icon(Icons.add),
//               onPressed: () => setState(() {
//                 final newValue = _currentIntValue + 20;
//                 _currentIntValue = newValue.clamp(0, 100);
//               }),
//             ),
//           ],
//         ),
//         Divider(color: Colors.grey, height: 32),
//         SizedBox(height: 16),
//         Text('Horizontal', style: Theme.of(context).textTheme.headline6),
//         NumberPicker(
//           value: _currentHeightValue,
//           minValue: 0,
//           maxValue: 100,
//           step: 10,
//           itemHeight: 100,
//           axis: Axis.horizontal,
//           onChanged: (value) => setState(() => _currentHeightValue = value),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(color: Colors.black26),
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//               icon: Icon(Icons.remove),
//               onPressed: () => setState(() {
//                 final newValue = _currentHeightValue - 10;
//                 _currentHeightValue = newValue.clamp(0, 100);
//               }),
//             ),
//             Text('Current horizontal int value: $_currentHeightValue'),
//             IconButton(
//               icon: Icon(Icons.add),
//               onPressed: () => setState(() {
//                 final newValue = _currentHeightValue + 20;
//                 _currentHeightValue = newValue.clamp(0, 100);
//               }),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
