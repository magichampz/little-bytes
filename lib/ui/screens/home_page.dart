import 'package:flutter/material.dart';
import 'package:flutter_onboarding/models/recipes.dart';
import 'package:page_transition/page_transition.dart';
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
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

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
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
