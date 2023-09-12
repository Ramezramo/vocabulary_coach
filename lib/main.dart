import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vocabulary_coach/pages/addingNewWordPage.dart';
import 'package:vocabulary_coach/pages/wordMemorization.dart';
import 'CONSTANTS/colorConstants.dart';
import 'databaseXoperations/MakeChangesInDataBase.dart';
import 'firebase_options.dart';

// ...

MakeChangesDBM databaseClass = MakeChangesDBM();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the rootd of your dpplication.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget  {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List pages = [
    addWordPage(),
    wordMemorizationPage(),

  ];

  int currentIndex = 0 ;

  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    databaseClass.forceLogin();
    databaseClass.settingUserId("users");
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
