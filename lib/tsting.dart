
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// import 'core/appWords/adjectives.dart';
// import 'core/databaseXoperations/WriteOnDataBase.dart';
import 'core/stored_data/appWords/adjectives.dart';
import 'core/utils/databaseXoperations/WriteOnDataBase.dart';
import 'firebase_options.dart';

MakeChangesDBM ddb = MakeChangesDBM();
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // String userId= "teKESef7NCcCZwGgZzjSlfVsNgG2";
  String weboLevel = "words";
  String beboLevel = "users";
  String googleLevel = "heoolo";
  Map googlChild = {"translationtoarabic":"هولا"};
  String googleChild= "heoolo";
  ddb.prepareDataBaseEnvironment(beboLevel,weboLevel,googleLevel,googlChild);

  ddb.addNewWordGoogleLevel("heoolodf","هولو",beboLevel,weboLevel,"teKESef7NCcCZwGgZzjSlfVsNgG2");

  print(abvAdjectives[1]);
  print("hello world");
}
