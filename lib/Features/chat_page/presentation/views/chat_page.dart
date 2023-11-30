import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    dataBaseDataObtained = widget.dataBaseData;
    pageNameObtained = widget.pageName;
    bookNameObtained = widget.bookName;
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

    setState(()  {
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
          },
        ),
        actions: const <Widget>[
          // Other actions
        ],
        title: Text(widget.pageName, style: const TextStyle(color: Colors.white70)),
        backgroundColor: clr_5appBar,
        iconTheme: const IconThemeData(color: Colors.pink), // Change the color here
      ),
      body: SafeArea(
        child: Column(
          children: [
            Messagestream(),
            // buttom_Text_reciever_and_data_in_good_shape(messageSenderControler: messageSenderControler),
          ],
        ),
      ),
      // floatingActionButton: const FoldableOptions(),
    );
  }
}

