import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/onboarding/onboarding_birthday.dart';
import 'package:flutter_onboarding/ui/onboarding/onboarding_style.dart';
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

  setString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  setInt(String key, int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
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
        actions:
            currentPage == 0 ? [OnboardingStyle.makeNextButton(nextPage)] : [],
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
                  setString("name", name);
                  nextPage();
                },
              ),
              OnboardingBirthday(
                setBirthday: (String birthday) {
                  setString("birthday", birthday);
                  nextPage();
                },
              ),
              OnboardingHeightWeight(
                setHeightWeight: (int height, int weight) {
                  setInt("height", height);
                  setInt("weight", weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RootPage()),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
