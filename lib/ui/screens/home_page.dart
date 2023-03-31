import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_onboarding/models/plants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_onboarding/ui/screens/meal_page.dart';
import 'package:flutter_onboarding/ui/screens/diaper_page.dart';
import 'package:flutter_onboarding/ui/screens/sleep_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = '';
  int selectedIndex = 0;
  DateTime now = DateTime.now();
  late DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

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
    Size size = MediaQuery.of(context).size;

    List<Plant> plantList = Plant.plantList;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                // color: Colors.red,
                padding: const EdgeInsets.only(top: 20, right: 10),
                height: 100,
                width: 250,
                child: Text(
                  "A look at $name's growth!",
                  // "A look at Jack's growth!",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
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

          const SizedBox(
            height: 8,
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
                width: 350,
                color: Colors.grey[300],
              ),
            ],
          ),

          // calendar widget
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

                    // when particular date is selected
                    child: GestureDetector(
                      onTap: () => setState(() {
                        selectedIndex = index;
                      }),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // circular box around day letter
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

                            // day letter text (SMTWTFS)
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

                          // number design (1-31)
                          const SizedBox(height: 8.0),
                          Text(
                            "${index + 1}",
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.black54, // number color
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          // coloured bar under number
                          const SizedBox(height: 8.0),
                          Container(
                            height: 2.0,
                            width: 28.0,
                            color: selectedIndex == index
                                ? Colors.orange // bar colour under number
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
          const SizedBox(
            height: 8,
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
                width: 350,
                color: Colors.grey[300],
              ),
            ],
          ),
          Center(
            child: Column(
              children: [
                Container(
                  width: 400,
                  height: 200,
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color.fromARGB(255, 165, 220, 244),
                    elevation: 10,
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        debugPrint('Card tapped.');
                        Navigator.push(
                            context,
                            PageTransition(
                                child: const MealPage(),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,

                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          const ListTile(
                            leading: Icon(
                              Icons.cookie,
                              size: 60,
                            ),
                            title: Text('Meals',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                            subtitle: Text('Fed 3 times'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 400,
                  height: 200,
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color.fromARGB(255, 165, 220, 244),
                    elevation: 10,
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          debugPrint('Card tapped.');
                        },
                        child: Image.asset(
                          'assets/images/toddler-one.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                Container(
                  width: 400,
                  height: 200,
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color.fromARGB(255, 255, 179, 71),
                    elevation: 10,
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        debugPrint('Card tapped.');
                        Navigator.push(
                            context,
                            PageTransition(
                                child: const DiaperPage(),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,

                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          const ListTile(
                            leading: Icon(
                              Icons.change_circle_rounded,
                              size: 60,
                            ),
                            title: Text('Diapers',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                            subtitle: Text('Changed 3 times'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 400,
                  height: 200,
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color.fromARGB(255, 252, 242, 216),
                    elevation: 10,
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        debugPrint('Card tapped.');
                        Navigator.push(
                            context,
                            PageTransition(
                                child: const SleepPage(),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,

                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          const ListTile(
                            leading: Icon(
                              Icons.snooze_rounded,
                              size: 60,
                            ),
                            title: Text('Sleep',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                            subtitle: Text('Slept 5.5 hours'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
