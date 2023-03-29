import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';

class MealPage extends StatefulWidget {
  const MealPage({Key? key}) : super(key: key);

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
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
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint('favorite');
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Constants.primaryColor.withOpacity(.15),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share,
                          color: Constants.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          Positioned(
            top: 100,
            right: 20,
            left: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                    Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Meals',
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Tuesday, 23 March 2023',
                          style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                    Container
                    (
                      padding: const EdgeInsets.all(4.0),

                      child: Card(
                        shape: RoundedRectangleBorder(  
                          borderRadius: BorderRadius.circular(8.0),  
                        ),
                        color: Color.fromARGB(255, 255, 248, 229),
                        elevation: 10, 
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              leading: Icon(Icons.sunny, size:30),
                              title: Text('Feeding at 9:15 am'),
                              subtitle: Text('Fed with left breast. Duration: 17 min'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                //const SizedBox(width: 8),
                                IconButton(
                                  onPressed: (){
                                    debugPrint('tried to edit');
                                  }, 
                                  icon: Icon(Icons.edit)
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container
                    (
                      padding: const EdgeInsets.all(4.0),

                      child: Card(
                        shape: RoundedRectangleBorder(  
                          borderRadius: BorderRadius.circular(8.0),  
                        ),
                        color: Color.fromARGB(255, 255, 248, 229),
                        elevation: 10, 
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              leading: Icon(Icons.sunny, size:30),
                              title: Text('Feeding at 11:30 am'),
                              subtitle: Text('Fed with right breast. Duration: 15 min'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                //const SizedBox(width: 8),
                                IconButton(
                                  onPressed: (){
                                    debugPrint('tried to edit');
                                  }, 
                                  icon: Icon(Icons.edit)
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container
                    (
                      padding: const EdgeInsets.all(4.0),

                      child: Card(
                        shape: RoundedRectangleBorder(  
                          borderRadius: BorderRadius.circular(8.0),  
                        ),
                        color: Color.fromARGB(255, 255, 248, 229),
                        elevation: 10, 
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              leading: Icon(Icons.sunny, size:30),
                              title: Text('Feeding at 1:37 pm'),
                              subtitle: Text('Fed with bottle. Volume: 90 ml'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                //const SizedBox(width: 8),
                                IconButton(
                                  onPressed: (){
                                    debugPrint('tried to edit');
                                  }, 
                                  icon: Icon(Icons.edit)
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
