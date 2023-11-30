
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_coach/Features/TranslatingAbookFeature/presentation/manager/featureCubit/getting_page_cubit.dart';
import '../../../../core/utils/databaseXoperations/update_data_base.dart';
import '../../../../core/widgets/skeltonloading.dart';
import 'widgets/viewDataInGoodContainer.dart';
import '../../../TranslatingAbookFeature/presentation/manager/dataBaseChangedCubit/class_check_if_there_is_change_in_db.dart';


final databaseReference = FirebaseDatabase.instance.reference();

class InsideBookPage extends StatefulWidget {
  final Map<String, dynamic> dataBaseData;

  final String pageName;

  final String bookName;

  const InsideBookPage(
      {super.key,
      required this.dataBaseData,
      required this.pageName,
      required this.bookName});

  @override
  State<InsideBookPage> createState() => _InsideBookPageState();
}

class _InsideBookPageState extends State<InsideBookPage> {
  bool viewTextReceiver = false;
  int indexCount = 0;
  late var theText;
  bool loadOrNo = false;
  late List<dynamic> allKeysList;
  late List<String> sortedKeys;

  Future getDateFromDb() async {
    theText = widget.dataBaseData["books"][widget.bookName][widget.pageName];
    print("34958_345987");

    Set<dynamic> allKeys = theText.keys.toSet();

    allKeysList = allKeys.toList();

    sortedKeys = theText.keys.toList()
      ..sort((a, b) {
        int countA = int.tryParse(theText[a]["count"].toString()) ?? 0;
        int countB = int.tryParse(theText[b]["count"].toString()) ?? 0;

        return countA.compareTo(countB);
      });
  }


  @override
  void initState() {
    super.initState();
    getDateFromDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF628EEC),
      body: BlocConsumer<GettingPageCubit, GettingPageState>(
        listener: (context, state) {},
        builder: (context, state) {
          // phraseRandomName =
          return loadOrNo
              ? ListView.separated(
                  itemCount: 5,
                  itemBuilder: (context, index) => const NewsCardSkelton(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16.0),
                )
              : SafeArea(
                  child: ListView.builder(
                    itemCount: sortedKeys.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      late bool addedNewTranslationFromSetState = false;
                      TextEditingController? textEditingController =
                          TextEditingController();
                      bool savedDataOrNot = false;
                      String theTranslationSaved = widget.dataBaseData["books"]
                              [widget.bookName][widget.pageName]
                          [sortedKeys[index]]["user_translation_to_arabic"];
                      String phraseEnglish = widget.dataBaseData["books"]
                              [widget.bookName][widget.pageName]
                          [sortedKeys[index]]["phrase"];

                      if ((widget.dataBaseData["books"][widget.bookName]
                                      [widget.pageName][sortedKeys[index]]
                                  ["user_translation_to_arabic"])
                              .length <
                          2) {
                        savedDataOrNot = true;
                      }
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () async {
                            // await dataBaseUpdater();
                            if (kDebugMode) {
                              print("hohohohoh");
                              print(widget.dataBaseData["books"]
                                          [widget.bookName][widget.pageName]
                                      [sortedKeys[index]]
                                  ["user_translation_to_arabic"]);
                            }
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize
                                .min, // Set mainAxisSize to MainAxisSize.min
                            children: [
                              ShowTextInAGoodContainer(
                                  textEnglish: false,
                                  borderButtom: false,
                                  thePhrase: phraseEnglish),
                              // if (savedDataOrNot)

                              const SizedBox(height: 20),
                              if (savedDataOrNot &&
                                  !addedNewTranslationFromSetState)
                                ViewedIfNoSavedData(
                                    onPressed: () {
                                      // bookName, pageName, theTranslation
                                      updateTheUserTranslation(
                                          sortedKeys[index],
                                          widget.bookName,
                                          widget.pageName,
                                          textEditingController.text);
                                      CheckIfThereIsAchangeInDB.dbChangedOrNot =
                                          true;
                                    },
                                    index: index,
                                    textEditingController:
                                        textEditingController,
                                    savedDataOrNot: savedDataOrNot,
                                    sortedKeys: sortedKeys,
                                    widget: widget),

                              if (!savedDataOrNot)
                                ShowTextInAGoodContainer(
                                    textEnglish: true,
                                    borderButtom: true,
                                    thePhrase: theTranslationSaved),
                              // if (addedNewTranslationFromSetState)
                              //   ShowTextInAGoodContainer(borderButtom: true,thePhrase: textEditingController.text),

                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}



class ViewedIfNoSavedData extends StatelessWidget {
  final int index;

  final onPressed;

  const ViewedIfNoSavedData({
    super.key,
    required this.textEditingController,
    required this.savedDataOrNot,
    required this.sortedKeys,
    required this.onPressed,
    required this.widget,
    required this.index,
  });

  final TextEditingController? textEditingController;
  final bool savedDataOrNot;
  final List<String> sortedKeys;
  final InsideBookPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              // controller: mytextFieldco,
              controller: textEditingController,
              onChanged: (value) {
              },
              maxLines: null, // Set maxLines to null for multiline
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter your translation here...',
              ),
            ),
            const SizedBox(
                height: 8.0), // Add some spacing between TextField and buttons
            if (savedDataOrNot)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.save),
                    onPressed: onPressed,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
