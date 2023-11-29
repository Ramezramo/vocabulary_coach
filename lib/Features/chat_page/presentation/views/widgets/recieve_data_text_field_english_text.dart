
import 'package:flutter/material.dart';
import 'package:vocabulary_coach/Features/chat_page/presentation/views/widgets/single_bubble_shape.dart';

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
