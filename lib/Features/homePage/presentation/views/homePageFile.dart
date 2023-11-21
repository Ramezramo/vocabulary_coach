import 'package:flutter/material.dart';

import '../../../../core/utils/colorConstants.dart';
import '../../../addingNewWordFeature/presentation/views/addingNewWordPage.dart';
import '../../../wordMemorization/presentation/views/wordMemorization.dart';
import '../../../wordsAddedReview/presentation/views/wordsAddedReview.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List pages = [
    const addWordPage(),
    const wordMemorizationPage(),
    wordsAdded()

  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add,),
            label: 'Home',
            backgroundColor: clr_cardColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.memory),
            label: 'added words',
            backgroundColor: clr_cardColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp),
            label: 'Bar',
            backgroundColor: clr_cardColor,
          ),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
