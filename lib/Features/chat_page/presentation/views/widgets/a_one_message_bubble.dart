import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_coach/Features/chat_page/presentation/views/widgets/recieve_data_text_field_english_text.dart';
import 'package:vocabulary_coach/Features/chat_page/presentation/views/widgets/single_bubble_shape.dart';

import '../../../../../core/utils/databaseXoperations/update_data_base.dart';
import '../../../../TranslatingAbookFeature/presentation/manager/dataBaseChangedCubit/conge_data_base_cubit.dart';
import '../../manager/mapContainTheMessagesWithTheRandomCode.dart';
import '../chat_page.dart';



class Messagebubble extends StatefulWidget {
  final String theRandomKey;
  bool? isViewTextFeild;
  final String text;
  final String translationToEnglish;
  final String phraseEnglish;

  final String bubbleId;

   Messagebubble(this.bubbleId,
      this.text,
      this.isViewTextFeild,
      this.theRandomKey,
      this.translationToEnglish,
      this.phraseEnglish, {
        Key? key,
      }) : super(key: key);

  @override
  State<Messagebubble> createState() => _MessagebubbleState();
}


class _MessagebubbleState extends State<Messagebubble> {
  TextEditingController messageSenderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // print(messagesRandomName[widget.bubbleId]);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          BubbleContainer(
            textDirection: TextDirection.rtl,
            text: widget.text,
            borderRadiosIsTop: "top",
          ),
          if (widget.isViewTextFeild!)
            TakingUserInputWidget(
                onPressed: () {
                  // isViewTextFeild = false;


                  if (messageSenderController.text.length > 1){
                    updateTheUserTranslation(
                      widget.theRandomKey,
                      bookNameObtained,
                      pageNameObtained,
                      messageSenderController.text,
                    );
                    BlocProvider.of<CongeDataBaseCubit>(context)
                        .dataBAseChange();
                    setState(() {
                      widget.isViewTextFeild = false;
                    });
                    messagesRandomName[widget.bubbleId] = messageSenderController.text;

                  }


                },
                messageSenderController: messageSenderController,
                theRandomKey: widget.theRandomKey,
                tphraseEnglish: widget.phraseEnglish)
          else if (messageSenderController.text.length > 1)
            BubbleContainer(
              textDirection: TextDirection.ltr,
              text: messagesRandomName[widget.bubbleId],
              borderRadiosIsTop: "buttom",
            )else BubbleContainer(
              textDirection: TextDirection.ltr,
              text: messagesRandomName[widget.bubbleId] ??widget.translationToEnglish,
              borderRadiosIsTop: "buttom",
            )
        ],
      ),

    );
  }
}
