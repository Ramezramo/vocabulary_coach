import 'package:flutter/material.dart';
import 'package:vocabulary_coach/Features/chat_page/presentation/views/chat_page.dart';
import 'package:vocabulary_coach/Features/phraseTranslationWithdoulingoUi/presentation/views/praseTranslationWithdoulingo.dart';

class DoulingUiOptimizer extends StatefulWidget {
  final String bookNaME;
  final String pageNAme;
  const DoulingUiOptimizer({
    super.key,
    required this.bookNaME,
    required this.pageNAme,
  });

  @override
  State<DoulingUiOptimizer> createState() => _DoulingUiOptimizerState();
}

class _DoulingUiOptimizerState extends State<DoulingUiOptimizer> {
// stopped at nonTranslated has not ben initialized
  Map nonTranslated = {};
  bool viewTextReceiver = false;
  int indexCount = 0;
  late var theText;
  bool loadOrNo = false;
  late List<dynamic> allKeysList;
  late List<String> sortedKeys;
  late List keysList = [];
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

  void dataStacker() {
    for (var element in sortedKeys) {
      String theTranslationSaved = dataBaseDataObtained?["books"]
                  [bookNameObtained][pageNameObtained][element]
              ["user_english_phrase"] ??
          "n";
      if (theTranslationSaved.length < 2) {
        // print(dataBaseDataObtained?["books"][bookNameObtained][pageNameObtained]
        //     [element]);
        nonTranslated.addAll({
          element: dataBaseDataObtained?["books"][bookNameObtained]
              [pageNameObtained][element]
        });
      }
      // print(nonTranslated);
    }

    keysList = nonTranslated.keys.toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getDateFromDb();
    dataStacker();
  }

  PageController pageController = PageController();

  int currentPageIndex = 0;

  void nextPage() {
    if (currentPageIndex < nonTranslated.length - 1) {
      currentPageIndex++;
      pageController.animateToPage(
        currentPageIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double percentage = ((currentPageIndex + 1) /
        nonTranslated
            .length); // Calculate the percentage without multiplying by 100
    String formattedPercentage =
        percentage.toStringAsFixed(2); // Round to two decimal places

    double formattedPercentageAsDouble;
    TextEditingController messageSenderControllergg = TextEditingController();
    formattedPercentageAsDouble = double.parse(formattedPercentage);
    // print(formattedPercentageAsDouble);
    // if (messageSenderControllergg not null)

    return PageTranslationWithDoulingoUi(
      theIncreasingPercentage: formattedPercentageAsDouble,
      bookNaME: widget.bookNaME,
      pageNAme: widget.pageNAme,
      phraseID: keysList[currentPageIndex],
      textInEnglish: nonTranslated[keysList[currentPageIndex]]
          ["english_phrase"],
      textInArabic: nonTranslated[keysList[currentPageIndex]]["arabic_phrase"],
      controllerPage: pageController,
      onPressedRm: () {
        setState(() {
          messageSenderControllergg.clear();
          nextPage();
        });
      }, messageSenderControllergg: messageSenderControllergg,
    );
  }
}
