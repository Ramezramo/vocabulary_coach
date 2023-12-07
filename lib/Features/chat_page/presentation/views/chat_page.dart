import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vocabulary_coach/Features/chat_page/presentation/views/widgets/duolingo_ui_pages_optimizer.dart';
import 'package:vocabulary_coach/Features/chat_page/presentation/views/widgets/phrases_stream.dart';
import '../../../../core/utils/colorConstants.dart';
import '../../../../core/utils/databaseXoperations/read_from_data_base_fb.dart';
import '../manager/mapContainTheMessagesWithTheRandomCode.dart';

Map<String, dynamic>? dataBaseDataObtained;
String? pageNameObtained;

String? bookNameObtained;

class ChatScreen extends StatefulWidget {
  static String id = "chat_screen";

  final Map<String, dynamic> dataBaseData;

  final String pageName;

  final String bookName;

  const ChatScreen(
      {super.key,
      required this.dataBaseData,
      required this.pageName,
      required this.bookName});
  // const ({super.key});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController messageSenderControler = TextEditingController();
  StreamController<String> streamController = StreamController<String>();
  String? messageText;
  late Map nonTranslatedForDuolingo;

  bool viewTextReceiver = false;
  int indexCount = 0;
  late var theText;
  bool loadOrNo = false;
  late List<dynamic> allKeysList;
  late List<String> sortedKeys;
  late bool isViewTextFeild = true;
  late bool viewButtomTranslation = false;

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

  void viewTranslationButton() {
    getDateFromDb();
    for (var element in sortedKeys) {
      String theTranslationSaved = dataBaseDataObtained?["books"]
                  [bookNameObtained][pageNameObtained][element]
              ["user_english_phrase"] ??
          "n";
      // String transla

      if (theTranslationSaved.length < 2) {
        viewButtomTranslation = true;
      } else {}
    }
  }

  void nonTranslatedCalculater() {}
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    dataBaseDataObtained = widget.dataBaseData;
    pageNameObtained = widget.pageName;
    bookNameObtained = widget.bookName;

    viewTranslationButton();
  }

  @override
  void dispose() {
    // Perform cleanup when the page is closed
    messagesRandomName.clear();

    if (kDebugMode) {
      print("the Map Cleared ");
    }
    super.dispose();
  }

  Future<void> giveMeTheData() async {
    dataBaseDataObtained = await giveMeTheDataBaseAsJson();
  }

  Future<void> getDataBAse() async {
    setState(() {
      giveMeTheData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button pressed
            Navigator.of(context).pop();
          },
        ),
        actions: const <Widget>[
          // Other actions
        ],
        title: Text(widget.pageName,
            style:  TextStyle(color: clr_textColor)),
        backgroundColor: clr_UpNavigationBar,
        iconTheme:
             IconThemeData(color: clr_textColor), // Change the color here
      ),
      body: SafeArea(
        child: Column(
          children: [
            Messagestream(),

            if (viewButtomTranslation)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(bottom: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0XFF202F36),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoulingUiOptimizer(pageNAme: widget.pageName,bookNaME: widget.bookName,)),
                      );
                    },
                    child: const Text(
                      'Start Translating',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Colors.white70),
                    ),
                  ),
                ),
              ),
            // buttom_Text_reciever_and_data_in_good_shape(messageSenderControler: messageSenderControler),
          ],
        ),
      ),
      // floatingActionButton: const FoldableOptions(),
    );
  }
}
