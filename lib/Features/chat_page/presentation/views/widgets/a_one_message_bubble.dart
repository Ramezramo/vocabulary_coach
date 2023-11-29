import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_coach/Features/chat_page/presentation/views/widgets/recieve_data_text_field_english_text.dart';
import 'package:vocabulary_coach/Features/chat_page/presentation/views/widgets/single_bubble_shape.dart';

import '../../../../../core/utils/databaseXoperations/update_data_base.dart';
import '../../../../TranslatingAbookFeature/presentation/manager/dataBaseChangedCubit/conge_data_base_cubit.dart';
import '../chat_page.dart';



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
