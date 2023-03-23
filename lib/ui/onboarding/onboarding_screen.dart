import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import '../root_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Container landingPage = Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: Image.asset('assets/images/plant-one.png'),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Welcome to LittleBytes",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Taking care of your little one isn't easy. We're here for you",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );

    Text namePage = const Text("namePage");

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
            : TextButton(
                child: const Text("Back"),
                onPressed: () {
                  pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                }),
        actions: [
          TextButton(
              child: const Text("Next"),
              onPressed: () {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              })
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            //the different pages with the pictures and words
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
            controller: pageController,
            children: [
              landingPage,
              namePage,
            ],
          ),
        ],
      ),
    );
  }
}
