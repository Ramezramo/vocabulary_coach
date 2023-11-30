import 'package:flutter/material.dart';

import '../../../../core/utils/colorConstants.dart';
import '../../../TranslatingAbookFeature/presentation/views/translating_book.dart';
import '../../../addingNewWordFeature/presentation/views/addingNewWordPage.dart';
import '../../../chat_page/presentation/views/chat_page.dart';
import '../../../wordMemorization/presentation/wordMemorization.dart';
import '../../../wordsAddedReview/presentation/wordsAddedReview.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with AutomaticKeepAliveClientMixin<MyHomePage> {
  // Specify the type of the pages list (assuming all pages have the same type)
  List<Widget> pages = [
    const addWordPage(),
    const wordMemorizationPage(),
    const WordsAdded(),
    const translatingBookMain(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Ensure that AutomaticKeepAliveClientMixin is correctly initialized

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: clr_2backGround2,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: clr_4cardColor2,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.add),
            label: 'Home',
            backgroundColor: clr_7cardInButtomNav,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.access_alarms),
            label: 'Home',
            backgroundColor: clr_7cardInButtomNav,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_balance_sharp),
            label: 'Added words',
            backgroundColor: clr_7cardInButtomNav,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.menu_book_sharp),
            label: 'Bar',
            backgroundColor: clr_7cardInButtomNav,
          ),
        ],
      ),
      body: pages[currentIndex],
    );
  }

  @override
  bool get wantKeepAlive => true; // This ensures that the state is kept alive when switching between tabs
}
