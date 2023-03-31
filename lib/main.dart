import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/expandable_fab.dart';
import 'ui/onboarding/onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Onboarding Screen',
      home: Onboarding(),
      // home: ExampleExpandableFab(),
      debugShowCheckedModeBanner: false,
    );
  }
}
