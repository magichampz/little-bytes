import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/onboarding/onboarding_birthday.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './onboarding_landing.dart';
import './onboarding_name.dart';
import '../root_page.dart';
import 'onboarding_heightweight.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
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

  setValueNextPage(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
    nextPage();
  }

  getValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: currentPage == 0
            ? TextButton(
                child: const Text("Skip"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RootPage()),
                  );
                })
            : TextButton(onPressed: previousPage, child: const Text("Back")),
        actions: currentPage == 0
            ? [TextButton(onPressed: nextPage, child: const Text("Next"))]
            : [],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
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
              const OnboardingLanding(),
              OnboardingName(
                setName: (String name) {
                  setValueNextPage("name", name);
                },
              ),
              OnboardingBirthday(setBirthday: (String birthday) {
                setValueNextPage("birthday", birthday);
              }),
              const OnboardingHeightWeight()
            ],
          ),
        ],
      ),
    );
  }
}
