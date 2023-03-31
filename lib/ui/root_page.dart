import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/models/recipes.dart';
import 'package:flutter_onboarding/ui/expandable_fab.dart';
import 'package:flutter_onboarding/ui/log-pages/daily_log.dart';
import 'package:flutter_onboarding/ui/log-pages/milestone_page.dart';
import 'package:flutter_onboarding/ui/log-pages/single_log.dart';
import 'package:flutter_onboarding/ui/screens/stats_page.dart';
import 'package:flutter_onboarding/ui/screens/recc_page.dart';
import 'package:flutter_onboarding/ui/screens/home_page.dart';
import 'package:flutter_onboarding/ui/screens/profile_page.dart';
import 'package:page_transition/page_transition.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Recipe> favorites = [];
  List<Recipe> myCart = [];

  int _bottomNavIndex = 0;

  //List of the pages
  List<Widget> _widgetOptions() {
    return [
      const HomePage(),
      ReccPage(),
      StatsPage(),
      const ProfilePage(),
    ];
  }

  //List of the pages icons
  List<IconData> iconList = [
    Icons.home,
    Icons.menu_book,
    Icons.bar_chart,
    Icons.person,
  ];

  //List of the pages titles
  List<String> titleList = [
    'Home',
    'Recommendations',
    'Statistics',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[_bottomNavIndex],
              style: TextStyle(
                color: Constants.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            Icon(
              Icons.notifications,
              color: Constants.blackColor,
              size: 30.0,
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      floatingActionButton: ExpandableFab(
        distance: 112.0,
        children: [
          ActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      // child: MilestoneLog(), //temporary only
                      child: SingleLog(
                        setDay: (String day) {},
                        setSleep: (String sleep) {},
                        setMilk: (String milk) {},
                      ),
                      type: PageTransitionType.bottomToTop));
            },
            text: "Record today's log",
            // icon: const Icon(Icons.format_size),
          ),
          ActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: const MilestoneLog(), //temporary only
                      type: PageTransitionType.bottomToTop));
            },
            text: "Add a Milestone",
            // icon: const Icon(Icons.insert_photo),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //         context,
      //         PageTransition(
      //             // child: MilestoneLog(), //temporary only
      //             child: SingleLog(
      //               setDay: (String day) {},
      //               setSleep: (String sleep) {},
      //               setMilk: (String milk) {},
      //             ),
      //             type: PageTransitionType.bottomToTop));
      //   },
      //   backgroundColor: Constants.primaryColor,
      //   child: const Icon(Icons.add, size: 35.0),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          splashColor: Constants.primaryColor,
          activeColor: Constants.primaryColor,
          inactiveColor: Colors.black.withOpacity(.5),
          icons: iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
              final List<Recipe> favoritedRecipes =
                  Recipe.getFavoritedRecipes();
              final List<Recipe> addedToCartRecipes =
                  Recipe.addedToCartRecipes();

              favorites = favoritedRecipes;
              myCart = addedToCartRecipes.toSet().toList();
            });
          }),
    );
  }
}
