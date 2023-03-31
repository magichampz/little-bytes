import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/log-pages/milestone_page.dart';
import 'package:flutter_onboarding/ui/log-pages/single_log.dart';
import 'package:page_transition/page_transition.dart';

class LogOptions extends StatefulWidget {
  const LogOptions({super.key});

  @override
  State<LogOptions> createState() => _LogOptionsState();
}

class _LogOptionsState extends State<LogOptions> {
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
              "Record baby's growth",
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 120),
            Container(
              width: 400,
              height: 150,
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
                    debugPrint('daily log tapped.');
                    Navigator.push(
                        context,
                        PageTransition(
                            child: SingleLog(
                              setDay: (String day) {},
                              setSleep: (String sleep) {},
                              setMilk: (String milk) {},
                            ),
                            type: PageTransitionType.bottomToTop));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,

                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(
                          Icons.today,
                          size: 60,
                        ),
                        title: Text("Record today's log",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: 400,
              height: 150,
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
                            child: MilestoneLog(), //temporary only
                            type: PageTransitionType.bottomToTop));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(
                          Icons.insights,
                          size: 60,
                        ),
                        title: Text('Record a Milestone',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
