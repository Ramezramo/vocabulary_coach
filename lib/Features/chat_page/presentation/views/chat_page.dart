import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vocabulary_coach/Features/chat_page/presentation/views/widgets/buttom_Text_reciever_and_data_in_good_shape.dart';
import 'package:vocabulary_coach/Features/chat_page/presentation/views/widgets/phrases_stream.dart';
import '../../../../core/utils/databaseXoperations/read_from_data_base_fb.dart';


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
        leading: null,
        actions: <Widget>[
          // Text(last_hot_reload),
          IconButton(icon: const Icon(Icons.close), onPressed: () {}),
        ],
        // title: const Text('Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Messagestream(),
            buttom_Text_reciever_and_data_in_good_shape(messageSenderControler: messageSenderControler),
          ],
        ),
      ),
    );
  }
}

