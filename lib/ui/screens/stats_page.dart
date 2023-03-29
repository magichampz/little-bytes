import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/models/recipes.dart';

class StatsPage extends StatefulWidget {
  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const SizedBox(
          //   height: 20,
          // ),
          Center(
              child: Column(
            children: [
              Container(
                width: 400,
                height: 260,
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.grey[100],
                  elevation: 10,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      debugPrint('Card tapped.');
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,

                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(
                            Icons.height,
                            size: 60,
                          ),
                          title: Text("Jack's Height",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                        ),
                        SizedBox(
                          height: 180,
                          child: Image.asset(
                              'assets/images/graphs/height-graph.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 400,
                height: 260,
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.grey[100],
                  elevation: 10,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      debugPrint('Card tapped.');
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,

                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(
                            Icons.height,
                            size: 60,
                          ),
                          title: Text("Jack's Weight",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                        ),
                        SizedBox(
                          height: 180,
                          child: Image.asset(
                              'assets/images//graphs/height-graph.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    ));
  }
}
