import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/databaseXoperations/read_from_data_base_fb.dart';
import '../../../../core/utils/databaseXoperations/update_data_base.dart';
import '../../../../core/widgets/viewDataInGoodContainer.dart';
import '../../../TranslatingAbookFeature/presentation/manager/dataBaseChangedCubit/conge_data_base_cubit.dart';

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
        title: const Text('Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Messagestream(),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const ShowTextInAGoodContainer(
                        borderButtom: false,
                        textEnglish: true,
                        thePhrase:
                            "heolaskdjfa;lskdgj;sldkgja;lsdkgja;ldkgja;lsgjk",
                      ),
                      TextField(
                        onChanged: (value) {
                          //Do something with the user input.
                        },
                        // controller: pass_Controller,
                        controller: messageSenderControler,
                        decoration:
                            kDecoration("enter your message", 5.0).copyWith(
                          suffixIcon: IconButton(
                            onPressed: () {
                              // DateTime now = new DateTime.now();
                              // dataBaseUpdater();

                              // print(message_sender_controler.text);
                              if (messageSenderControler.text != '' &&
                                  messageSenderControler.text.isNotEmpty) {
                                _firestore.collection('').add({
                                  "text": messageSenderControler.text,
                                  'sender': "",
                                });
                                messageSenderControler.clear();
                              }
                            },
                            icon: const Icon(Icons.send),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
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
    // if (kDebugMode) {
    //   print("34958_345987");
    // }

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
      } else {
        isViewTextFeild = false;
      }

      Messagebubble messageBubble = Messagebubble(phraseArabic, isViewTextFeild,
          element, theTranslationSaved, phraseEnglish);
      messageBubbles.add(messageBubble);
    }

    return Expanded(
        child: ListView(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      shrinkWrap: true,
      children: messageBubbles,
    ));
  }
}

class Messagebubble extends StatelessWidget {
  final String theRandomKey;
  final bool? isViewTextFeild;
  final String text;
  final String translationToEnglish;
  final String phraseEnglish;

  const Messagebubble(
    this.text,
    this.isViewTextFeild,
    this.theRandomKey,
    this.translationToEnglish,
    this.phraseEnglish, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController messageSenderController = TextEditingController();


        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              BubbleContainer(
                textDirection: TextDirection.rtl,
                text: text,
                borderRadiosIsTop: "top",
              ),
              if (isViewTextFeild!)
                TakingUserInputWidget(
                    onPressed: () {
                      // isViewTextFeild = false;

                      updateTheUserTranslation(
                        theRandomKey,
                        bookNameObtained,
                        pageNameObtained,
                        messageSenderController.text,
                      );
                      BlocProvider.of<CongeDataBaseCubit>(context)
                          .dataBAseChange();
                    },
                    messageSenderController: messageSenderController,
                    theRandomKey: theRandomKey,
                    tphraseEnglish: phraseEnglish)
              else
                BubbleContainer(
                  textDirection: TextDirection.ltr,
                  text: translationToEnglish,
                  borderRadiosIsTop: "buttom",
                ),
            ],
          ),

    );
  }
}

class TakingUserInputWidget extends StatefulWidget {
  final String tphraseEnglish;
  final Function() onPressed;

  const TakingUserInputWidget(
      {super.key,
      required this.messageSenderController,
      required this.theRandomKey,
      required this.tphraseEnglish,
      required this.onPressed});

  final TextEditingController messageSenderController;
  final String theRandomKey;

  @override
  State<TakingUserInputWidget> createState() => _TakingUserInputWidgetState();
}

class _TakingUserInputWidgetState extends State<TakingUserInputWidget> {
  bool viewTranslationButton = false;

  // get onPressed => null;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 5.0,
          color: Colors.lightBlue,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 12, right: 20),
              child: TextField(
                controller: widget.messageSenderController ,
                onChanged: (value) {},
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your translation here...',
                  suffixIcon: IconButton(
                    onPressed: widget.onPressed,
                    icon: const Icon(Icons.save),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (!viewTranslationButton)
          viewTranslationOrHideButton(context, "view translation", () {
            setState(() {
              viewTranslationButton = true;
            });
          })
        else
          Column(
            children: [
              BubbleContainer(
                textDirection: TextDirection.ltr,
                text: widget.tphraseEnglish,
                borderRadiosIsTop: "",
              ),
              viewTranslationOrHideButton(context, "hide translation", () {
                setState(() {
                  viewTranslationButton = false;
                });
              }),
            ],
          )
      ],
    );
  }

  Container viewTranslationOrHideButton(
      BuildContext context, containerText, onPressed) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: onPressed,
        child: Text(containerText),
      ),
    );
  }
}

class BubbleContainer extends StatelessWidget {
  final String borderRadiosIsTop;
  final TextDirection textDirection;
  const BubbleContainer(
      {Key? key,
      required this.text,
      required this.borderRadiosIsTop,
      required this.textDirection})
      : super(key: key);

  final String text;

  BorderRadiusGeometry? borderRadiusGeometry() {
    if (borderRadiosIsTop == "top") {
      return const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      );
    } else if (borderRadiosIsTop == "buttom") {
      return const BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      );
    } else {
      return const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = borderRadiusGeometry();
    return Column(
      mainAxisSize: MainAxisSize.min, // Set mainAxisSize to MainAxisSize.min
      children: [
        const SizedBox(
          height: 10,
        ),
        Material(
          borderRadius: borderRadius,
          elevation: 5.0,
          color: Colors.lightBlue,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 12, right: 20),
              child: Text(
                textDirection: textDirection,
                text,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
//there is two ways to do it this is the fisrt one
InputDecoration kDecoration(hintText, double d) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.black26),
    contentPadding:
        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );
}
