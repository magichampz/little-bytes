import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_onboarding/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = '';

  @override
  void initState() {
    super.initState();
    getString('name').then((value) => setState(() {
          name = value;
        }));
  }

  Future<String> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Container(
            // decoration: const BoxDecoration(
            //   border:
            //       Border(bottom: BorderSide(color: Colors.grey, width: 3.0)),
            // ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  // color: Colors.red,
                  padding: const EdgeInsets.only(top: 20, right: 10),
                  height: 100,
                  width: 280,
                  child: Text(
                    "A look at $name's growth!",
                    // "A look at Jack's growth!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  // padding: const EdgeInsets.only(right:20),
                  width: 100,
                  height: 100,
                  child: ClipOval(
                    child: Image.asset('assets/images/toddler-one.png'),
                  ),
                ),
                const SizedBox(
                  height: 100,
                  width: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 3,
            width: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // decoration: const BoxDecoration(
                //   border:
                //       Border(bottom: BorderSide(color: Colors.grey, width: 3.0)),
                // ),
                height: 3,
                width: 400,
                color: Colors.grey[300],
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            child: Row(
              children: List.generate(
                lastDayOfMonth.day,
                (index) {
                  final currentDate =
                      lastDayOfMonth.add(Duration(days: index + 1));
                  final dayName = DateFormat('E').format(currentDate);
                  return Padding(
                    padding: EdgeInsets.only(
                        left: index == 0 ? 16.0 : 0.0, right: 16.0),
                    child: GestureDetector(
                      onTap: () => setState(() {
                        selectedIndex = index;
                      }),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 42.0,
                            width: 42.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? Colors.orange
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(44.0),
                            ),
                            child: Text(
                              dayName.substring(0, 1),
                              style: TextStyle(
                                fontSize: 24.0,
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            "${index + 1}",
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Container(
                            height: 2.0,
                            width: 28.0,
                            color: selectedIndex == index
                                ? Colors.orange
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
