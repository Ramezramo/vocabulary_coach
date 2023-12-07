
import 'package:flutter/material.dart';
import 'package:vocabulary_coach/Features/chat_page/presentation/views/widgets/single_bubble_shape.dart';

import '../../../../../core/utils/colorConstants.dart';

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
  void textFieldTimer() {
    viewTranslationButton = true;
    Future.delayed(const Duration(seconds: 8), () {
      // After the delay (adjust as needed), set isViewTextFeild to true
      setState(() {
        viewTranslationButton = false;
      });
    });
  }
  // get onPressed => null;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 5.0,
          color: clr_3cardColor1,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 12, right: 20),
              child: TextField(
                controller: widget.messageSenderController ,
                onChanged: (value) {},
                maxLines: null,
                style:  TextStyle(color: clr_textColor),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: clr_textColor,
                  hoverColor: clr_textColor,
                  hintStyle: TextStyle(color: clr_textColor),
                  hintText: 'Enter your translation here...',
                  suffixIcon: IconButton(
                    onPressed: widget.onPressed,
                    icon:  Icon(Icons.save,color: clr_textColor),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (!viewTranslationButton)
          viewTranslationOrHideButton(context, "view translation", () {
            setState(() {
              textFieldTimer();
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
      decoration:  BoxDecoration(
        color: clr_3cardColor1,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: onPressed,
        child: Text(containerText,style:  TextStyle(color:clr_textColor)),
      ),
    );
  }
}
