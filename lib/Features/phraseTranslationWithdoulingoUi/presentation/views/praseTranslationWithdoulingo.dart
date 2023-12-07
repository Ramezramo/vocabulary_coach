import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/colorConstants.dart';
import '../../../../core/utils/databaseXoperations/update_data_base.dart';
import '../../../../core/widgets/AddingNewWordColumnTextFAndButtons.dart';
import '../../../../core/widgets/linear_precent_indicator.dart';
import '../../../TranslatingAbookFeature/presentation/manager/dataBaseChangedCubit/conge_data_base_cubit.dart';
import '../../../chat_page/presentation/manager/mapContainTheMessagesWithTheRandomCode.dart';

class PageTranslationWithDoulingoUi extends StatefulWidget {
  final String textInEnglish;
  final String textInArabic;
  final PageController? controllerPage;
  final Function()? onPressedRm;
  final String phraseID;
  final String bookNaME;
  final String pageNAme;
  final double theIncreasingPercentage;
  final TextEditingController messageSenderControllergg;
  const PageTranslationWithDoulingoUi(
      {Key? key,
      required this.textInEnglish,
      required this.textInArabic,
      this.controllerPage,
      this.onPressedRm,
      required this.phraseID,
      required this.bookNaME,
      required this.pageNAme,
      required this.theIncreasingPercentage,
      required this.messageSenderControllergg})
      : super(key: key);

  @override
  State<PageTranslationWithDoulingoUi> createState() =>
      _PageTranslationWithDoulingoUiState();
}

class _PageTranslationWithDoulingoUiState
    extends State<PageTranslationWithDoulingoUi> {
  // get messageSenderController => null;

  // Function to show the pop-up
  Future<void> _showPopup(BuildContext context, text) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        // Your custom pop-up content goes here
        return AlertDialog(
          title: const Text('Original Text Translation',
              style: TextStyle(fontSize: 18)),
          content: Text(text),
          actions: [
            TextButton(
              onPressed: () {
                // Close the pop-up
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showPopupWordAdding(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        // Your custom pop-up content goes here
        return AlertDialog(
          title: const Text('Add Word', style: TextStyle(fontSize: 18)),
          content: SizedBox(height: 197,child: ButtonAndTextField()),
          // ButtonAndTextField(),
          actions: [
            TextButton(
              onPressed: () {
                // Close the pop-up
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
  // TextEditingController messageSenderControllergg = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // messageSenderControllergg.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF131F22),
      body: PageView(controller: widget.controllerPage, children: [
        SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  children: [
                    Column(
                      children: [
                        LinearIndicatorRow(
                            percent: widget.theIncreasingPercentage),
                        const Text(
                          "Translate to English",
                          style: TextStyle(fontSize: 24, color: Colors.white70),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 17,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 0.6,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                textDirection: TextDirection.rtl,
                                widget.textInArabic,
                                style: TextStyle(
                                    fontSize: 20, color: clr_textColor),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0,left: 9,right: 9),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0XFF202F36),
                              border: Border.all(
                                color: Colors.white,
                                width: 0.6,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: widget.messageSenderControllergg,
                                onChanged: (value) {},
                                maxLines: null,
                                style: const TextStyle(color: Colors.white70),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your translation here...',
                                  hintStyle: TextStyle(color: Colors.white70),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(bottom: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0XFF202F36),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          _showPopup(context, widget.textInEnglish);
                        },
                        child: const Text(
                          'view answer',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Colors.white70),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _showPopupWordAdding(context);
                        },
                        child: const Text(
                          'add word',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Colors.white70),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Add your button onPressed logic here
                          print(widget.messageSenderControllergg);
                          if (widget.messageSenderControllergg.text.length >
                              1) {
                            print("translation saved");
                            print(widget.phraseID);
                            print(widget.bookNaME);
                            print(widget.pageNAme);
                            updateTheUserTranslation(
                              widget.phraseID,
                              widget.bookNaME,
                              widget.pageNAme,
                              widget.messageSenderControllergg.text,
                            );
                            BlocProvider.of<CongeDataBaseCubit>(context)
                                .dataBAseChange();
                            // widget.messageSenderControllergg.clear();
                            // setState(() {
                            //   widget.isViewTextFeild = false;
                            // });
                            // messagesRandomName[widget.phraseID] = messageSenderController.text;
                          }
                        },
                        child: const Text(
                          'save',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Colors.white70),
                        ),
                      ),
                      TextButton(
                        onPressed: widget.onPressedRm,
                        child: const Text(
                          'next',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class LinearIndicatorRow extends StatelessWidget {
  final double percent;
  const LinearIndicatorRow({
    super.key,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0, top: 15.0, left: 15.0),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.close, color: Color(0XFF52656D), size: 27)),
          // const ,
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                  left: 18.0, right: 10), // Adjust the padding as needed
              child: LinearProgressIndicator(
                minHeight: 13,
                color: const Color(0XFF97CF45),
                value: percent,
                semanticsLabel: 'Linear progress indicator',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
