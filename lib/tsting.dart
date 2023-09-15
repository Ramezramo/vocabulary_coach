
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'appWords/adjectives.dart';
import 'databaseXoperations/MakeChangesInDataBase.dart';
import 'firebase_options.dart';

MakeChangesDBM ddb = MakeChangesDBM();
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  String userId= "teKESef7NCcCZwGgZzjSlfVsNgG2";
  String weboLevel = "websites";
  String beboLevel = "users";
  String googleLevel = "heoolo";
  String randomKeyLevel= "for_test";
  // String = "";
  // ddb.delete_word_randomKeyLevel(userId, webowebolevel, beboLevel, googleLevel, randomKeyLevel);
  ddb.getCurrentUser();
  // ddb.createDocumentWithUserId(beboLevel);
  // ddb.addValueTogoogleLevel("gogo","hello world 23s ",userId,beboLevel,googleLevel,weboLevel);
  ddb.addNewGoogleLevelWord("heoolodf","هولو",beboLevel,weboLevel);
  // ddb.addNewPass(googleLevel,"googleLevel","gogo");
  // ddb.deleteGoogleChild(googleLevel, weboLevel, beboLevel, userId,"qagvylM");
  print(abvAdjectives[1]);
  print("hello world");
}
