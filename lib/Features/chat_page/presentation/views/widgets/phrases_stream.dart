import 'dart:math';

import 'package:flutter/material.dart';

import '../chat_page.dart';
import 'a_one_message_bubble.dart';

String generateRandomKey() {
  const String characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
  Random random = Random();
  String randomKey = '';

  for (int i = 0; i < 20; i++) {
    randomKey += characters[random.nextInt(characters.length)];
  }

  return randomKey;
}
class Messagestream extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  bool viewTextReceiver = false;
  int indexCount = 0;
  late var theText;
  bool loadOrNo = false;
  late List<dynamic> allKeysList;
  late List<String> sortedKeys;
  late bool isViewTextFeild = true;


  Future getDateFromDb() async {
    theText =
        dataBaseDataObtained?["books"][bookNameObtained][pageNameObtained];
    Set<dynamic> allKeys = theText.keys.toSet();
    allKeysList = allKeys.toList();
    sortedKeys = theText.keys.toList()
      ..sort((a, b) {
        int countA = int.tryParse(theText[a]["count"].toString()) ?? 0;
        int countB = int.tryParse(theText[b]["count"].toString()) ?? 0;

        return countA.compareTo(countB);
      });
  }

  List<Messagebubble> messageBubbles = [];
  List bubbles = [];

  @override
  Widget build(BuildContext context) {
    getDateFromDb();
    for (var element in sortedKeys) {
      String phraseArabic = dataBaseDataObtained?["books"][bookNameObtained]
          [pageNameObtained][element]["arabic_phrase"];
      String phraseEnglish = dataBaseDataObtained?["books"][bookNameObtained]
          [pageNameObtained][element]["english_phrase"];

      String theTranslationSaved = dataBaseDataObtained?["books"]
                  [bookNameObtained][pageNameObtained][element]
              ["user_english_phrase"] ??
          "n";
      // String transla

      if (theTranslationSaved.length < 2) {
        isViewTextFeild = true;
        // print("hola9387");

      } else {
        isViewTextFeild = false;

      }

      Messagebubble messageBubble = Messagebubble(
          generateRandomKey(),
          phraseArabic,
          isViewTextFeild,
          element,
          theTranslationSaved,
          phraseEnglish);
      messageBubbles.add(messageBubble);
    }

    return Expanded(
      child: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shrinkWrap: true,
        children: messageBubbles,
      ),
    );
  }
}
